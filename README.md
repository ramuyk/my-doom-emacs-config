# Doom Emacs Configuration

This is my customized Doom Emacs setup, optimized for use in terminal environments without a graphical interface.

## Installation

### Step 1: Update System and Install Emacs

First, update your system and install Emacs using Snap (Ubuntu).

```bash
sudo apt update
sudo snap install emacs --classic
sudo apt install build-essential cmake libtool libvterm-dev # for vterm only
```

### Step 2: Install Doom Emacs with this Configuration

Clone both the Doom Emacs repository and this configuration repository, then run the installation script.

```bash
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
git clone https://github.com/ramuyk/my-doom-emacs-config.git ~/.doom.d
~/.emacs.d/bin/doom install
~/.emacs.d/bin/doom sync
```
