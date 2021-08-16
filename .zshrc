ZSH_THEME="spaceship"
SPACESHIP_PROMPT_SYMBOL="❯"
SPACESHIP_PACKAGE_SHOW=false
SPACESHIP_BATTERY_SHOW=false
SPACESHIP_BATTERY_ALWAYS_SHOW=false
# --- Plugins

plugins=(git sudo zsh-syntax-highlighting zsh-autosuggestions)

# --- Source 
source $ZSH/oh-my-zsh.sh
source $HOME/.functions
source $HOME/.aliases
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

git clone https://github.com/spaceship-prompt/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt" --depth=1
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"


alias g='git'
alias ga='git add'
alias gs='git status'
alias gc='git commit'