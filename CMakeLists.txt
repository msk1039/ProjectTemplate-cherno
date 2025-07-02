cmake_minimum_required(VERSION 3.20)

# Project name and version
project(NewProject VERSION 1.0.0 LANGUAGES CXX)

# Set C++ standard
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Set build type if not specified
if(NOT CMAKE_BUILD_TYPE)
    set(CMAKE_BUILD_TYPE Debug)
endif()

# Platform-specific settings
if(APPLE)
    # macOS settings
    set(CMAKE_OSX_DEPLOYMENT_TARGET "11.0")
    add_compile_definitions(MACOS)
    
    # Set architecture for Apple Silicon vs Intel
    if(NOT CMAKE_OSX_ARCHITECTURES)
        # Default to native architecture (arm64 for Apple Silicon, x86_64 for Intel)
        execute_process(
            COMMAND uname -m
            OUTPUT_VARIABLE ARCH
            OUTPUT_STRIP_TRAILING_WHITESPACE
        )
        if(ARCH STREQUAL "arm64")
            set(CMAKE_OSX_ARCHITECTURES "arm64")
        else()
            set(CMAKE_OSX_ARCHITECTURES "x86_64")
        endif()
    endif()
    
    # Compiler flags for macOS
    add_compile_options(-Wall -Wextra)
    
elseif(WIN32)
    # Windows settings
    add_compile_definitions(WINDOWS)
    
    # MSVC specific flags
    if(MSVC)
        add_compile_options(/EHsc /Zc:preprocessor /Zc:__cplusplus)
    endif()
    
elseif(UNIX)
    # Linux settings
    add_compile_definitions(LINUX)
    add_compile_options(-Wall -Wextra)
endif()

# Configuration-specific settings
if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    add_compile_definitions(DEBUG)
elseif(CMAKE_BUILD_TYPE STREQUAL "Release")
    add_compile_definitions(RELEASE)
elseif(CMAKE_BUILD_TYPE STREQUAL "RelWithDebInfo")
    add_compile_definitions(RELEASE)
endif()

# Output directories
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)

# Add subdirectories
add_subdirectory(Core)
add_subdirectory(App)
