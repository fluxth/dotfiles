.PHONY: install update clean platform

install: platform .packages.lock update

update: platform
	$(info Symlinking dotfiles...)
	stow bin
	stow editor
	stow gui
	stow media
	stow personal
	stow shell

clean: platform .packages.lock
	$(info Removing symlinks to dotfiles...)
	stow -D bin
	stow -D editor
	stow -D gui
	stow -D media
	stow -D personal
	stow -D shell

platform:
ifeq ($(OS),Windows_NT)
	$(info Windows platform is not supported!)
	@exit 1
endif

UNAME_S := $(shell uname -s)

.packages.lock:
	$(info Installing packages...)
	@./scripts/install_common.sh

ifeq ($(UNAME_S),Linux)
	$(info OS Detected: Linux)
	@pacman -V > /dev/null && cd scripts && ./install_archlinux.sh
endif
ifeq ($(UNAME_S),Darwin)
	$(info OS Detected: macOS)
	@brew -v > /dev/null || (/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)")
	@cd scripts && ./install_macos.sh
endif

	@./scripts/postinstall_common.sh
	@touch .packages.lock

