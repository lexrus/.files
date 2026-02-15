# My dotfiles inside $HOME folder

A repo to sync the CLI environment of my Mac(s).

I update these files to suit my daily work.

They might not please yours.

Usually they work smoothly every time I bought a shinny new Mac.

Any update shall follow these simple rules:

> - Efficiency over fancy
> - Capability over compatibility
> - Tools not used for a season better to be deleted or replaced

- [x] macOS
- [x] fish shell
- [x] vim

## Installation

The setup is automated through a series of scripts:

1.  **`00_brew.sh`**: Installs Homebrew, the package manager for macOS.
2.  **`01_tools.sh`**: Installs essential command-line tools and applications via Homebrew.
3.  **`02_link.sh`**: Sets up the shell environment, links configuration files (dotfiles), and ensures Fish is the default shell.
4.  **`03_vim.fish`**: Configures Vim and Neovim, installing plugins via `vim-plug`.

## Functionalities

### System Tools
Installs a curated list of tools including:
-   **Core Utilities**: `coreutils`, `curl`, `wget`, `tree`
-   **Development**: `git`, `git-lfs`, `ctags`, `jq` (via brew recipes)
-   **Shell**: `fish`, `tmux`, `starship` (implied by config)
-   **Network**: `mosh`, `httpstat`, `wrk`
-   **File Management**: `ranger`, `axel`

### Shell Configuration (Fish)
The Fish shell is customized with:
-   **Aliases** (`alias.fish`): Shortcuts for git (`wip`, `squash`), system maintenance, and development tasks.
-   **Exports** (`exports.fish`): Environment variables for various SDKs (Android, Go, Swift, Flutter/Dart) and tools (rbenv, mise).
-   **Custom Functions** (`config.fish`):
    -   `updateall`: Updates system packages, brew, gems, pip, and vim plugins.
    -   `www`: Starts a simple HTTP server in the current directory.
    -   `pman`: Opens man pages in Preview.
    -   `vimu`: Updates Vim plugins.
    -   `dlaudio`: Downloads audio from YouTube.
    -   `gi`: Generates gitignore files.

### Editor Setup
-   **Vim/Neovim**: Configured with `vim-plug` for plugin management.
-   **Configuration**: Links `.vimrc` and `.config/nvim/init.vim` to central configuration files.

### Development Environment
Sets up paths and variables for:
-   **Android SDK**: `ANDROID_HOME`
-   **Go**: `GOPATH`
-   **Swift**: `SWIFTENV_ROOT`
-   **Ruby**: `rbenv` integration
-   **Node/JS**: `mise` integration
