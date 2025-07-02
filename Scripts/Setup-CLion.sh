#!/bin/bash
#
# This script sets up the project for use with JetBrains CLion.
# It generates the necessary CMake build files.
#

echo "⚙️  Setting up project for CLion..."

pushd ..

# 1. Create a build directory
echo "1. Creating build directory..."
rm -rf build
mkdir build
cd build

# 2. Configure CMake
echo "2. Configuring CMake..."
cmake ..

# 3. Build the project
echo "3. Building project..."
make

cd ..

popd

echo ""
echo "✅ CLion setup complete!"
echo ""
echo "🚀 HOW TO OPEN IN CLION:"
echo "   1. Open CLion."
echo "   2. Go to File > Open."
echo "   3. Select the root 'ProjectTemplate-cherno' folder."
echo "   4. When prompted, open as a CMake project."
echo "   5. CLion will use the existing 'build' directory."
echo ""
