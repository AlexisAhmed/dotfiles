#!/bin/bash

# Output color variables
RED='\033[0;31m'
NC='\033[0m'

echo -e "${RED}[*] Parrot OS Customization Script${NC}"

# Update Repositories
echo -e "${RED}[*] Updating repo list${NC}"
sudo apt-get update

# Remove unwanted packages
echo -e "${RED}[*] Removing unwanted packages${NC}"
sudo apt remove neovim

# Installing Essentials
echo -e "${RED}[*] Installing Essentials${NC}"
sudo apt install -y vim wget git curl htop tmux zsh python3-pip dotdotpwn openvpn keepassxc plank exploitdb

# Installing Chromium
while true; do
    read -p "Do you wish to install chromium? Y/N" yn
    case $yn in
        [Yy]* ) sudo apt-get install chromium -y;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Installing Docker
while true; do
    read -p "Do you wish to install docker? Y/N" yn
    case $yn in
        [Yy]* ) sudo apt-get install docker docker.io -y && systemctl enable docker && systemctl start docker;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Download SecLists
while true; do
    read -p "Do you wish to download SecLists? Y/N" yn
    case $yn in
        [Yy]* ) sudo wget -c https://github.com/danielmiessler/SecLists/archive/master.zip -O /usr/share/wordlists/SecList.zip \
  && unzip SecList.zip \
  && rm -f SecList.zip;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Custom .vimrc 
while true; do
    read -p "Do you wish to use a custom .vimrc file? Y/N" yn
    case $yn in
        [Yy]* ) echo "set number" >> ~/.vimrc \
  && echo "syntax on" >> ~/.vimrc;;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

# Installing oh-my-zsh 
while true; do
    read -p "Do you wish to install oh-my-zsh? Y/N" yn
    case $yn in
        [Yy]* ) sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)";;
        [Nn]* ) break;;
        * ) echo "Please answer yes or no.";;
    esac
done

rm ~/.zshrc


echo -e "${RED}[*] Retrieving custom .zshrc${NC}"
wget https://raw.githubusercontent.com/AlexisAhmed/BugBountyToolkit-ZSH/main/.zshrc -O ${HOME}/.zshrc


echo -e "${RED}[*] ALL DONE, HAPPY HACKING!${NC}"



