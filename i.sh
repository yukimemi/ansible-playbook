#!bin/bash

set -e

mkdir ~/.tmp
pushd ~/.tmp

git clone https://github.com/yukimemi/mac-ansible.git
pushd mac-ansible

sudo xcodebuild -license
xcode-select --install

# Install homebrew
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew install python
brew install ansible

HOMEBREW_CASK_OPTS="--appdir=/Applications" ansible-playbook localhost.yml -i hosts

