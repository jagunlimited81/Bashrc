#!/usr/bin/env bash
echo "\n\nWelcome to jagunlimited81's Linux install script"
echo "select an option"
echo -e "\t 1. Install everything"
echo -e "\t 2. Docker + essential + bashrc"
echo -e "\t 3. Install .bashrc only"
echo -e "\t 4. Quit"
read choice

function install_bashrc() {
    BASHRC_URL="https://raw.githubusercontent.com/jagunlimited81/Bashrc/main/.bashrc"
    curl $BASHRC_URL -o ~/.bashrc -f
    VIMRC_URL="https://raw.githubusercontent.com/jagunlimited81/Bashrc/main/.vimrc"
    curl $VIMRC -o ~/.vimrc -f
    source ~/.bashrc
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
    
    # Install storage tools
    sudo apt install nfs-common -y
}

function install_interpreters() {
    # compilers
    sudo apt install build-essential -y

    # python
    sudo apt install python3 -y

    # Node.js nvm
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash

}

function install_docker() {
    # Update the apt package index and install packages to allow apt to use a repository over HTTPS:
    sudo apt install ca-certificates -y
    sudo apt install gnupg -y
    sudo apt install lsb-release -y
    
    # Add Docker’s official GPG key:
    sudo mkdir -p /etc/apt/keyrings
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

    # Use the following command to set up the repository:
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  
  # update apt package index
  sudo apt-get update -y
  
  # install docker
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin -y
}
function disable_needrestart() {
    sed s/\#\$nrconf{restart}\ =\ \'i\'\;/\$nrconf{restart}\ =\ \'a\'\;/ /etc/needrestart/needrestart.conf | sudo tee /etc/needrestart/needrestart.conf
}
function cleanup() {
    echo "It's a good idea to reboot your instance, but it is not required."
    export BASH_ENV=“$HOME/.bashrc”
}
# Full install
if [ $choice -eq "1" ]; then
    echo "Full install"
    disable_needrestart
    install_bashrc
    install_programs
    install_docker
    install_interpreters
    cleanup
fi
# Custom Linux Install
if [ $choice -eq "2" ]; then
    echo "Custom install"
    disable_needrestart
    install_bashrc
    install_programs
    install_docker
    cleanup
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
