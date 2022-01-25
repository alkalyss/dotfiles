# Basic zsh config.
umask 077
ZDOTDIR=${ZDOTDIR:-${HOME}/.config/zsh}
ZSHDDIR="${HOME}/.config/zsh.d"
HISTFILE="${ZDOTDIR:-${HOME}/.config/zsh}/.zsh_history"
HISTSIZE='64000'
SAVEHIST="${HISTSIZE}"
export TERM="alacritty"
export HISTORY_IGNORE='(ls *|cd *|pwd|exit|clear|reboot|history)'
export TMP="$HOME/tmp"
export TEMP="$TMP"
export TMPDIR="$TMP"
export TMPPREFIX="${TMPDIR}/zsh"

if [ ! -d "${TMP}" ]; then mkdir "${TMP}"; fi

## PATH
if ! [[ "${PATH}" =~ "^${HOME}/.bin" ]]; then
    export PATH="${HOME}/.bin:${PATH}"
fi

if ! [[ "${PATH}" =~ "^${HOME}/.local/bin" ]]; then
    export PATH="$HOME/.local/bin:$PATH"
fi

# COLORS
reset='%f%b'
bold='%B'
black='%F{0}'
blue='%F{33}'
cyan='%F{14}'
green='%F{10}'
orange='%F{172}'
purple='%F{125}'
red='%F{9}'
violet='%F{61}'
white='%F{15}'
yellow='%F{226}'

## FUNCTIONS

# Fancy cd that can cd into parent directory, if trying to cd into file.
# useful with ^F fuzzy searcher.
#cd() {
#    if (( $+2 )); then
#        builtin cd "$@"
#        return 0
#    fi
#
#    if [ -f "$1" ]; then
#        echo "${yellow}cd ${1:h}${NC}" >&2
#        builtin cd "${1:h}"
#    else
#        builtin cd "${@}"
#    fi
#}

#function zshaddhistory() {
#	emulate -L zsh
#	if ! [[ "$1" =~ "${HISTRORY_IGNORE}" ]] ; then
#      		print -sr -- "${1%%$'\n'}"
#      		fc -p
#  	else
#      		return 1
#  	fi
#}

over_ssh() {
    if [ -n "${SSH_CLIENT}" ]; then
        return 0
    else
        return 1
    fi
}

reload () {
    exec "${SHELL}" "$@"
}

escape() {
    # Uber useful when you need to translate weird as fuck path into single-argument string.
    local escape_string_input
    echo -n "String to escape: "
    read escape_string_input
    printf '%q\n' "$escape_string_input"
}


has() {
    lcal string="${1}"
    shift
    local element=''
    for element in "$@"; do
        if [ "${string}" = "${element}" ]; then
            return 0
        fi
    done
    return 1
}

begin_with() {
    local string="${1}"
    shift
    local element=''
    for element in "$@"; do
        if [[ "${string}" =~ "^${element}" ]]; then
            return 0
        fi
    done
    return 1

}

termtitle() {
    case "$TERM" in
        rxvt*|xterm*|nxterm|gnome|screen|screen-*)
            local prompt_host="${(%):-%m}"
            local prompt_user="${(%):-%n}"
            local prompt_char="${(%):-%~}"
            case "$1" in
                precmd)
                    printf '\e]0;%s@%s: %s\a' "${prompt_user}" "${prompt_host}" "${prompt_char}"
                ;;
                preexec)
                    printf '\e]0;%s [%s@%s: %s]\a' "$2" "${prompt_user}" "${prompt_host}" "${prompt_char}"
                ;;
            esac
        ;;
    esac
}

setup_git_prompt() {
    if ! git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
        unset git_prompt
        return 0
    fi

    local git_status git_branch
    git_status=" "
    git_branch=""

    if ! $(git diff --quiet --ignore-submodules --cached); then
        git_status+="${green}+${reset}"
    fi

    if ! $(git diff-files --quiet --ignore-submodules --); then
	git_status+="${yellow}!${reset}"
    fi

    if [ -n "$(git ls-files --other --exclude-standard)" ]; then
	git_status+="${red}?${reset}"
    fi

    if [ "$(git stash list)" ]; then
        git_status="${blue}S${reset}"
    fi

    git_branch="$(git symbolic-ref HEAD 2>/dev/null)"
    git_branch="${git_branch#refs/heads/}"

    if [ "${#git_branch}" -ge 24 ]; then
        git_branch="${git_branch:0:21}..."
    fi

    git_branch="${git_branch:-no branch}"

    if [[ ${git_status} == " " ]]; then
	git_status=""
    fi

    git_prompt="${white}[${violet}${git_branch}${git_status}${white}${reset}]"

}

