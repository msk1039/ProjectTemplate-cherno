# C++ Project Starter Template

This is a little quick-start project template for C++ projects which utilise a Core/App project architecture. There are two included projects - one called _Core_, and one called _App_. [Premake](https://github.com/premake/premake-core) is used to generate project files.

Core builds into a static library and is meant to contain common code intended for use in multiple applications. App builds into an executable and links the Core static library, as well as provides an include path to Core's code.

The `Scripts/` directory contains build scripts for Windows and Linux, and the `Vendor/` directory contains Premake binaries (currently version `5.0-beta2`).

## Getting Started
1. Clone this repository or use the "Use this template" button on GitHub to quickly set up your own repository based on this template
2. `App/` and `Core/` are the two projects - you can edit the names of these folders and their contents to suit
3. The three included Premake build files are `Build.lua`, `Core/Build-Core.lua` and `App/Build-App.lua` - you can edit these to customise your build configurations, edit the names of your projects and workspace/solution, etc.
4. Open the `Scripts/` directory and run the appropriate `Setup` script to generate projects files. You can edit the setup scripts to change the type of project that is generated:
   - **Windows**: `Setup-Windows.bat` - generates Visual Studio 2022 project files
   - **Linux**: `Setup-Linux.sh` - generates gmake2 Makefiles
   - **macOS (Apple Silicon)**: `Setup-macOS.sh` - generates gmake2 Makefiles for ARM64
   - **macOS (Intel)**: `Setup-macOS-Intel.sh` - generates gmake2 Makefiles for x64
   - **JetBrains CLion**: `Setup-CLion.sh` - configures CMake for cross-platform development

## Building on Different Platforms

### Windows
Run `Scripts/Setup-Windows.bat` to generate Visual Studio project files, then open the solution in Visual Studio.

### Linux  
Run `Scripts/Setup-Linux.sh` to generate Makefiles, then run `make` to build.

### macOS
- **Apple Silicon (M1/M2/M3)**: Run `Scripts/Setup-macOS.sh` to generate ARM64 Makefiles
- **Intel**: Run `Scripts/Setup-macOS-Intel.sh` to generate x64 Makefiles
- Then run `make` to build. Works seamlessly with VS Code.

### JetBrains CLion
CLion works with the included CMake configuration for cross-platform development:

1. **Setup**: Run `Scripts/Setup-CLion.sh` (recommended - tests the build)
2. **Open Project**: In CLion, choose **"Open"** and select the project root directory
3. **Auto-Detection**: CLion will show "Open as CMake Project" - click it
4. **Build Configuration**: Select Debug, Release, or RelWithDebInfo
5. **Run**: Select the "App" target and run

**⚠️ Troubleshooting**: If you see "Cannot find file" errors or "Add new configuration", see `CLION_SETUP.md` for detailed solutions.

**Features**:
- Full IDE integration with debugging, profiling, and code analysis
- Cross-platform CMake configuration
- Automatic architecture detection (ARM64 for Apple Silicon, x64 for Intel)
- Multiple build presets via `CMakePresets.json`

**VS Code Integration**: The project includes VS Code configuration files (`.vscode/`) with:
- Build tasks accessible via `Cmd+Shift+P` → "Tasks: Run Task"
- IntelliSense configuration for C++20
- Recommended extensions for C++ development
- Debug configurations for both architectures

## Included
- Some example code (in `App/Source` and `Core/Source`) to provide a starting point and test
- Simple `.gitignore` to ignore project files and binaries
- Premake binaries for Win/Mac/Linux (`v5.0-beta2`)
- VS Code configuration files (`.vscode/`) with build tasks, IntelliSense, and debugging setup for macOS
- **CMake configuration** for JetBrains CLion and other CMake-based IDEs
- **CMakePresets.json** for standardized build configurations

## License
- UNLICENSE for this repository (see `UNLICENSE.txt` for more details)
- Premake is licensed under BSD 3-Clause (see included LICENSE.txt file for more details)