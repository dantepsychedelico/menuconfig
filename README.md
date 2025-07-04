# Menuconfig

A standalone implementation of the Linux kernel's menuconfig system for configuration management.

## Overview

This is a standalone version of the menuconfig interface originally from the Linux kernel. Import from the linux kernel's `scripts/kconfig` directory, it provides a terminal-based configuration interface for managing complex configuration files. It is designed to be used in environments where a graphical interface is not available or practical.

## Features

- **Terminal-based interface**: Uses ncurses for a user-friendly menu system
- **Multiple configuration types**: Supports boolean, tristate, string, integer, and hex parameters
- **Nested menus**: Create hierarchical menu structures
- **Conditional visibility**: Show/hide menu items based on other selections
- **Dependencies**: Define relationships between configuration options
- **Choice groups**: Create mutually exclusive option groups
- **Range validation**: Set min/max values for integer parameters
- **Help text**: Provide detailed descriptions for configuration options

## Dependencies

- **C compiler**: GCC or compatible
- **Make**: For building the project
- **ncurses**: For terminal UI support

## Building

```bash
make
```

This will build the `mconf` executable.

## Usage

```bash
./mconf <config_file>
```

Where `<config_file>` is your configuration definition file.

### Example

```bash
./mconf Kconfig
```

## Configuration File Format

Please refert to the [Kconfig language documentation](https://docs.kernel.org/kbuild/kconfig-language.html) for detailed information on the syntax and features of Kconfig files.
Configuration files use a simple syntax to define menus and options:

```kconfig
mainmenu "Main Menu"

config OPTION_NAME
    bool "Option description"
    default y
    help
        Help text for this option.

choice
    prompt "Choose one"
    default CHOICE1
    
    config CHOICE1
        bool "Choice 1"
    
    config CHOICE2
        bool "Choice 2"
endchoice

menu "Submenu"
    config SUBMENU_OPTION
        tristate "Submenu option"
endmenu
```

## License

GPL-2.0 - See LICENCE.md for details.

## Credits

Based on the Linux kernel's menuconfig system.
Forked from https://github.com/TheGeorge/menuconfig
Copyright (C) 2025 [Zac]
