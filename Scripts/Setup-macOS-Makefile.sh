#!/bin/bash

# Setup script for macOS using Makefiles (alternative to Xcode)
# This script generates Makefile project files using Premake5

pushd ..
Vendor/Binaries/Premake/macOS/premake5 --cc=clang --file=Build.lua gmake2
popd

echo "Makefile project files generated successfully!"
echo "Run 'make' in the root directory to build the project."
echo "Available configurations: make config=debug, make config=release, make config=dist"
