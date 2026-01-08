# fluxth's personal configuration

This repository contains my development environment configuration.

An install script `dotfiles.sh` is included to manage linking/unlinking of configuration and also to get a fresh install of Linux/macOS up and running with full-fledged packages and configuration in one command!

![Linux Desktop Screenshot](https://raw.githubusercontent.com/fluxth/dotfiles/docs/screenshots/linux_desktop.png)

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
