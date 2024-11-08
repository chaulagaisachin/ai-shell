#!/bin/bash

# Set variables
PACKAGE_NAME="ai-shell"
VERSION=$(date +%Y%m%d%H%M%S)  # Use a timestamp or version number
OUTPUT_DIR="release"
DEB_DIR="ai-shell"

# Ensure the output directory exists
mkdir -p $OUTPUT_DIR

# Build the .deb package
dpkg-deb --build $DEB_DIR $OUTPUT_DIR/${PACKAGE_NAME}_${VERSION}.deb

# Print success message
echo "Debian package created: $OUTPUT_DIR/${PACKAGE_NAME}_${VERSION}.deb"

