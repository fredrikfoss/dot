SOURCE := home
TARGET := $(HOME)

CONFIGS := $(sort $(filter-out help list all,$(shell grep -E '[a-zA-Z0-9_-]+:$$' $(MAKEFILE_LIST) |\
	cut -d ':' -f 1)) \
	$(patsubst $(SOURCE)/.config/%,%,$(wildcard $(SOURCE)/.config/*)))

define LINK
	@mkdir -p $(dir $(TARGET)/$(1))
	@test -L $(TARGET)/$(1) || rm -rf $(TARGET)/$(1)
	@ln -sfnr $(SOURCE)/$(1) $(TARGET)/$(1)
	@printf "%s -> %s\n" "$(notdir $(1))" "$(TARGET)/$(1)"
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
	@for config in $(CONFIGS); do printf "%s\n" "$$config"; done

all: $(CONFIGS)

$(patsubst $(SOURCE)/.config/%,%,$(wildcard $(SOURCE)/.config/*)):
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
	@mkdir -p $(TARGET)/.vim/undo
	@mkdir -p $(TARGET)/.vim/spell

bin snips templates:
	$(call LINK,$@)

tmux:
	$(call LINK,.tmux.conf)

gpg:
	$(call LINK,.gnupg/gpg.conf)