precmd() {
    # Set terminal title.
    termtitle precmd

    # Set optional git part of prompt.
    setup_git_prompt
}

preexec() {
    # Set terminal title along with current executed command pass as second argument
    termtitle preexec "${(V)1}"

    echo -ne '\e[2 q'
}

man() {
    if command -v vimmanpager >/dev/null 2>&1; then
        PAGER="vimmanpager" command man "$@"
    else
        command man "$@"
    fi
}

dot_progress() {
    # Fancy progress function from Landley's Aboriginal Linux.
    # Useful for long rm, tar and such.
    # Usage:
    #     rm -rfv /foo | dot_progress
    local i='0'
    local line=''

    while read line; do
        i="$((i+1))"
        if [ "${i}" = '25' ]; then
            printf '.'
            i='0'
        fi
    done
    printf '\n'
}


# Le features!
# extended globbing, awesome!
setopt extendedGlob

# Change directory without typing cd
setopt autocd

# zmv -  a command for renaming files by means of shell patterns.
autoload -U zmv

# zargs, as an alternative to find -exec and xargs.
autoload -U zargs

# Turn on command substitution in the prompt (and parameter expansion and arithmetic expansion).
setopt promptsubst

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Control-e to open current line in $EDITOR, awesome when writting functions or editing multiline commands.
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line

# Completion.
autoload -Uz compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'
zmodload zsh/complist
compinit
_comp_options+=(globdots)	# Include hidden files.

# If running as root and nice >0, renice to 0.
if [ "$USER" = 'root' ] && [ "$(cut -d ' ' -f 19 /proc/$$/stat)" -gt 0 ]; then
    renice -n 0 -p "$$" && echo "# Adjusted nice level for current shell to 0."
fi

# Fancy prompt.
if over_ssh; then
    hostStyle="${red}%m${reset}"
else
    hostStyle="${yellow}%m${reset}"
fi

if [[ "${USER}" == "root" ]]; then
    userStyle="${red}%n"
else
    userStyle="${orange}%n"
fi

PROMPT="${bold}${userStyle}"
PROMPT+="${white}@"
PROMPT+="${hostStyle}"
PROMPT+="${white}: ${cyan}%1~"
PROMPT+=' ${git_prompt} '
PROMPT+="
${white}%# "

# Keep history of `cd` as in with `pushd` and make `cd -<TAB>` work.
DIRSTACKSIZE=16
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushd_minus

# Ignore lines prefixed with '#'.
setopt interactivecomments

# Ignore duplicate in history.
setopt hist_ignore_dups

# Prevent record in history entry if preceding them with at least one space
setopt hist_ignore_space

# Nobody need flow control anymore. Troublesome feature.
#stty -ixon
setopt noflowcontrol

# Ensure that / is added after tab complation to directories.
# without disabling it, $LBUFFER does not have the slash at the end
# and it's required for _append_path_to_buffer thing..
#setopt AUTO_PARAM_SLASH
#unsetopt AUTO_REMOVE_SLASH

_select_path_with_fzy() {
    (
        if [ "$1" != '.' ]; then
            if ! [ -d $~1 ]; then
                echo -e "${yellow}The $1 is not a directory.${NC}"  >&2
                return
            fi
            cd $~1
        fi

        find -L . \( -type d -printf "%p/\n" , -type f -print \) 2>/dev/null | cut -c 3- | sort | fzy
    )
}

