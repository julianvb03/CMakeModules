## Colorized Messages and Package Finder with CMake

This project provides two CMake modules: ColorizedMessages.cmake and FindModulesPF.cmake. These modules allow printing colored messages in the terminal and finding PkgConfig modules, respectively.
Project Structure

``` bash
.
├── CMake
│ ├── ColorizedMessages.cmake
│ └── FindModulesPF.cmake
└── CMakeLists.txt
```

### Using FindModulesPF.cmake

The FindModulesPF.cmake module defines a function to find PkgConfig modules and determine if they are installed on the system.
`search_with_pkg` Function

The `search_with_pkg` function searches for a PkgConfig module and sets a variable to indicate whether the module was found.


## Using ColorizedMessages.cmake

The ColorizedMessages.cmake module allows printing colored messages in the terminal if running on a Linux system and the COLORIZED_MESSAGES option is enabled.

### Color Configuration

- Colors are defined using numeric variables that simulate enumeration behavior `get_color_code Function`.

- The get_color_code function retrieves the ANSI escape sequence corresponding to a color code `print_colored_message Macro`.

- The print_colored_message macro prints a message in the specified color.