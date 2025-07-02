#!/bin/bash
#
# This script sets up the project for use with Visual Studio Code.
# It generates Makefiles using Premake and creates the necessary .vscode configuration.
#

echo "⚙️  Setting up project for VS Code..."

pushd ..

# 1. Generate Makefiles
echo "1. Generating Makefiles..."
./Vendor/Binaries/Premake/macOS/premake5 gmake2

# 2. Create .vscode directory
echo "2. Creating .vscode configuration..."
mkdir -p .vscode

# 3. Create tasks.json
echo "3. Creating tasks.json..."
cat << EOF > .vscode/tasks.json
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Build (Debug)",
            "type": "shell",
            "command": "make config=debug",
            "group": {
                "kind": "build",
                "isDefault": true
            },
            "problemMatcher": ["$gcc"]
        },
        {
            "label": "Build (Release)",
            "type": "shell",
            "command": "make config=release",
            "group": "build",
            "problemMatcher": ["$gcc"]
        },
        {
            "label": "Clean",
            "type": "shell",
            "command": "make clean",
            "group": "build"
        }
    ]
}
EOF

# 4. Create launch.json
echo "4. Creating launch.json..."
cat << EOF > .vscode/launch.json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Debug",
            "type": "cppdbg",
            "request": "launch",
            "program": "\${workspaceFolder}/Binaries/macosx-ARM64/Debug/App/App",
            "args": [],
            "stopAtEntry": false,
            "cwd": "\${workspaceFolder}",
            "environment": [],
            "externalConsole": false,
            "MIMode": "lldb",
            "preLaunchTask": "Build (Debug)"
        }
    ]
}
EOF

# 5. Create c_cpp_properties.json
echo "5. Creating c_cpp_properties.json..."
cat << EOF > .vscode/c_cpp_properties.json
{
    "configurations": [
        {
            "name": "Mac",
            "includePath": [
                "\${workspaceFolder}/**"
            ],
            "defines": [
                "MACOS",
                "DEBUG"
            ],
            "macFrameworkPath": [
                "/System/Library/Frameworks",
                "/Library/Frameworks"
            ],
            "compilerPath": "/usr/bin/clang",
            "cStandard": "c17",
            "cppStandard": "c++20",
            "intelliSenseMode": "macos-clang-arm64"
        }
    ],
    "version": 4
}
EOF

popd

echo ""
echo "✅ VS Code setup complete!"
echo ""
echo "🚀 HOW TO OPEN IN VS CODE:"
echo "   1. Open the 'ProjectTemplate-cherno' folder in VS Code."
echo "   2. Run the build task (Cmd+Shift+B or Ctrl+Shift+B)."
echo "   3. Start debugging (F5)."
echo ""
