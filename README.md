# fluxth's personal configuration

This repository contains my development environment configuration.

An install script `dotfiles.sh` is included to manage linking/unlinking of configuration and also to get a fresh install of Linux/macOS up and running with full-fledged packages and configuration in one command!

`main` branch is always tracked to my current setup, so it might break sometimes. Use with caution, but feel free to hack around! 😉

![Linux Desktop Screenshot](https://raw.githubusercontent.com/fluxth/dotfiles/docs/screenshots/linux_desktop.png)

## Requirements

**Supported Platforms** 

| OS      | Variant    | dotfiles | Package Install |
|:-------:|:----------:|:--------:|:---------------:|
| Linux   | Arch Linux | ✅ | ✅ |
| Linux   | Manjaro    | ✅ | ✅ |
| Linux   | Fedora     | ✅ | ✅ ₍₁₎ |
| Linux   | Gentoo     | ✅ | 🔄 |
| Linux   | Debian     | ✅ | 🔄 |
| Linux   | *          | ✅ | ❌ |
| macOS   | arm64      | ✅ | ✅ |
| macOS   | x86_64     | ✅ | ✅ |
| Windows | *          | ❌ | ❌ |

(1) - `base` packages only

**Dependencies** - These software must be available on `PATH` before installing dotfiles.

| OS      | Variant    | dotfiles | Package Install |
|:-------:|:----------:|:--------:|:---------------:|
| *       | *          | `stow`   | `curl`          |
| Linux   | Arch Linux |          | [`yay`](https://github.com/Jguer/yay) |
| macOS   | *          |          | [`brew`](https://brew.sh) |

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
