#!/bin/bash
echo "Welcome to jagunlimited81's Linux install script"
echo "select an option"
echo -e "\t 1. Full Linux Dev Install"
echo -e "\t 2. Custom Linux install"
echo -e "\t 3. Install .bashrc"
echo -e "\t 4. Quit"
read choice

function install_bashrc() {
    BASHRC_URL="https://raw.githubusercontent.com/jagunlimited81/Bashrc/main/.bashrc"
    curl $BASHRC_URL -o ~/.bashrc -f
}

function install_programs() {
    # Update System and Repos
    sudo apt update -y && sudo apt upgrade -y
    # Install Editors
    sudo apt install vim -y

    # install diagnostic tools
    sudo apt install htop -y
    sudo apt install neofetch -y
    sudo apt install net-tools -y
}

function install_interpreters() {
    # python
    sudo apt install python3 pip3 -y

    # Node.js nvm
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

}

# Full install
if [ $choice -eq "1" ]; then
    echo "Full install"
    install_bashrc
    install_programs
    install_interpreters
fi
# Custom Linux Install
if [ $choice -eq "2" ]; then
    echo "Custom install"
fi
# Install .bashrc
if [ $choice -eq "3" ]; then
    echo ".bashrc install"
    install_bashrc
fi
# Quit
if [ $choice -eq "4" ]; then
    echo "Quitting..."
fi
