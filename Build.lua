-- premake5.lua
workspace "New Project"
   configurations { "Debug", "Release", "Dist" }
   startproject "App"

   -- Set architecture based on platform and CPU
   filter "system:macosx"
      -- Default to ARM64 for Apple Silicon, but can be overridden
      if _OPTIONS["arch"] then
         architecture(_OPTIONS["arch"])
      else
         architecture "ARM64"  -- Default for modern Macs (Apple Silicon)
      end
   filter "system:windows or system:linux"
      architecture "x64"    -- For Intel/AMD64 systems
   filter {}

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

group "Trie"
   include "Trie/Build-Trie.lua"
group ""

include "App/Build-App.lua"

-- Custom run target for all platforms
newaction {
   trigger = "run",
   description = "Run the built application",
   execute = function()
      local config = _ARGS[1] or "debug"
      local appPath = ""
      
      if os.target() == "windows" then
         appPath = "Binaries/windows-x64/" .. config .. "/App/App.exe"
      elseif os.target() == "macosx" then
         appPath = "Binaries/macosx-ARM64/" .. config .. "/App/App"
      elseif os.target() == "linux" then
         appPath = "Binaries/linux-x64/" .. config .. "/App/App"
      end
      
      if os.isfile(appPath) then
         print("Running: " .. appPath)
         os.execute(appPath)
      else
         print("Error: Application not found at " .. appPath)
         print("Make sure to build the project first with 'make' or 'make config=" .. config .. "'")
      end
   end
}