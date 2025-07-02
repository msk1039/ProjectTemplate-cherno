# CLion Final Setup and Verification

Follow these steps to open and verify the project in CLion.

## 1. Open the Project in CLion

1.  **Open CLion.**
2.  Go to **File > Open**.
3.  Navigate to `/Users/meow/Developer/cpp/cherno/cpp-project-template/ProjectTemplate-cherno` and select the `CMakeLists.txt` file.
4.  Click **Open**.
5.  When prompted, choose **Open as Project**.
6.  CLion will start loading the CMake project. This may take a few moments.

## 2. Verify Project Loading

After the project loads, check the following:

1.  **CMake Tool Window:**
    *   The CMake tool window (usually at the bottom) should show the project loaded without errors.
    *   You should see targets like `App`, `Core`, and `premake5`.

2.  **Project View:**
    *   The Project view (usually on the left) should show your project structure, including `App`, `Core`, and `Vendor` directories.

3.  **Code Analysis:**
    *   Open `App/Source/App.cpp`.
    *   Verify that there are no errors, especially for the `#include "Core/Core.h"` line. CLion should be able to resolve this include.
    *   Hover over `Walnut::Application` to ensure CLion can navigate to its definition in `Core.h`.

## 3. Build and Run the Application

1.  **Select Run Configuration:**
    *   In the top-right corner, you should see a dropdown for run/debug configurations.
    *   Select the **App** configuration. If it's not there, you may need to wait for CMake to finish loading or select it from the `Edit Configurations...` menu.

2.  **Build the Project:**
    *   Click the **Build** button (the hammer icon) or go to **Build > Build Project**.
    *   Check the Build tool window for any errors.

3.  **Run the Application:**
    *   Click the **Run** button (the green play icon).
    *   The application should compile and run, and you should see its output in the Run tool window.

## Troubleshooting

*   **"Cannot resolve symbol" errors:** If CLion still can't find `Core.h`, try **Tools > CMake > Reset Cache and Reload Project**.
*   **No Run Configurations:** If you don't see the `App` run configuration, go to **Run > Edit Configurations...**, click the **+** button, select **CMake Application**, and set the **Target** to `App`.
*   **Build Fails:** If the build fails, carefully read the error messages in the Build tool window. They will often point to the exact problem.

If you have followed all these steps and are still facing issues, please let me know what errors you are seeing.
