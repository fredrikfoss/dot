CONF_DIR := home
TARGET_DIR := $(HOME)

CONFIGS := $(sort $(filter-out all list help,$(shell grep -E '^[a-zA-Z0-9_-]+:' $(MAKEFILE_LIST) |\
	cut -d ':' -f 1)) \
	$(patsubst $(CONF_DIR)/.config/%,%,$(wildcard $(CONF_DIR)/.config/*)))

define LINK
	@mkdir -p $(dir $(TARGET_DIR)/$(1))
	@test -L $(TARGET_DIR)/$(1) || rm -rf $(TARGET_DIR)/$(1)
	@ln -sfnr $(CONF_DIR)/$(1) $(TARGET_DIR)/$(1)
	@echo "$(notdir $(1)) -> $(TARGET_DIR)/$(1)"
endef

help:
	@echo "usage:"
	@echo "    make [target]"
	@echo
	@echo "targets:"
	@echo "    help       # print this message"
	@echo "    list       # print configs"
	@echo "    all        # setup all configs"
	@echo "    <config>   # setup single config"

list:
	@for config in $(CONFIGS); do echo $$config; done

all: $(CONFIGS)

$(patsubst $(CONF_DIR)/.config/%,%,$(wildcard $(CONF_DIR)/.config/*)):
	$(call LINK,.config/$@)

bash:
	$(call LINK,.profile)
	$(call LINK,.bashrc)
	$(call LINK,.inputrc)
	$(call LINK,.dircolors)
	$(call LINK,.infokey)

vim:
	$(call LINK,.vimrc)
	$(call LINK,.vim/colors)
	$(call LINK,.vim/autoload/plug.vim)
	@mkdir -p $(TARGET_DIR)/.vim/undo
	@mkdir -p $(TARGET_DIR)/.vim/spell
	@mkdir -p $(TARGET_DIR)/.local/share/vim/plug

bin snips templates:
	$(call LINK,$@)

tmux:
	$(call LINK,.tmux.conf)

gpg:
	$(call LINK,.gnupg/gpg.conf)
