# Tool-Installation-Script

This script automates the installation of various tools and programs on a Kali Linux system.

## Disclaimer

The tools shown and installed are intended for practice and learning purposes. I am not responsible for what third parties do. Please remember, we are learning a science that should make the world safer!

Be Scientist not Criminal

## Usage

Make the script executable.

```bash
chmod +x init.sh
```

Run the script with root privileges to initiate the installation.

```bash
sudo bash init.sh
```

## Prerequisites

   + Kali Linux (tested on Kali Linux Rolling)
   + Bash

## Included Tools

### The script installs the following tools:

   + Dropbox
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
   + XSStrike
   + Nipe

## Environment Variables

The script updates environment variables in the ~/.zshrc file:

    GOPATH: The directory for Go modules (default is $HOME/go).
    PATH: Appends the directory $GOPATH/bin to the PATH.

## Notes

    The script attempts to check for existing entries in ~/.zshrc before adding new ones.
    After installation, the script outputs the installed tools for verification.

## License

This script is under the MIT License.
