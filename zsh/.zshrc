# ~/.zshrc - William's zsh config (Crimson Temple)
# Read top to bottom: settings, then tools, then plugins, then looks.

# ---------------------------------------------------------------
# Environment
# ---------------------------------------------------------------
export EDITOR="nvim"
export VISUAL="nvim"
# pipx and other user-installed tools live here
export PATH="$HOME/.local/bin:$PATH"

# ---------------------------------------------------------------
# History
# ---------------------------------------------------------------
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000               # lines kept in memory
SAVEHIST=10000               # lines saved to the file
setopt SHARE_HISTORY         # all open terminals share one history
setopt HIST_IGNORE_ALL_DUPS  # don't store duplicate commands
setopt HIST_IGNORE_SPACE     # commands starting with a space aren't saved
                             # (use this for anything containing a password!)
setopt HIST_REDUCE_BLANKS    # tidy up extra spaces before saving

# ---------------------------------------------------------------
# Quality of life
# ---------------------------------------------------------------
setopt AUTO_CD               # type a folder name to cd into it
setopt INTERACTIVE_COMMENTS  # allow # comments on the command line
setopt NO_BEEP               # silence

# ---------------------------------------------------------------
# Completion (Tab)
# ---------------------------------------------------------------
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select                        # arrow-key menu for completions
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' # case-insensitive matching
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"   # color files like ls does

# ---------------------------------------------------------------
# Keys
# ---------------------------------------------------------------
bindkey -e                   # emacs-style line editing (Ctrl+A start, Ctrl+E end)

# Up/Down search history for commands starting with what you've typed
autoload -Uz up-line-or-beginning-search down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey '^[[A' up-line-or-beginning-search
bindkey '^[[B' down-line-or-beginning-search

# Ctrl+Left / Ctrl+Right jump by word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
# Home / End / Delete
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char

# ---------------------------------------------------------------
# Tools
# ---------------------------------------------------------------
# fzf: Ctrl+R fuzzy history, Ctrl+T fuzzy file picker, Alt+C fuzzy cd
source <(fzf --zsh)
export FZF_DEFAULT_OPTS="
  --color=bg+:#2c3335,bg:-1,fg:#d8d4ce,fg+:#f0ece6
  --color=hl:#e9445e,hl+:#e9445e,info:#8a8681,prompt:#e9445e
  --color=pointer:#e9445e,marker:#e9445e,spinner:#e9445e,header:#8a8681
  --border=rounded --height=40% --layout=reverse"

# zoxide: 'z proj' jumps to the best-matching folder you've visited
eval "$(zoxide init zsh)"

# ---------------------------------------------------------------
# Aliases
# ---------------------------------------------------------------
alias ls='eza --icons --group-directories-first'
alias ll='eza -la --icons --group-directories-first --git'
alias tree='eza --tree --icons'
alias cat='bat --paging=never --style=plain'   # plain output when piped
alias grep='grep --color=auto'
alias update='paru'                            # repo + AUR upgrade in one go
alias vim='nvim'

# Jump straight into configs
alias hyprconf='nvim ~/.config/hypr/hyprland.lua'
alias barconf='nvim ~/.config/waybar/config.jsonc'
alias zshconf='nvim ~/.zshrc'

# Jump into the Kali lab container
kali() {
    ( cd ~/docker/kali && docker compose exec kali zsh )
}

# ---------------------------------------------------------------
# Plugins (order matters: syntax highlighting must be LAST)
# ---------------------------------------------------------------
# Autosuggestions: faded suggestions from history, press -> to accept
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#8a8681'

# Syntax highlighting: red = invalid command, before you press Enter
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=#e9445e,bold'
ZSH_HIGHLIGHT_STYLES[command]='fg=#9aab8f'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=#9aab8f'
ZSH_HIGHLIGHT_STYLES[alias]='fg=#9aab8f'
ZSH_HIGHLIGHT_STYLES[precommand]='fg=#9aab8f,underline'
ZSH_HIGHLIGHT_STYLES[path]='fg=#d8d4ce,underline'
ZSH_HIGHLIGHT_STYLES[single-quoted-argument]='fg=#d6a36a'
ZSH_HIGHLIGHT_STYLES[double-quoted-argument]='fg=#d6a36a'
ZSH_HIGHLIGHT_STYLES[comment]='fg=#8a8681'

# ---------------------------------------------------------------
# Prompt
# ---------------------------------------------------------------
eval "$(starship init zsh)"
