#!/bin/bash

# Setup script for Intel Macs (x64 architecture)
# This script generates Makefiles using Premake5 for VS Code development

pushd ..
Vendor/Binaries/Premake/macOS/premake5 --cc=clang --arch=x64 --file=Build.lua gmake2
popd

echo "Makefile project files generated successfully for Intel x64!"
echo "You can now build the project using 'make' or VS Code tasks."
echo "Available configurations: make config=debug, make config=release, make config=dist"
echo "Architecture: x64 (Intel)"
