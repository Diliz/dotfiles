# Dotfiles

## Purpose

This repository is here to manage all my personnal scripts and dotfiles, all secret
related things will be stored in a remote or local vault, you'll be prompt when secrets
are needed.

## Installation

To install this scripts, use one of the following commands:

- via curl:

```bash
bash -c "$(curl -fsSL https://raw.githubusercontent.com/diliz/dotfiles/main/install.sh)"
```

- via wget:

```bash
bash -c "$(wget https://raw.githubusercontent.com/diliz/dotfiles/main/install.sh -O -)"
```

## What is installed with this script

Server only:
- [asdf](https://github.com/asdf-vm/asdf)
- git
- ansible (with [mitogen](https://mitogen.networkgenomics.com/ansible_detailed.html))
- ansible-lint
- sshpass
- [github cli](https://github.com/cli/cli)
- [SpaceVim](https://spacevim.org/)
- [tmux](https://github.com/tmux/tmux)
- [kubectl](https://kubernetes.io/fr/docs/tasks/tools/install-kubectl/)
- [podman](https://podman.io/)
- [terraform](https://www.terraform.io/)
- [vault client](https://www.vaultproject.io/)
- [python](https://www.python.org/)
- [go](https://golang.org/)
- [rust](https://www.rust-lang.org)
- [node](https://nodejs.org)

If an X server is available:
- [flatpak](https://flatpak.org/)
- spotify
- lens
- vscode
