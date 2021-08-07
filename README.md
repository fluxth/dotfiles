# fluxth's personal configuration files

Maybe unstable, use with caution!

## Requirements

- **Platform** 
  - Linux (Package install currently only supported on Arch Linux)
  - macOS
  - _Windows is not supported!_

- **Dependencies** - These software must be avaliable on `PATH` before installing dotfiles
  - stow
  - curl

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

To clean your XDG directories before linking, run:
```bash
./dotfiles.sh clean
```

You can also chain actions:
```bash
./dotfiles.sh clean full-install
```

For help, run:
```bash
./dotfiles.sh --help
```

