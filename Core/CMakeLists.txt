# Core static library CMakeLists.txt

# Define the Core library
add_library(Core STATIC
    Source/Core/Core.cpp
    Source/Core/Core.h
)

# Set target properties
target_include_directories(Core
    PUBLIC
        Source
    PRIVATE
        Source/Core
)

# Compiler-specific settings
target_compile_features(Core PRIVATE cxx_std_20)

# Platform-specific settings for Core
if(APPLE)
    set_target_properties(Core PROPERTIES
        OSX_ARCHITECTURES "${CMAKE_OSX_ARCHITECTURES}"
    )
endif()

# Add alias for consistent naming
add_library(NewProject::Core ALIAS Core)
