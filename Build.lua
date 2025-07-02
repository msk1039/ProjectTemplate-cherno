-- premake5.lua
workspace "New Project"
   architecture "x64"
   configurations { "Debug", "Release", "Dist" }
   startproject "App"

   -- Workspace-wide build options for MSVC
   filter "system:windows"
      buildoptions { "/EHsc", "/Zc:preprocessor", "/Zc:__cplusplus" }

   -- Workspace-wide build options for macOS
   filter "system:macosx"
      buildoptions { "-Wall", "-Wextra" }
      xcodebuildsettings
      {
         ["MACOSX_DEPLOYMENT_TARGET"] = "11.0",
         ["USE_HEADERMAP"] = "NO",
         ["HEADER_SEARCH_PATHS"] = "$(inherited)",
         ["ALWAYS_SEARCH_USER_PATHS"] = "NO",
      }

OutputDir = "%{cfg.system}-%{cfg.architecture}/%{cfg.buildcfg}"

group "Core"
	include "Core/Build-Core.lua"
group ""

include "App/Build-App.lua"