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
  - cURL: `curl` (For package install only)

- **Platform-based Dependencies** - If you are using the following platforms, and wish to use the package install feature.
  - Arch Linux: [`yay`](https://github.com/Jguer/yay)
  - macOS: Xcode or Xcode command-line tools: `xcode-select --install`

## Installation

To link dotfiles to your XDG directories, run:
```bash
./dotfiles.sh link
```

To unlink previously linked dotfiles, run:
```bash
./dotfiles.sh unlink
```

To install base (minimal) packages then link dotfiles, run:
```bash
./dotfiles.sh install base
```

To install a Linux desktop, run:
```bash
./dotfiles.sh install base desktop
# or
./dotfiles.sh install base desktop extra
```

To install extra packages, run:
```bash
./dotfiles.sh install extra
```

To detect and clean your target directory of link conflicts, run:
```bash
./dotfiles.sh clean
```

For help, run:
```bash
./dotfiles.sh --help
```
