#!bin/bash

# (Before execute i.sh, need to do this commands.)
# sudo xcodebuild -license
# xcode-select --install

set -e

# Install ghq.
if ! which ghq > /dev/null; then
  curl -L git.io/cli | L=motemen/ghq sh
fi

ghq get https://github.com/yukimemi/ansible-playbook.git
pushd ~/.ghq/src/github.com/yukimemi/ansible-playbook

# Install homebrew.
if ! type brew > /dev/null; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install ansible.
if ! type ansible-playbook > /dev/null; then
  brew install python
fi

HOMEBREW_CASK_OPTS="--appdir=/Applications" ansible-playbook localhost.yml -i hosts

