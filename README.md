# Ubuntu 22.04 LTS
## Install Script
```
curl https://raw.githubusercontent.com/jagunlimited81/Bashrc/main/install.sh -o ~/install.sh -f && chmod +x ~/install.sh
~/install.sh
```
# Setup Passwordless SSH
## On Windows
### 1. Generate a key pair
```ssh-keygen -t rsa```
### 2. Copy SSH key to Remote Linux Machine
```type $env:USERPROFILE\.ssh\id_rsa.pub | ssh user@host "cat >> .ssh/authorized_keys"```

Replace `user@host` with your username and hostname or ip of the remote linux machine
### 3. Test passwordless SSH
```ssh user@host```
