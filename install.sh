#!/bin/bash

start() {
    clear
    curl ip.gs
    echo ""
    echo "                !! ATTENTION !!"
    echo "YOU ARE SETTING UP: Andreas Env"
    echo "==========================================================="
    echo ""
    echo -n "* The setup will begin in 2 seconds... "
    sleep 2
    echo -n "Times up! Here we start!"
    echo ""

    cd $HOME
}

jetbrains_mono() {
    wget https://download.jetbrains.com/fonts/JetBrainsMono-2.001.zip
    sudo unzip JetBrainsMono-2.001.zip -d /usr/share/fonts
    sudo fc-cache -f -v
}

install-linux-packages() {
    echo "==========================================================="
    echo "* Install following packages:"
    echo "-----------------------------------------------------------"

    sudo apt-get update
    sudo apt-get install -y python3-dev python3-pip python3-setuptools
    sudo apt-get install -y apt-file aptitude deborphan
    sudo apt-get install -y build-essential libreadline-dev
    sudo apt-get install -y zsh curl wget git tree unzip ncdu tmux trash-cli
    sudo apt-get install -y festival festvox-kallpc16k
    sudo apt-get install -y neofetch screenfetch autojump
    sudo apt-get install -y lsof whois traceroute
    sudo apt-get install -y net-tools iputils-tracepath dnsutils
    sudo apt-get install -y netcat-openbsd
}

setup-omz() {
    echo "==========================================================="
    echo "                      Shells Enviroment"
    echo "-----------------------------------------------------------"
    echo "* Installing Oh-My-Zsh..."
    echo "-----------------------------------------------------------"

    curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash

    echo "-----------------------------------------------------------"
    echo "* Installing ZSH Custom Plugins & Themes:"
    echo ""
    echo "  - zsh-autosuggestions"
    echo "  - zsh-syntax-highlighting"
    echo "-----------------------------------------------------------"

    cp ~/dotfiles/zsh_plugins.txt ~/.zsh_plugins.txt
    cp -r ~/dotfiles/zsh-theme/. ~/.oh-my-zsh/custom/themes/
}

install-linuxbrew(){
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/Linuxbrew/install/master/install.sh)"
    echo 'eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)' >>~/.zprofile
    eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)

    brew install gcc git-quick-stats cheat
    brew install ripgrep bat exa neovim git fzf
    brew install getantibody/tap/antibody
    brew install ctop hub onefetch httpie
    brew install jesseduffield/lazygit/lazygit lazydocker
}

install-nodejs() {
    install-nvm() {
        echo "-----------------------------------------------------------"
        echo "* Installing NVM..."
        echo "-----------------------------------------------------------"

        curl -o- https://cdn.jsdelivr.net/gh/creationix/nvm/install.sh | bash

        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
        [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

        echo "-----------------------------------------------------------"
        echo -n "* NVM Verision: "
        command -v nvm
    }

    install-node() {
        echo "-----------------------------------------------------------"
        echo "* Installing NodeJS..."
        echo "-----------------------------------------------------------"

        nvm install node
        nvm use node
        echo "-----------------------------------------------------------"
        echo -n "* NodeJS Version: "

        node -v
    }

    install-yarn() {
        yarn --version
    }

    yarn-global-add() {
        echo "-----------------------------------------------------------"
        echo "* Yarn Global Add those packages:"
        echo "-----------------------------------------------------------"
        yarn global add npm-check-updates nali-cli
        yarn global add http-server serve
        yarn global add what-is-x liyu wtf
        yarn global add typescript ts-node
    }


    echo "==========================================================="
    echo "              Setting up NodeJS Environment"

    install-nvm
    install-node
    install-yarn
    yarn-global-add
}

zshrc() {
    echo "==========================================================="
    echo "                  Import zshrc                   "
    echo "-----------------------------------------------------------"
    cd $HOME/dotfiles
    cat ./zshrc > $HOME/.zshrc
}

upgrade-packages() {
    echo "==========================================================="
    echo "                      Upgrade packages                     "
    echo "-----------------------------------------------------------"

    sudo apt-get update && sudo apt-get upgrade -y
}

finish() {
    echo "==========================================================="
    echo "> Do not forget run those things:"
    echo ""
    echo "- chsh -s /usr/bin/zsh"
    echo "- git-config"
    echo "- set up neovim"
    echo "- u-update"
    echo "==========================================================="
}

start
install-linux-packages
install-linuxbrew
jetbrains_mono
setup-omz
install-nodejs
zshrc
upgrade-packages
finish
