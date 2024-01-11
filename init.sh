#!/bin/bash

exec 2>/dev/null

# Logging function
log() {
  echo -e "[LOG] $1"
}

log "Updating system..."
sudo apt update > /dev/null 2>&1
sudo apt upgrade -y > /dev/null 2>&1
sudo apt dist-upgrade -y > /dev/null 2>&1
log "Updating system...finished"

# Install required packages and tools
log "Installing Dropbox, Subfinder, Sublist3r, Nuclei, Nikto, KeePass2, Kali-Community-Wallpapers, HTTProbe, Dirsearch, Gobuster, Go, Seclists..."
sudo apt install -y nautilus-dropbox subfinder sublist3r nuclei nikto keepass2 kali-community-wallpapers httprobe dirsearch gobuster golang seclists > /dev/null 2>&1
installed_tools+=("dropbox" "subfinder" "sublist3r" "nuclei" "nikto" "keepass2" "httprobe" "dirsearch" "gobuster" "go" "seclists")
log "Installing Dropbox, Subfinder, Sublist3r, Nuclei, Nikto, KeePass2, Kali-Community-Wallpapers, HTTProbe, Dirsearch, Gobuster, Go, Seclists...finished"

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

# Install required waybackurls
log "Installing waybackurls..."
go install github.com/tomnomnom/waybackurls@latest > /dev/null 2>&1
installed_tools+=("waybackurls")
log "Installing waybackurls...finished"

# Update the environment
source ~/.zshrc || true

# Download and install Obsidian
log "Downloading and installing Obsidian..."
sudo wget https://github.com/obsidianmd/obsidian-releases/releases/download/v1.5.3/obsidian_1.5.3_amd64.deb > /dev/null 2>&1
sudo chmod +x obsidian_1.5.3_amd64.deb
sudo apt install ./obsidian_1.5.3_amd64.deb > /dev/null 2>&1
sudo rm -f obsidian_1.5.3_amd64.deb
installed_tools+=("obsidian")
log "Downloading and installing Obsidian...finished"

# Download and install Visual Studio Code
log "Downloading and installing Visual Studio Code..."
sudo wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
sudo install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update > /dev/null 2>&1
sudo apt install apt-transport-https > /dev/null 2>&1
sudo apt install code > /dev/null 2>&1
sudo rm -f packages.microsoft.gpg
installed_tools+=("code")
log "Downloading and installing Visual Studio Code...finished"

# Update the environment
source ~/.zshrc || true

# Install to /opt
cd /opt

# Git clone XSStrike and install it
log "Downloading and installing XSStrike..."
sudo git clone https://github.com/s0md3v/XSStrike.git
sudo pip3 install -r ./XSStrike/requirements.txt > /dev/null 2>&1
sudo ln -s /opt/XSStrike/xsstrike.py /usr/local/bin/xsstrike
# Set XSStrike environment variable
export PATH=$PATH:/opt/XSStrike
# Update the environment
source ~/.zshrc || true
installed_tools+=("xsstrike")
log "Downloading and installing XSStrike...finished"

# Git clone Nipe and install it
log "Downloading and installing Nipe..."
sudo git clone https://github.com/htrgouvea/nipe.git
sudo apt install -y cpanm > /dev/null 2>&1
sudo cpanm --installdeps ./nipe/. > /dev/null 2>&1
sudo ln -s /opt/nipe/nipe.pl /usr/local/bin/nipe
sudo perl nipe install > /dev/null 2>&1
# Set nipe environment variable
export PATH=$PATH:/opt/nipe
# Update the environment
source ~/.zshrc || true
installed_tools+=("nipe")
log "Downloading and installing Nipe...finished"

# Check if the lines already exist in .zshrc
if ! grep -q "export PATH=\$PATH:/opt/XSStrike" ~/.zshrc; then
  echo "export PATH=\$PATH:/opt/XSStrike" >> ~/.zshrc
fi

if ! grep -q "export PATH=\$PATH:/opt/nipe" ~/.zshrc; then
  echo "export PATH=\$PATH:/opt/nipe" >> ~/.zshrc
fi

# Update the environment
source ~/.zshrc || true

# List installed tools
log "Installed tools:"
for tool in "${installed_tools[@]}"; do
  command -v $tool > /dev/null && log "- $tool is installed." || log "! $tool is NOT installed."
done

# Update the environment
source ~/.zshrc || true
