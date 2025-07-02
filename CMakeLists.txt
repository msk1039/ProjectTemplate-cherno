cmake_minimum_required(VERSION 3.20)

# Project name and version
project(ProjectTemplateCherno VERSION 1.0.0 LANGUAGES CXX)

# Set C++ standard
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Set build type if not specified
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug)
endif()

# --- Platform-specific settings ---
if(APPLE)
    # macOS settings
    set(CMAKE_OSX_DEPLOYMENT_TARGET "11.0" CACHE STRING "macOS Deployment Target")
    add_compile_definitions(MACOS)

    # Set architecture for Apple Silicon vs Intel
    if(NOT CMAKE_OSX_ARCHITECTURES)
        set(CMAKE_OSX_ARCHITECTURES "arm64" CACHE STRING "macOS Architectures")
    endif()

    # Compiler flags for macOS
    add_compile_options(-Wall -Wextra)

elseif(WIN32)
    # Windows settings
    add_compile_definitions(WINDOWS)
    add_compile_options(/W4 /EHsc /Zc:preprocessor /Zc:__cplusplus)

elseif(UNIX AND NOT APPLE)
    # Linux settings
    add_compile_definitions(LINUX)
    add_compile_options(-Wall -Wextra)
endif()

# --- Configuration-specific settings ---
# Debug
add_compile_definitions($<$<CONFIG:Debug>:DEBUG>)
# Release
add_compile_definitions($<$<CONFIG:Release>:RELEASE NDEBUG>)
# Distribution
add_compile_definitions($<$<CONFIG:Dist>:DIST NDEBUG>)

# --- Output directories ---
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin/${CMAKE_BUILD_TYPE})
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib/${CMAKE_BUILD_TYPE})
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib/${CMAKE_BUILD_TYPE})

# --- Add subdirectories ---
add_subdirectory(Core)
add_subdirectory(App)

# --- Set startup project ---
set_property(DIRECTORY App PROPERTY VS_STARTUP_PROJECT App)
