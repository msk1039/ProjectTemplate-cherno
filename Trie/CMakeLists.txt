# Trie static library CMakeLists.txt

# Define the Trie library
add_library(Trie STATIC
    Source/Trie/Trie.cpp
    Source/Trie/Trie.h
)

# Set target properties
target_include_directories(Trie
    PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/Source
)

# Compiler-specific settings
target_compile_features(Trie PRIVATE cxx_std_20)

# Platform-specific settings for Trie
if(APPLE)
    set_target_properties(Trie PROPERTIES
        OSX_ARCHITECTURES "${CMAKE_OSX_ARCHITECTURES}"
    )
endif()

# Add alias for consistent naming
add_library(NewProject::Trie ALIAS Trie)
