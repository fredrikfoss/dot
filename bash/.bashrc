#!bash
# shellcheck disable=SC2239 disable=SC1090 disable=SC1091

case $- in
*i*) ;; # interactive
*) return ;;
esac

# ---------------------- local utility functions -----------------------

_have() { type "$1" &>/dev/null; }
_source_if() { [[ -r "$1" ]] && source "$1"; }

# ----------------------- environment variables ------------------------
#                            (also see envx)

export XDG_DATA_HOME="$HOME/.local/share"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_STATE_HOME="$HOME/.local/state"
export LANG="en_US.UTF-8"
export USER="${USER:-$(whoami)}"
export GITUSER=fredrikfoss
export REPOS="$HOME/Repos"
export GHREPOS="$REPOS/github.com/$GITUSER"
export DOTFILES="$GHREPOS/dot"
export SCRIPTS="$DOTFILES/scripts"
export SNIPPETS="$DOTFILES/snippets"
export HELP_BROWSER=lynx
export DESKTOP="$HOME/Desktop"
export DOCUMENTS="$HOME/Documents"
export DOWNLOADS="$HOME/Downloads"
export TEMPLATES="$HOME/Templates"
export PUBLIC="$HOME/Public"
export PRIVATE="$HOME/Private"
export PICTURES="$HOME/Pictures"
export MUSIC="$HOME/Music"
export VIDEOS="$HOME/Videos"
export PDFS="$HOME/usb/pdfs"
export EPUBS="$HOME/usb/epubs"
export VIRTUALMACHINES="$HOME/VirtualMachines"
export WORKSPACES="$HOME/Workspaces" # container home dirs for mounting
export ZETDIR="$GHREPOS/zet"
export TMPDIR=/tmp
# export TEMPDIR=/tmp
# export TERM='xterm-256color'
# export TERMINFO="$XDG_DATA_HOME/terminfo"
# export TERMINFO_DIRS="$XDG_DATA_HOME/terminfo"
export EDITOR='vi'
export VISUAL='vi'
export EDITOR_PREFIX='vi'
export MANPAGER='less -M +Gg'
export NPM_CONFIG_USERCONFIG="$XDG_CONFIG_HOME/npm/npmrc"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export TEALDEER_CONFIG_DIR="$XDG_CONFIG_HOME/tealdeer"
export GOPRIVATE="github.com/$GITUSER/*,gitlab.com/$GITUSER/*"
# export GOPATH="$HOME/.local/go
export GOBIN="$HOME/.local/bin"
export GOPROXY=direct
export CGO_ENABLED=0
export PYTHONDONTWRITEBYTECODE=2
export LC_COLLATE=C
export CFLAGS="-Wall -Wextra -Werror -O0 -g -fsanitize=address -fno-omit-frame-pointer -finstrument-functions"

export LESS="-FXR"
export LESS_TERMCAP_mb=$'\e[91m'     # begin bold
export LESS_TERMCAP_md=$'\e[93m'     # begin blink
export LESS_TERMCAP_so=$'\e[104;97m' # begin reverse video
export LESS_TERMCAP_us=$'\e[04;97m'  # begin underline
export LESS_TERMCAP_me=$'\e[0m'      # reset bold/blink
export LESS_TERMCAP_se=$'\e[0m'      # reset reverse video
export LESS_TERMCAP_ue=$'\e[0m'      # reset underline
export GROFF_NO_SGR=1                # for konsole and gnome-terminal

export ANSIBLE_CONFIG="$HOME/.config/ansible/config.ini"
export ANSIBLE_INVENTORY="$HOME/.config/ansible/inventory.yaml"
export ANSIBLE_LOAD_CALLBACK_PLUGINS=1
# export ANSIBLE_STDOUT_CALLBACK=json

# PERL_MM_OPT="INSTALL_BASE=$HOME/.local/share/perl5" cpan local::lib
export PERL_LOCAL_LIB_ROOT="$HOME/.local/share/perl5"
export PERL_MB_OPT="--install_base $PERL_LOCAL_LIB_ROOT"
export PERL_MM_OPT="INSTALL_BASE=$PERL_LOCAL_LIB_ROOT"
export PERL5LIB="$PERL_LOCAL_LIB_ROOT/lib/perl5"

# export DOCKER_HOST=unix:///run/user/$(id -u)/docker.sock

