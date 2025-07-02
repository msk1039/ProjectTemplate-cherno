#!/bin/bash

# Setup script for macOS (including Apple Silicon/ARM)
# This script generates Makefiles using Premake5 for VS Code development
#
# By default, this will build for ARM64 (Apple Silicon)
# To build for Intel x64 instead, run: 
#   ./Vendor/Binaries/Premake/macOS/premake5 --cc=clang --arch=x64 --file=Build.lua gmake2

pushd ..
Vendor/Binaries/Premake/macOS/premake5 --cc=clang --file=Build.lua gmake2
popd

echo "Makefile project files generated successfully!"
echo "You can now build the project using 'make' or VS Code tasks."
echo "Available configurations: make config=debug, make config=release, make config=dist"
echo "Architecture: ARM64 (Apple Silicon) - to use Intel x64, see comments in this script"
