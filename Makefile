SRC_DIR := home
DEST_DIR := $(HOME)

CONFIG_TARGETS := $(sort $(filter-out help list all,$(shell grep -E '[a-zA-Z]+:$$' $(MAKEFILE_LIST) |\
	cut -d ':' -f 1)) \
	$(patsubst $(SRC_DIR)/.config/%,%,$(wildcard $(SRC_DIR)/.config/*)))

define SYMLINK
	@mkdir -p $(dir $(DEST_DIR)/$(1))
	@test -L $(DEST_DIR)/$(1) || rm -rf $(DEST_DIR)/$(1)
	@ln -sfnr $(SRC_DIR)/$(1) $(DEST_DIR)/$(1)
	@printf "%s -> %s\n" "$(notdir $(1))" "$(DEST_DIR)/$(1)"
endef

help:
	@printf "%s\n"\
		"usage:"\
		"    make [option]"\
		""\
		"options:"\
		"    <config>   # setup single config"\
		"    all        # setup all configs"\
		"    list       # print configs"\
		"    help       # print this message"

list:
	@for config in $(CONFIG_TARGETS); do printf "%s\n" "$$config"; done

all: $(CONFIG_TARGETS)

$(patsubst $(SRC_DIR)/.config/%,%,$(wildcard $(SRC_DIR)/.config/*)):
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
	@mkdir -p $(DEST_DIR)/.vim/spell

bin snips templates:
	$(call SYMLINK,$@)

tmux:
	$(call SYMLINK,.tmux.conf)

gpg:
	$(call SYMLINK,.gnupg/gpg.conf)
