# Ubuntu 22.04
## Install
```
curl https://raw.githubusercontent.com/jagunlimited81/Bashrc/main/install.sh -o ~/install.sh -f && chmod +x ~/install.sh
~/install.sh
```
# Setup Passwordless SSH
## On Windows
### Generate a key pair
```ssh-keygen -t rsa```
### Copy SSH key to Remote Linux Machine
```type $env:USERPROFILE\.ssh\id_rsa.pub | ssh {IP-ADDRESS-OR-FQDN} "cat >> .ssh/authorized_keys"```
### Test passwordless SSH
