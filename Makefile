STOWFLAGS = --ignore=.DS_Store --ignore='Google Drive'

.PHONY: install update clean platform

install: platform .packages.lock update

update: platform
	$(info Symlinking dotfiles...)
	$(info Linking bin)
	@stow bin $(STOWFLAGS)
	$(info Linking editor)
	@stow editor $(STOWFLAGS)
	$(info Linking gui)
	@stow gui $(STOWFLAGS)
	$(info Linking personal)
	@stow personal $(STOWFLAGS)
	$(info Linking shell)
	@stow shell $(STOWFLAGS)

clean: platform .packages.lock
	$(info Removing symlinks to dotfiles...)
	$(info Unlinking bin)
	@stow -D bin $(STOWFLAGS)
	$(info Unlinking editor)
	@stow -D editor $(STOWFLAGS)
	$(info Unlinking gui)
	@stow -D gui $(STOWFLAGS)
	$(info Unlinking personal)
	@stow -D personal $(STOWFLAGS)
	$(info Unlinking shell)
	@stow -D shell $(STOWFLAGS)

platform:
ifeq ($(OS),Windows_NT)
	$(info Windows platform is not supported!)
	@exit 1
endif

UNAME_S := $(shell uname -s)

.packages.lock:
	$(info Running pre-install scripts...)
	@./scripts/preinstall_common.sh

ifeq ($(UNAME_S),Linux)
	$(info OS Detected: Linux)
	@pacman -V > /dev/null && cd scripts && ./preinstall_archlinux.sh
endif
ifeq ($(UNAME_S),Darwin)
	$(info OS Detected: macOS)
	@brew -v > /dev/null || (/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)")
	@cd scripts && ./preinstall_macos.sh
endif

	@./scripts/postinstall_common.sh
	@touch .packages.lock

