#!/bin/bash

set -e

BOOTSTRAP_DIR=$(realpath $(dirname "$0"))

install_vimrc(){
    if grep -q "Added by bootstrap" ~/.vimrc &> /dev/null; then
        return
    fi

    echo "source $BOOTSTRAP_DIR/.vimrc \" Added by bootstrap" >> ~/.vimrc
}

uninstall_vimrc(){
    if [[ ! -f ~/.vimrc ]]; then
        return
    fi

    sed -i '/Added by bootstrap/d' ~/.vimrc
}

install_bash_aliases(){
    if grep -q "Added by bootstrap" ~/.bashrc &> /dev/null; then
        return
    fi

    echo ". $BOOTSTRAP_DIR/.bash_aliases # Added by bootstrap" >> ~/.bashrc
}

uninstall_bash_aliases(){
    if [[ ! -f ~/.bashrc ]]; then
        return
    fi

    sed -i '/Added by bootstrap/d' ~/.bashrc
}

install_tmux_conf(){
    if grep -q "Added by bootstrap" ~/.tmux.conf &> /dev/null; then
        return
    fi

    echo "source-file $BOOTSTRAP_DIR/.tmux.conf # Added by bootstrap" >> ~/.tmux.conf
}

uninstall_tmux_conf(){
    if [[ ! -f ~/.tmux.conf ]]; then
        return
    fi

    sed -i '/Added by bootstrap/d' ~/.tmux.conf
}

ACTION=$1
if [[ "$ACTION" == "install" ]]; then
    install_vimrc
    install_bash_aliases
    install_tmux_conf
elif [[ "$ACTION" == "uninstall" ]]; then
    uninstall_vimrc
    uninstall_bash_aliases
    uninstall_tmux_conf
else
    echo "Usage: bootstrap.sh <install|uninstall>"
    exit 1
fi

