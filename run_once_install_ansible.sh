#!/bin/bash

# Adapted from https://github.com/logandonley/dotfiles/blob/main/run_once_install_ansible.sh

install_on_ubuntu() {
  sudo apt-get update
  sudo apt-get install -y ansible
}

OS="$(uname -s)"
case "${OS}" in
Linux*)
  if [ -f /etc/lsb-release ]; then
    install_on_ubuntu
  else
    echo "Unsupported Linux distribution"
    exit 1
  fi
  ;;
*)
  echo "Unsupported operating system: ${OS}"
  exit 1
  ;;
esac

ansible-playbook ~/.bootstrap/setup.yml --ask-become-pass

echo "Ansible installation complete."
