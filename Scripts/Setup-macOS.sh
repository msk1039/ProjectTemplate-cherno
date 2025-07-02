#!/bin/bash

# Setup script for macOS (including Apple Silicon/ARM)
# This script generates Makefiles using Premake5 for VS Code development

pushd ..
Vendor/Binaries/Premake/macOS/premake5 --cc=clang --file=Build.lua gmake2
popd

echo "Makefile project files generated successfully!"
echo "You can now build the project using 'make' or VS Code tasks."
echo "Available configurations: make config=debug, make config=release, make config=dist"
