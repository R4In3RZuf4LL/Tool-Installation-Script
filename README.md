# Tool-Installation-Script

This script automates the installation of various tools and programs on a Kali Linux system.

## Usage

Run the script with root privileges to initiate the installation.

```bash
sudo bash init.sh
```

## Prerequisites

   + Kali Linux (tested on Kali Linux Rolling)
   + Bash

## Included Tools

### The script installs the following tools:

   + Nautilus Dropbox
   + Subfinder
   + Sublist3r
   + Nuclei
   + Nikto
   + KeePass2
   + Kali Community Wallpapers
   + Httprobe
   + Dirsearch
   + Gobuster
   + Golang
   + Waybackurls
   + Obsidian
   + Visual Studio Code

## Environment Variables

The script updates environment variables in the ~/.zshrc file:

    GOPATH: The directory for Go modules (default is $HOME/go).
    PATH: Appends the directory $GOPATH/bin to the PATH.

## Notes

    The script attempts to check for existing entries in ~/.zshrc before adding new ones.
    After installation, the script outputs the installed tools for verification.

## License

This script is under the MIT License.