_append_path_to_buffer() {
    local selected_path

    if ! command -v fzy >/dev/null 2>&1; then
        echo 'No fzy binary found in $PATH.'
        return 1
    fi
    echo
    print -nr "${zle_bracketed_paste[2]}" >/dev/tty
    {
        if [ "${LBUFFER[-1]}" = '/' ]; then
            search_in="${LBUFFER##*[$'\t' ]}"
        else
            search_in='.'
        fi

        selected_path="$(_select_path_with_fzy "${search_in}")"
    } always {
        print -nr "${zle_bracketed_paste[1]}" >/dev/tty
    }
    if [ "${selected_path}" ]; then
        if [[ "${LBUFFER[-1]}" =~ [[:alnum:]] ]]; then
            # if last character is a word character, insert space.
            # before inserting selected path. Useful when one's lazy
            # and use 'vim^F', yet works okay with 'cmd foo=^F'.
            LBUFFER+=" "
        fi
        LBUFFER+="${(q)selected_path}"
    fi
    zle reset-prompt
}
zle -N _append_path_to_buffer
bindkey "^F" _append_path_to_buffer

_history_search_with_fzy() {
    local selected_history_entry

    if ! command -v fzy >/dev/null 2>&1; then
        echo 'No fzy binary found in $PATH.'
        return 1
    fi

    if ! command -v awk >/dev/null 2>&1; then
        echo 'No awk binary found in $PATH.'
        return 1
    fi
    echo

    print -nr "${zle_bracketed_paste[2]}" >/dev/tty
    {
        # The awk is used to filter out duplicates, keeping the most
        # recent entries, while not re-ordering the history list.
        selected_history_entry="$(fc -nrl 1 | awk '!v[$0]++' | fzy)"
    } always {
        print -nr "${zle_bracketed_paste[1]}" >/dev/tty
    }
    if [ "${selected_history_entry}" ]; then
        BUFFER="${selected_history_entry}"
        CURSOR="${#BUFFER}"
    fi
    zle reset-prompt
}
zle -N _history_search_with_fzy
bindkey "^T" _history_search_with_fzy

# ^A to open new terminal in current working directory
# Check `logname` so we won't create new terminal as user after `su`.
_open_new_terminal_here(){
    if \
        [ "${XAUTHORITY}" ] && \
        [ "${DISPLAY}" ] && \
        [ "${LOGNAME}" = "$(logname)" ] && \
        command -v urxvt >/dev/null 2>&1
    then
        # Spawn terminal with clean login shell.
        env -i \
            XAUTHORITY="${XAUTHORITY}" \
            PATH="${PATH}" \
            HOME="${HOME}" \
            DISPLAY="${DISPLAY}" \
            LOGNAME="${LOGNAME}" \
            SHELL="${SHELL}" \
            LANG="${LANG}" \
            urxvt -e "${SHELL}" --login >/dev/null 2>&1 &!
    fi
}
zle -N _open_new_terminal_here
bindkey "^A" _open_new_terminal_here

# Change cursor shape for different vi modes.
function zle-keymap-select () {
    case $KEYMAP in
        vicmd) echo -ne '\e[2 q';;      # block
        viins|main) echo -ne '\e[6 q';; # beam
    esac
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne '\e[6 q'
}
zle -N zle-line-init
echo -ne '\e[6 q' # Use beam shape cursor on startup.
echo -ne "\033]12;Grey\007"

## KEYBINDINGS
bindkey "^[[H" beginning-of-line # Home key
bindkey "^[[1~" beginning-of-line # Home key TTY
bindkey "^[[F" end-of-line # End key
bindkey "^[[4~" end-of-line # End key TTY
bindkey "^[[3~" delete-char #Del key
bindkey "^[[2~" quoted-insert #Insert key
bindkey "^[[A" history-beginning-search-backward #Up Arrow
bindkey "^[[B" history-beginning-search-forward #Down Arrow
bindkey "^[[1;5C" forward-word # control + right arrow
bindkey "^[[1;5D" backward-word # control + left arrow
bindkey "^H" backward-kill-word # control + backspace
bindkey "^[[3;5~" kill-word # control + delete

# Replaced with _history_search_with_fzy
bindkey "^R" history-incremental-pattern-search-backward
bindkey "^S" history-incremental-pattern-search-forward

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/zshnameddirrc"

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

if [ -f ~/.alert ]; then echo '>>> Check ~/.alert'; fi

if [[ $(fgconsole 2>/dev/null) == 1 ]] then
	exec startx &> /dev/null
fi
