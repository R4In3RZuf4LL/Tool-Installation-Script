# Tool-Installation-Script Changelog

All notable changes to the "Tool-Installation-Script" will be documented in this file.
## [1.0.0] - 2024-01-07
### Added

Initial release of the Tool-Installation-Script
Automates the installation of various tools and programs on a Kali Linux system.
Supports the installation of the following tools:
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
Updates environment variables in the ~/.zshrc file:
   + GOPATH: The directory for Go modules (default is $HOME/go).
   + PATH: Appends the directory $GOPATH/bin to the PATH.

## [1.1.0] - 2024-01-11
### Added

+ Tools
   + Seclists
   + XSStrike
   + Nipe
+ Structure 
   + Introduced variable scoping to avoid potential issues with global variables.
   + Additional logging functionality using a log function.
   + Improved error handling for critical steps, such as package installations and tool installations
   + Updated documentation for better clarity and explanations.
   + Added a changelog file to track script changes.

### Changed

   + Modified the structure of the script for better organization and readability.

### Notes

   + The script attempts to check for existing entries in ~/.zshrc before adding new ones.
   + After installation, the script outputs the installed tools for verification.