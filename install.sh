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
    VIMRC_URL="https://raw.githubusercontent.com/jagunlimited81/Bashrc/main/.vimrc"
    curl $VIMRC -o ~/.vimrc -f
}

function install_programs() {
    # Update System and Repos
    sudo apt update -y && sudo apt upgrade -y
    sudo apt install wget -y

    sudo apt install unattended-upgrades -y
    
    # Install Editors
    sudo apt install vim -y
    sudo apt install tmux -y

    sudo apt install git -y

    # Install diagnostic tools
    sudo apt install htop -y
    sudo apt install iotop -y
    sudo apt install nmon -y
    sudo apt install neofetch -y
    sudo apt install sysbench -y

    # Install networking tools
    sudo apt install net-tools -y
    sudo apt install nmap -y
    sudo apt install iperf3 -y
    sudo apt install speedtest-cli -y
}

function install_interpreters() {
    # compilers
    sudo apt install build-essential -y

    # python
    sudo apt install python3 -y

    # Node.js nvm
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

}
function cleanup() {
    source ~/.bashrc
}
# Full install
if [ $choice -eq "1" ]; then
    echo "Full install"
    install_bashrc
    install_programs
    install_interpreters
    cleanup
fi
# Custom Linux Install
if [ $choice -eq "2" ]; then
    echo "Custom install"
fi
# Install .bashrc
if [ $choice -eq "3" ]; then
    echo ".bashrc install"
    install_bashrc
    cleanup
fi
# Quit
if [ $choice -eq "4" ]; then
    echo "Quitting..."
    cleanup
fi
