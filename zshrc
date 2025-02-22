
if [[ -f "/opt/homebrew/bin/brew" ]] then
  # Initialize Homebrew
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Initialize Oh-My-Posh with a custom theme for the Zsh prompt
eval "$(oh-my-posh init zsh --config ~/.dotfiles/oh-my-posh/my-theme.yaml)"


# ----- Plugins -----

# Load zsh-autosuggestions plugin
source ~/.dotfiles/zsh_plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh

# Load zsh-syntax-highlighting plugin
source ~/.dotfiles/zsh_plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.plugin.zsh
# zsh-syntax-highlighting allows customizing the colors of different command components.
# Set the color using different formats:
# - Hex color: "fg=#123456" 
# - Color name: "fg=green"
# - ANSI color code: "fg=10" (where 10 is a color code in the 256-color palette)
#
# To view the ANSI color codes that correspond to the colors set in your Terminal preferences,
# run the following command:
# for i in {0..15}; do printf "\e[48;5;${i}m  %3d  \e[0m" $i; done; echo

# Customize zsh-syntax-highlighting styles for specific elements, default is "fg=green"
ZSH_HIGHLIGHT_STYLES[suffix-alias]="fg=10"  # Set color for alias suffixes to Bright Green (using ANSI color code 10)
ZSH_HIGHLIGHT_STYLES[precommand]="fg=10"    # Set color for precommand parts (e.g., the beginning of the command) to Bright Green
ZSH_HIGHLIGHT_STYLES[arg0]="fg=10"          # Set color for the first argument of the command (arg0) to Bright Green

# Load zsh-completions plugin
source ~/.dotfiles/zsh_plugins/zsh-completions/zsh-completions.plugin.zsh
# Make the zsh-completions plugin functions available
fpath=(~/.dotfiles/zsh_plugins/zsh-completions/src $fpath)
# Initialize the Zsh completion system
autoload -U compinit && compinit


# ----- zsh-completion styling -----

# Set color scheme for ls zsh-completion output
export LSCOLORS="exfxcxdxbxegedabagacad" # default colors
# Set up Zsh completion matcher for case-insensitive matches
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# Configure Zsh completion list colors based on the `LS_COLORS` environment variable
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"


# ----- Aliases -----
alias ls='ls --color'

# ----- Set language and formatting preferences ----- 
export LANG=en_US.UTF-8          # Set the default language to English
export LC_MESSAGES=en_US.UTF-8   # Ensure program messages are displayed in English  
export LC_TIME=sv_SE.UTF-8       # Use Swedish formats for dates and times  
export LC_NUMERIC=sv_SE.UTF-8    # Use Swedish formatting for numbers (e.g., decimal commas)  


# ----- Keybindings -----

# Search backward through the history as you type part of a command
bindkey '\e[A' history-search-backward   # '\e[A' = Up Arrow
# Search forward through the history as you type part of a command
bindkey '\e[B' history-search-forward    # '\e[B' = Down Arrow


# ----- History -----

# History file location
HISTFILE=~/.zsh_history
# Number of history commands to keep in memory
HISTSIZE=1000
# Number of history commands to save in the history file
SAVEHIST=$HISTSIZE
# Erase any duplicates in history file
HISTDUP=erase
# Append to history file when session ends instead of overwriting
setopt appendhistory
# Share history across sessions
setopt sharehistory
# Ignore commands that start with a space from being saved in history
setopt hist_ignore_space
# Prevent saving duplicate commands in history
setopt hist_ignore_all_dups
# Do not save consecutive duplicate commands in history
setopt hist_save_no_dups
# Prevent duplicate commands from being added to history
setopt hist_ignore_dups
# Do not save duplicate commands when searching through history
setopt hist_find_no_dups