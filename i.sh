#!bin/bash

# (Before execute i.sh, need to do this commands.)
# sudo xcodebuild -license
# xcode-select --install

set -e

[ -d ~/.ghq/src/github.com/yukimemi/ansible-playbook ] || git clone https://github.com/yukimemi/ansible-playbook.git ~/.ghq/src/github.com/yukimemi/ansible-playbook
pushd ~/.ghq/src/github.com/yukimemi/ansible-playbook

# Install homebrew.
if ! type brew > /dev/null; then
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Install ansible.
if ! type ansible-playbook > /dev/null; then
  brew install ansible
fi

ansible-playbook localhost.yml -i hosts

