# fluxth's personal configuration

This repository contains my development environment configuration.

An install script `dotfiles.sh` is included to manage linking/unlinking of configuration and also to get a fresh install of Linux/macOS up and running with full-fledged packages and configuration in one command!

`main` branch is always tracked to my current setup, so it might break sometimes. Use with caution, but feel free to hack around! 😉

![Linux Desktop Screenshot](https://raw.githubusercontent.com/fluxth/dotfiles/docs/screenshots/linux_desktop.png)

## Requirements

- **Platform** 
  - Linux _(Package install is currently only supported on Arch Linux)_
  - macOS _(Both Intel and ARM-based Macs are supported)_

- **Dependencies** - These software must be avaliable on `PATH` before installing dotfiles.
  - GNU stow: `stow`
  - cURL: `curl`

- **Platform-based Dependencies** - If you are using the following platforms, and wish to use the package install feature.
  - Arch Linux: [`yay`](https://github.com/Jguer/yay)
  - macOS: Xcode or Xcode command-line tools: `xcode-select --install`

## Installation

To link dotfiles to your XDG directories, run:
```bash
./dotfiles.sh
```

To unlink previously linked dotfiles, run:
```bash
./dotfiles.sh unlink
```

To install packages then link dotfiles, run:
```bash
./dotfiles.sh install
```

To install baseline packages, GUI packages and link dotfiles, run:
```bash
./dotfiles.sh full-install
```

To only install extra packages, run:
```bash
./dotfiles.sh extras-install
```

To clean your XDG directories before linking, run:
```bash
./dotfiles.sh clean
```

You can also chain actions:
```bash
./dotfiles.sh clean full-install extras-install
```

For help, run:
```bash
./dotfiles.sh --help
```
