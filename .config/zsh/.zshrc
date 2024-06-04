# Use beam cursor at startup
echo -ne '\e[6 q'

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

## BASIC SETUP
umask 077
ZDOTDIR=${ZDOTDIR:-${HOME}/.config/zsh}
ZSHDDIR="${HOME}/.config/zsh.d"

# Setup zinit
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [ ! -d $ZINIT_HOME ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
source "${ZINIT_HOME}/zinit.zsh"

# Load aliases and shortcuts if existent.
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/shortcutrc"
[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc" ] && source "${XDG_CONFIG_HOME:-$HOME/.config}/shell/aliasrc"

# Honestly I have no idea what this does, but it was in the old zshrc.
if [ -f ~/.alert ]; then echo '>>> Check ~/.alert'; fi


## PLUGINS
# Powerlevel10k prompt
zinit ice depth=1
zinit light romkatv/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab


## PATH
if ! [[ "${PATH}" =~ "^${HOME}/.local/bin" ]]; then
	export PATH="$HOME/.local/bin:$PATH"
fi


## HISTORY
HISTFILE="${ZDOTDIR:-${HOME}/.config/zsh}/.zsh_history"
HISTSIZE='64000'
SAVEHIST=$HISTSIZE
setopt appendhistory		# Append history to the history file.
setopt sharehistory			# Share history between all sessions.
setopt hist_ignore_space	# Prevent record in history entry if preceding them with at least one space
setopt hist_ignore_dups		# Ignore duplicates in history.
setopt hist_ignore_all_dups	# Remove older duplicate from history.
setopt hist_save_no_dups	# Don't save duplicates in history file.
setopt hist_find_no_dups	# Don't display duplicates when searching history.

## CHANGE DIRECTORY
DIRSTACKSIZE=20				# Directory stack size.
setopt autocd				# Change directory without typing cd
setopt auto_pushd			# Automatically push directories onto the directory stack.
setopt pushd_silent			# Don't print the directory stack after pushd or popd.
setopt pushd_to_home		# Pushd with no arguments pushes home directory to stack.
setopt pushd_ignore_dups	# Don't push duplicates to the directory stack.


## MISC OPTIONS
setopt noflowcontrol		# Nobody need flow control anymore. Troublesome feature.
setopt extendedGlob			# extended globbing, awesome!
setopt promptsubst			# Turn on command substitution in the prompt (and parameter expansion and arithmetic expansion).
setopt interactivecomments	# Ignore lines prefixed with '#'.
eval "$(fzf --zsh)"			# FZF integration.


## COMPLETION
autoload -Uz compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'	# Case-insensitive completion.
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS} # Add colors to completion.
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu no # no menu selection, use fzf-tab instead.
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color=always $realpath' # Preview cd with fzf.
zstyle ':completion::complete:*' use-cache 1
zstyle ':completion:*:descriptions' format '[%d]' # Group completions by category.
zmodload zsh/complist
compinit
zinit cdreplay -q
_comp_options+=(globdots)	# Include hidden files.


## KEYBINDINGS
bindkey -v	# vi mode
export KEYTIMEOUT=1	# Reduce latency when pressing <ESC>.

bindkey "^[[H" beginning-of-line # Home key
bindkey "^[[1~" beginning-of-line # Home key TTY
bindkey "^[[F" end-of-line # End key
bindkey "^[[4~" end-of-line # End key TTY
bindkey "^[[3~" delete-char #Del key
bindkey "^[[2~" quoted-insert #Insert key
bindkey "^[[A" history-search-backward #Up Arrow
bindkey "^[[B" history-search-forward #Down Arrow
bindkey "^[[1;5C" forward-word # control + right arrow
bindkey "^[[1;5D" backward-word # control + left arrow
bindkey "^H" backward-kill-word # control + backspace
bindkey "^[[3;5~" kill-word # control + delete

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Vim normal mode bindings
bindkey -M vicmd 'k' vi-up-line-or-history
bindkey -M vicmd 'j' vi-down-line-or-history

# Control-e to open current line in $EDITOR, awesome when writting functions or editing multiline commands.
autoload -U edit-command-line
zle -N edit-command-line
bindkey '^e' edit-command-line


## FUNCTIONS
reload () {
	exec "${SHELL}"
}

# Change cursor shape for different vi modes.
function zle-keymap-select {
	case $KEYMAP in
		vicmd) echo -ne '\e[2 q' ;; # block cursor
		*) echo -ne '\e[6 q' ;; # beam cursor
	esac
}
zle -N zle-keymap-select
precmd_functions+=(zle-keymap-select)
