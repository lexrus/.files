# My Dotfiles

A repository for syncing and managing my macOS command-line environment. These configuration files are tailored for daily productivity and automated setup on new machines.

## Philosophy

Any updates follow these core principles:

- **Efficiency over Fancy:** Prioritize tools and configurations that save time and reduce friction.
- **Capability over Compatibility:** Focus on modern tools even if they sacrifice legacy support.
- **Active Utility:** Tools and configurations that haven't been used in a season are deleted or replaced.

## Core Stack

- **OS:** macOS
- **Shell:** Fish
- **Editor:** Vim / Neovim

## Installation

The setup is automated through a sequence of scripts:

1. **`00_brew.sh`**: Installs Homebrew, the essential package manager for macOS.
2. **`01_tools.sh`**: Installs a curated list of command-line tools and applications.
3. **`02_link.sh`**: Sets up the shell environment, symlinks dotfiles, and ensures Fish is the default shell.
4. **`03_vim.fish`**: Configures Vim and Neovim, manages plugins via `vim-plug`, and sets up necessary directories.

## Configuration & Features

### System Tools

The setup includes a comprehensive suite of utilities:

- **Core Utilities:** `coreutils`, `curl`, `wget`, `tree`, `htop`
- **Development:** `git`, `git-lfs`, `ctags`, `jq`, `lazygit`, `tig`
- **Shell & Navigation:** `fish`, `tmux`, `starship`, `yazi`
- **Network & Benchmarking:** `mosh`, `httpstat`, `wrk`, `axel`
- **Environment Management:** `mise` for managing runtimes (Node.js, etc.)

### Fish Shell (`config.fish`)

Customized for a seamless experience:

- **Aliases (`alias.fish`):** Shortcuts for Git (`wip`, `squash`), system maintenance, and common workflows.
- **Exports (`exports.fish`):** Environment variables for various SDKs including Android, Go, Swift, and Flutter.
- **Custom Functions:**
  - `updateall`: A single command to update system packages, Homebrew, Pip, and Vim plugins.
  - `www`: Instantiates a simple HTTP server in the current directory.
  - `pman`: Opens man pages in macOS Preview for better readability.
  - `gi`: Quickly generates `.gitignore` files via gitignore.io API.

### Editor Setup

Vim and Neovim are unified under a central configuration, leveraging `vim-plug` for plugin management and a robust directory structure for backups and undos.

### Security & Credentials

Credentials and sensitive environment variables are managed via a local `credentials.fish` and `credentials.json` system. These files are explicitly ignored by Git to prevent accidental exposure of secrets while keeping the repository portable.

---

_Note: These files are optimized for my specific workflow but can serve as a foundation for your own setup._
