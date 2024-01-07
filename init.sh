#!/bin/bash

exec 2>/dev/null

sudo apt update
sudo apt upgrade -y
sudo apt dist-upgrade -y

# Delete old packages
sudo apt autoremove -y
sudo apt autoclean

# Install required packages
sudo apt install -y nautilus-dropbox subfinder sublist3r nuclei nikto keepass2 kali-community-wallpapers httprobe dirsearch gobuster golang

# Set Go environment variables
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

# Check if the lines already exist in .zshrc
if ! grep -q "export GOPATH=$HOME/go" ~/.zshrc; then
  echo "export GOPATH=$HOME/go" >> ~/.zshrc
fi

if ! grep -q "export PATH=\$PATH:\$GOPATH/bin" ~/.zshrc; then
  echo "export PATH=\$PATH:\$GOPATH/bin" >> ~/.zshrc
fi

# Update the environment
source ~/.zshrc || true

# Install required tools
echo -e "Installing tools...\n" 
go install github.com/tomnomnom/waybackurls@latest

# Update the environment
source ~/.zshrc || true

# Download and install Obsidian
sudo wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.5.3/obsidian_1.5.3_amd64.deb
sudo chmod +x obsidian_1.5.3_amd64.deb
sudo apt install ./obsidian_1.5.3_amd64.deb
sudo rm -f obsidian_1.5.3_amd64.deb

# Download and install Visual Studio Code
sudo wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt install apt-transport-https
sudo apt update
sudo apt install code
sudo rm -f packages.microsoft.gpg

# Update the environment
source ~/.zshrc || true

echo -e "Installation completed.\n"

# List installed tools
echo -e "Installed tools:\n"
for tool in dropbox subfinder sublist3r nuclei nikto keepass2 go httprobe dirsearch gobuster code obsidian waybackurls; do
  command -v $tool > /dev/null && echo  "- $tool is installed." || echo "- $tool is NOT installed."
done

# Update the environment
source ~/.zshrc || true
