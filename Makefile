SRC_DIR := home
DEST_DIR := $(HOME)

CONFIG_TARGETS := $(sort $(filter-out help list all, \
	$(patsubst %:,%, $(shell grep -E '[a-zA-Z]+:$$' Makefile))) \
	$(notdir $(wildcard $(SRC_DIR)/.config/*)))

define SYMLINK
	@mkdir -p $(dir $(DEST_DIR)/$(1))
	@rm -rf $(DEST_DIR)/$(1)
	@ln -sfr $(SRC_DIR)/$(1) $(DEST_DIR)/$(1)
	@printf "%s -> %s\n" $(notdir $(1)) $(DEST_DIR)/$(1)
endef

help:
	@printf "%s\n" \
		"usage:" \
		"    make [option]" \
		"" \
		"options:" \
		"    <config>   # setup single config" \
		"    all        # setup all configs" \
		"    list       # print configs" \
		"    help       # print this message"

list:
	@printf "%s\n" $(CONFIG_TARGETS)

all: $(CONFIG_TARGETS)

$(notdir $(wildcard $(SRC_DIR)/.config/*)):
	$(call SYMLINK,.config/$@)

bash:
	$(call SYMLINK,.profile)
	$(call SYMLINK,.bashrc)
	$(call SYMLINK,.inputrc)
	$(call SYMLINK,.dircolors)
	$(call SYMLINK,.infokey)

vim:
	$(call SYMLINK,.vimrc)
	$(call SYMLINK,.vim/colors)
	@mkdir -p $(DEST_DIR)/.vim/undo

bin snips templates:
	$(call SYMLINK,$@)

tmux:
	$(call SYMLINK,.tmux.conf)

gpg:
	$(call SYMLINK,.gnupg/gpg.conf)
