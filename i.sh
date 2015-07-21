#!bin/bash

# (Before execute i.sh, need to do this commands.)
# sudo xcodebuild -license
# xcode-select --install

set -e

command rm -rf ~/.tmp
mkdir ~/.tmp
pushd ~/.tmp

git clone https://github.com/yukimemi/mac-ansible.git
pushd mac-ansible

# Install homebrew
if ! type brew > /dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew install python
brew install ansible

HOMEBREW_CASK_OPTS="--appdir=/Applications" ansible-playbook -v localhost.yml -i hosts

