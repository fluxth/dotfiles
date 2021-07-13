.PHONY: install clean

install:
ifeq ($(OS),Windows_NT)
	$(info Windows platform is not supported!)
	@exit 1
endif

	$(info Installing dotfiles...)
	stow bin
	stow editor
	stow gui
	stow media
	stow shell

clean:
ifeq ($(OS),Windows_NT)
	$(info Windows platform is not supported!)
	@exit 1
endif

	$(info Cleaning dotfiles...)
	stow -d bin
	stow -d editor
	stow -d gui
	stow -d media
	stow -d shell