[[ -d /.vim/spell ]] && export VIMSPELL=("$HOME/.vim/spell/*.add")

# Disable /etc/bashrc_Apple_Terminal Bash sessions on Mac
# Also, create a ~/.bash_sessions_disable to be sure
export SHELL_SESSION_HISTORY=0

# Disable Alacritty icon bouncing for interactive shells on macos
# Refer to: https://is.gd/8MPdGh
case "$-" in
*i*) printf "\033[?1042l" ;;
esac

# ------------------------------- path ---------------------------------

pathprepend() {
	local arg
	for arg in "$@"; do
		test -d "$arg" || continue
		PATH=${PATH//:"$arg:"/:}
		PATH=${PATH/#"$arg:"/}
		PATH=${PATH/%":$arg"/}
		export PATH="$arg${PATH:+":${PATH}"}"
	done
} && export -f pathprepend

pathappend() {
	local arg
	for arg in "$@"; do
		test -d "$arg" || continue
		PATH=${PATH//":$arg:"/:}
		PATH=${PATH/#"$arg:"/}
		PATH=${PATH/%":$arg"/}
		export PATH="${PATH:+"$PATH:"}$arg"
	done
} && export -f pathappend

# remember last arg will be first in path
pathprepend \
	"$HOME/.local/bin" \
	"$HOME/.local/share/perl5/bin" \
	"$SCRIPTS"

pathappend \
	/opt/homebrew/opt/coreutils/libexec/gnubin \
	/opt/homebrew/opt/findutils/libexec/gnubin \
	/opt/homebrew/opt/grep/libexec/gnubin \
	/opt/homebrew/opt/gnu-tar/libexec/gnubin \
	/opt/homebrew/opt/ed/libexec/gnubin \
	/opt/homebrew/opt/python/libexec/bin \
	/opt/homebrew/opt/gnu-indent/libexec/gnubin \
	/opt/homebrew/opt/gnu-sed/libexec/gnubin \
	/opt/homebrew/opt/gnu-which/libexec/gnubin \
	/opt/homebrew/opt/gawk/libexec/gnubin \
	/opt/homebrew/opt/gnu-units/libexec/gnubin \
	/opt/homebrew/opt/file-formula/bin \
	/opt/homebrew/opt/libressl/bin \
	/opt/homebrew/opt/bzip2/bin \
	/opt/homebrew/opt/m4/bin \
	/opt/homebrew/opt/gnu-getopt/bin \
	/opt/homebrew/opt/make/libexec/gnubin \
	/opt/homebrew/opt/zip/bin \
	/opt/homebrew/opt/unzip/bin \
	/opt/homebrew/opt/curl/bin \
	/opt/homebrew/opt/llvm/bin \
	/opt/homebrew/opt/openjdk/bin \
	/opt/homebrew/opt/sqlite/bin \
	/opt/homebrew/opt/bc/bin \
	/opt/homebrew/sbin \
	/opt/homebrew/bin \
	/usr/local/sbin \
	/usr/local/bin \
	/usr/sbin \
	/usr/bin \
	/snap/sbin \
	/snap/bin \
	/sbin \
	/bin

# MANPATH="/usr/local/man:/usr/local/share/man:/usr/man:/usr/share/man:$MANPATH"
MANPATH="/opt/homebrew/share/man:$MANPATH"
MANPATH="/opt/homebrew/opt/coreutils/libexec/gnuman:$MANPATH"
MANPATH="/opt/homebrew/opt/make/libexec/gnuman:$MANPATH"

# INFOPATH="/usr/local/info:/usr/local/share/info:/usr/info:/usr/share/info"
INFOPATH="/opt/homebrew/share/info:$INFOPATH"

# ------------------------------ cdpath --------------------------------

export CDPATH=".:$GHREPOS:$DOTFILES:$REPOS:/media/$USER:$HOME"
# TODO Add macos removable media location to cdpath

# ------------------------- bash shell options -------------------------

shopt -s checkwinsize            # enable $COLUMNS and $ROWS
shopt -s expand_aliases          #
shopt -s globstar                # ** recursive glob
shopt -s dotglob                 #
shopt -s extglob                 #
shopt -s histappend              # append to history, don't overwrite
shopt -s histverify              # expand, but don't automatically execute, history expansions
shopt -s nocaseglob              # case-insensitive globbing
shopt -s no_empty_cmd_completion # do not TAB expand empty lines

umask 002 # set preferred umask

# ------------------------------ history -------------------------------

export HISTCONTROL=ignoreboth # ignore duplicates
export HISTSIZE=100000        # amount of history to preserve
export HISTFILESIZE=200000    # max size of history file
export HISTIGNORE='?:??'      # ignore one and two letter commands

set -o vi # vi command line editing mode
shopt -s histappend

# -------------------------------- gpg ---------------------------------

GPG_TTY=$(tty)
export GPG_TTY

# ------------------------------- pager --------------------------------

if [[ -x /usr/bin/lesspipe ]]; then
	export LESSOPEN="| /usr/bin/lesspipe %s"
	export LESSCLOSE="/usr/bin/lesspipe %s %s"
fi

if [[ -x /opt/homebrew/bin/lesspipe.sh ]]; then
	export LESSOPEN="| /opt/homebrew/bin/lesspipe.sh %s"
	export LESSCLOSE="/opt/homebrew/bin/lesspipe.sh %s %s"
fi

# ----------------------------- dircolors ------------------------------

if _have dircolors; then
	if [[ -r "$HOME/.dircolors" ]]; then
		eval "$(dircolors -b "$HOME/.dircolors")"
	else
		eval "$(dircolors -b)"
	fi
fi

# -------------------------- stty annoyances ---------------------------

stty -ixon # disable control-s/control-q tty flow control

# --------------------------- smart prompt -----------------------------

__ps1() {
	local PROMPT='$' OBRACKET='[' CBRACKET=']' AT='@' DIR="${PWD##*/}" \
		r='\[\e[91m\]' g='\[\e[92m\]' b='\[\e[94m\]' \
		x='\[\e[0m\]'

	[[ $EUID == 0 ]] && PROMPT='#' && g=$r # if root
	[[ $PWD = / ]] && DIR=/
	[[ $PWD = "$HOME" ]] && DIR='~'

	PS1="$x$OBRACKET$g\u$g$AT$g\h $b$DIR$x$CBRACKET$PROMPT$x "
}

PROMPT_COMMAND="__ps1"

# ------------------------------ aliases -------------------------------

unalias -a
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias todo='vi ~/Documents/todo.md'
alias '?'=duck
alias '??'=feep
alias '???'=marg
alias dot='cd $DOTFILES'
alias scripts='cd $SCRIPTS'
alias snippets='cd $SNIPPETS'
alias notes='cd ~/Documents/notes && nvim ./20230419203718_index.md'
alias icloud='cd ~/Library/Mobile\ Documents/com~apple~CloudDocs/'
alias ls='ls -CFhv --color=auto'
alias l='ls -Fahlv --color=auto --group-directories-first'
alias dir='dir --color=auto'
alias vdir='vdir --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias tree='tree -a -I .git --charset=ascii'
alias df='df -h'
alias diff='diff --color=auto'
alias temp='cd $(mktemp -d)'
alias view='cd vi -R'
alias clear='printf "\e[H\e[2J"'
alias c='printf "\e[H\e[2J"'
alias more='less'
alias update='brew update; brew upgrade --greedy; brew autoremove; brew cleanup; brew doctor'
alias cht='cht --shell'
alias manpath='echo -e "${MANPATH//:/\\n}"'
alias infopath='echo -e "${INFOPATH//:/\\n}"'
alias updatedb='sudo gupdatedb --localpaths=/ --prunepaths="/Volumes /System" --output="${HOME}/.local/share/glocate/locate.db"'
alias hist='history | grep -P "^\s*\d+\s+(\?|gpt |duck |wiki |marginalia |lynx |google )"'
alias temp='cd $(mktemp -d)'

_have vim && alias vi=vim
_have nvim && alias nv=nvim
_have pinentry-mac && alias pinentry='pinentry-mac'

# ----------------------------- functions ------------------------------

envx() {
	local envfile="${1:-"$HOME/.env"}"
	[[ ! -e "$envfile" ]] && echo "$envfile not found" && return 1
	while IFS= read -r line; do
		name=${line%%=*}
		value=${line#*=}
		[[ -z "${name}" || $name =~ ^# ]] && continue
		export "$name"="$value"
	done <"$envfile"
} && export -f envx

[[ -e "$HOME/.env" ]] && envx "$HOME/.env"

clone() {
	local repo="$1" user
	local repo="${repo#https://github.com/}"
	local repo="${repo#git@github.com:}"
	if [[ $repo =~ / ]]; then
		user="${repo%%/*}"
	else
		user="$GITUSER"
		[[ -z "$user" ]] && user="$USER"
	fi
	local name="${repo##*/}"
	local userd="$REPOS/github.com/$user"
	local path="$userd/$name"
	[[ -d "$path" ]] && cd "$path" && return
	mkdir -p "$userd"
	cd "$userd"
	echo gh repo clone "$user/$name" -- --recurse-submodule
	gh repo clone "$user/$name" -- --recurse-submodule
	cd "$name"
} && export -f clone

# ------------- source external dependencies / completion --------------

# macOS
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"
[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && . "/usr/local/etc/profile.d/bash_completion.sh"

owncomp=(
	zet keg gl auth pomo config sshkey vic pdf ws z
	./build build b ./k8sapp k8sapp ./setup ./cmd run ./run
	foo ./foo cmds ./cmds z bonzai openapi obs
)

for i in "${owncomp[@]}"; do complete -C "$i" "$i"; done

# _have gh && . <(gh completion -s bash)
_have glow && . <(glow completion bash)
# _have goreleaser && . <(goreleaser completion bash 2>/dev/null)
# _have pandoc && . <(pandoc --bash-completion)
# _have gopass && . <(gopass completion bash)
# _have podman && _source_if "$HOME/.local/share/podman/completion" # d
# _have docker && _source_if "$HOME/.local/share/docker/completion" # d
# _have docker-compose && complete -F _docker_compose dc # dc
# _have klogin && . <(klogin completion bash 2>/dev/null)
# _have kubectl && . <(kubectl completion bash 2>/dev/null)
# _have istioctl && . <(istioctl completion bash 2>/dev/null)
# #_have clusterctl && . <(clusterctl completion bash)
# _have k && complete -o default -F __start_kubectl k
# _have kind && . <(kind completion bash)
# _have kompose && . <(kompose completion bash)
# _have helm && . <(helm completion bash)
# _have minikube && . <(minikube completion bash)
# _have conftest && . <(conftest completion bash)
# _have mk && complete -o default -F __start_minikube mk
#
# _have ansible && . <(register-python-argcomplete3 ansible)
# _have ansible-config && . <(register-python-argcomplete3 ansible-config)
# _have ansible-console && . <(register-python-argcomplete3 ansible-console)
# _have ansible-doc && . <(register-python-argcomplete3 ansible-doc)
# _have ansible-galaxy && . <(register-python-argcomplete3 ansible-galaxy)
# _have ansible-inventory && . <(register-python-argcomplete3 ansible-inventory)
# _have ansible-playbook && . <(register-python-argcomplete3 ansible-playbook)
# _have ansible-pull && . <(register-python-argcomplete3 ansible-pull)
# _have ansible-vault && . <(register-python-argcomplete3 ansible-vault)
# # _have ssh-agent && test -z "$SSH_AGENT_PID" && . <(ssh-agent)

# Add tab completion for SSH hostnames
_update_ssh_completion() {
	[[ -e "$HOME/.ssh/config" ]] && {
		complete -o "default" -o "nospace" -W "$(
			awk '/^Host / && !/\*/ && !/ProxyCommand/ && !/HostName/ { for (i = 2; i <= NF; i++) if ($i !~ "[?*]") print $i }' "$HOME/.ssh/config" | sort -u
		)" ssh scp sftp
	}
}
_update_ssh_completion

# -------------------- personalized configuration ----------------------

_source_if "$HOME/.bash_personal"
_source_if "$HOME/.bash_private"
_source_if "$HOME/.bash_work"

# _have terraform && complete -C /usr/bin/terraform terraform
# _have terraform && complete -C /usr/bin/terraform tf
# _have terraform && complete -C /usr/bin/terraform terraform
# _have terraform && complete -C /usr/bin/terraform tf
# _have terraform && complete -C /usr/bin/terraform terraform
# _have terraform && complete -C /usr/bin/terraform tf
# _have terraform && complete -C /usr/bin/terraform tf
# _have terraform && complete -C /usr/bin/terraform tf
