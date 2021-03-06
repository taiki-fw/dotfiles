#!/bin/sh

# 未定義な変数があるとき途中で終了する
set -u

ZSHDIR=$(dirname $0)/.zsh
CURRENTDIR=$(cd $(dirname $0); pwd)

if [ ! -d "dotfiles" ];then
  echo "fetch dotfiles from github"

  git clone https://github.com/taiki-fw/dotfiles.git
fi


sh $CURRENTDIR/.zsh/plugins/install.sh

cd ~/$(dirname $0)
# dotfilesのシンボリックをrootに張る
for f in .??*; do
  [ "$f" = ".git" ] && continue
  [ "$f" = ".gitignore" ] && continue

  ln -sf ${PWD}/"$f" ~/
done