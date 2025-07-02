# App executable CMakeLists.txt

# Define the App executable
add_executable(App
    Source/App.cpp
)

# Link libraries
target_link_libraries(App PRIVATE Core)

# Compiler-specific settings
target_compile_features(App PRIVATE cxx_std_20)

# Platform-specific settings for App
if(APPLE)
    set_target_properties(App PROPERTIES
        OSX_ARCHITECTURES "${CMAKE_OSX_ARCHITECTURES}"
    )
endif()

# Set the startup project (equivalent to Premake's startproject)
set_property(DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR} PROPERTY VS_STARTUP_PROJECT App)
