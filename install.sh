#!/bin/sh

if [ ! -d "dotfiles" ];then
  echo "fetch dotfiles from github"

  git clone https://github.com/taiki-fw/dotfiles.git
fi

cd ~/$(dirname $0)

# zsh
ln -sf ${PWD}/.zshenv ${HOME}/.zshenv
mkdir -p ${HOME}/.zsh
ln -sf ${PWD}/.zsh/.zshenv ${HOME}/.zsh/.zshenv
ln -sf ${PWD}/.zsh/.zshrc ${HOME}/.zsh/.zshrc
ln -sf ${PWD}/.zsh/.zprofile ${HOME}/.zsh/.zprofile
[ ! -e ${HOME}/.zsh/.zshrc.local ] && ln -sf ${PWD}/.zsh/.zshrc.local ${HOME}/.zsh/.zshrc.local

## zsh plugin
sh ${PWD}/.zsh/plugins/install.sh