#!/bin/bash

# Setup script for JetBrains CLion (CMake-based)
# This script creates a build directory and configures CMake for CLion

echo "Setting up project for JetBrains CLion..."

# Create build directory
mkdir -p build

# Change to build directory
cd build

# Configure CMake with appropriate settings for your platform
if [[ "$OSTYPE" == "darwin"* ]]; then
    # macOS
    echo "Configuring for macOS..."
    cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    # Linux
    echo "Configuring for Linux..."
    cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
    # Windows
    echo "Configuring for Windows..."
    cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_EXPORT_COMPILE_COMMANDS=ON ..
fi

echo ""
echo "✅ CMake configuration complete!"
echo ""
echo "📂 To open in CLion:"
echo "   1. Open CLion"
echo "   2. Choose 'Open' and select the project root directory"
echo "   3. CLion will automatically detect the CMakeLists.txt files"
echo "   4. Select your desired build configuration (Debug/Release)"
echo "   5. Build and run the 'App' target"
echo ""
echo "🔧 Build configurations available:"
echo "   - Debug: Full debug symbols, no optimization"
echo "   - Release: Optimized build, minimal debug info"
echo "   - RelWithDebInfo: Optimized with debug symbols"
echo ""
echo "🚀 The main executable target is 'App'"
