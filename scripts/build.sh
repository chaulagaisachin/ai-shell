#!/bin/bash

# Set variables
PACKAGE_NAME="ai-shell"
# If a Git tag exists, use it as the version; otherwise, use the timestamp
if [ -z "$(git tag --points-at HEAD)" ]; then
  VERSION=$(date +%Y%m%d%H%M%S)  # Fallback to timestamp if no Git tag
else
  VERSION=$(git describe --tags --abbrev=0)  # Use Git tag if available
fi
OUTPUT_DIR="release"
DEB_DIR="ai-shell"

# Ensure the output directory exists
mkdir -p $OUTPUT_DIR

# Build the .deb package
dpkg-deb --build $DEB_DIR $OUTPUT_DIR/${PACKAGE_NAME}_${VERSION}.deb

# Print success message
echo "Debian package created: $OUTPUT_DIR/${PACKAGE_NAME}_${VERSION}.deb"
