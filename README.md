# Doom Emacs Configuration

This is my customized Doom Emacs setup, optimized for use in terminal environments without a graphical interface.

## Installation

### Step 1: Update System and Install Emacs

First, update your system and install Emacs using Snap (Ubuntu).

```bash
sudo apt update
sudo snap install emacs --classic
sudo apt install build-essential cmake libtool libvterm-dev # for vterm only
npm install -g typescript-language-server typescript eslint # for javascript lsp
npm install -g pyright # for python lsp
sudo snap install copilot-language-server
```

### Step 2: Install Doom Emacs with this Configuration

Clone both the Doom Emacs repository and this configuration repository, then run the installation script.

```bash
git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d
git clone https://github.com/ramuyk/my-doom-emacs-config.git ~/.doom.d
~/.emacs.d/bin/doom sync
```


### Step 3: Configure Emacs Client in `.bashrc` (optional)

To improve the startup time of Emacs, you can run Emacs as a daemon and open files using `emacsclient`. Add the following lines to your `.bashrc` file:

```bash
pgrep -f "emacs.*--daemon" > /dev/null
if [ $? -ne 0 ]; then
    emacs --daemon
fi
alias "emacs"='emacsclient -c -a ""'
```


