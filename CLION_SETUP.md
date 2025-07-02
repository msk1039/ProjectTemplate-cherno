# CLion Setup Troubleshooting Guide

## 🎯 **How to Open Project in CLion**

### **Method 1: Recommended**
1. **Open CLion**
2. **Choose "Open"** (NOT "New Project")
3. **Navigate to project root** and select the folder containing `CMakeLists.txt`
4. **CLion will detect CMake** and show "Open as CMake Project"
5. **Click "Open as CMake Project"**
6. **Wait for indexing** (can take 1-2 minutes)

### **Method 2: If CMake isn't detected**
1. Open the project folder in CLion
2. Go to **File → Open** 
3. Select the `CMakeLists.txt` file directly
4. Choose "Open as Project"

## 🐛 **Common Issues & Solutions**

### **Issue: "Cannot find file 'Core.h'"**
**Causes:**
- CLion hasn't properly loaded the CMake project
- CMake cache is corrupted
- Project structure not recognized

**Solutions:**
1. **Reset CMake Cache:**
   - `Tools → CMake → Reset Cache and Reload Project`
2. **Force reload:**
   - `Tools → CMake → Reload CMake Project`
3. **Check project structure:**
   - Make sure you opened the ROOT directory (with CMakeLists.txt)
   - Not a subdirectory

### **Issue: "Cannot resolve symbol 'Core'"**
**Causes:**
- Include paths not set up correctly
- CMake targets not linked properly

**Solutions:**
1. **Verify CMake configuration:**
   - Check that both `Core` and `App` targets appear in Run Configurations
2. **Rebuild project:**
   - `Build → Clean`
   - `Build → Rebuild Project`

### **Issue: "Add new configuration" instead of App target**
**Causes:**
- CMake project not properly loaded
- No executable targets detected

**Solutions:**
1. **Verify CMake project loaded:**
   - Look for "CMake" tool window at bottom
   - Should show `Core` and `App` targets
2. **Manual target creation:**
   - Run/Debug Configurations → Add → CMake Application
   - Target: `App`
   - Executable: `App`

### **Issue: Build fails with architecture errors**
**Causes:**
- Conflicting architecture settings
- Old build cache

**Solutions:**
1. **Clean everything:**
   ```bash
   rm -rf build/
   rm -rf cmake-build-*/
   ```
2. **Run setup script:**
   ```bash
   Scripts/Setup-CLion.sh
   ```

## ✅ **Verification Steps**

After opening in CLion, verify:

1. **CMake Tool Window:**
   - Should show at bottom of IDE
   - Lists `Core` (library) and `App` (executable)

2. **Run Configuration:**
   - Top-right dropdown should show "App"
   - Not showing "Add configuration..."

3. **Project Structure:**
   - Left panel shows proper folder structure
   - No red underlines on `#include "Core/Core.h"`

4. **IntelliSense:**
   - Code completion works
   - Can navigate to Core.h by Ctrl+Click

## 🔧 **Manual CMake Setup (if needed)**

If automatic detection fails:

1. **Open Terminal in CLion** (`View → Tool Windows → Terminal`)
2. **Run commands:**
   ```bash
   mkdir -p build && cd build
   cmake -DCMAKE_BUILD_TYPE=Debug ..
   make
   ```
3. **Reload CMake project** in CLion

## 📋 **System Requirements**

- **CLion 2023.1+** (recommended)
- **CMake 3.20+**
- **C++20 compatible compiler**
- **macOS 11.0+** (for Apple Silicon features)

## 🆘 **Still Having Issues?**

1. **Check CLion version** - make sure it's recent
2. **Check CMake version** - `cmake --version` should be 3.20+
3. **Try with a simple project** first to verify CLion setup
4. **Check CLion logs** - `Help → Diagnostic Tools → Show Log in Finder`

Remember: The key is making sure CLion recognizes this as a **CMake project**, not just opening random files!
