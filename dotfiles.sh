#!/usr/bin/env bash

set -o errexit

REPO_URL=https://github.com/peterotool/.dotfiles.git
REPO_PATH="$HOME/.dotfiles"

install_xcode() {
    if xcode-select -p >/dev/null; then
        echo "xCode Command Line Tools already installed"
    else
        echo "Installing xCode Command Line Tools..."
        xcode-select --install
        sudo xcodebuild -license accept
    fi
}

install_homebrew() {
    export HOMEBREW_CASK_OPTS="--appdir=/Applications"
    if hash brew &>/dev/null; then
        echo "Homebrew already installed"
    else
        echo "Installing homebrew..."
        sudo --validate # reset `sudo` timeout to use Homebrew install in noninteractive mode
        NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    fi
}

echo "####### dotfiles #######"
read -p "Press enter to start:"
echo "Bootstraping..."

install_xcode
install_homebrew

echo "Installing Git"
brew install git

echo "Cloning .dotfiles repo from $REPO_URL into $REPO_PATH"
git clone "$REPO_URL" "$REPO_PATH"

echo "Change path to $REPO_PATH"
cd "$REPO_PATH" >/dev/null

./install.sh
