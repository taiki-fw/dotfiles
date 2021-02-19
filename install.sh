#!/bin/sh

# 未定義な変数があるとき途中で終了する
set -u

if [ ! -d "dotfiles" ];then
  echo "fetch dotfiles from github"

  git clone https://github.com/taiki-fw/dotfiles.git
fi

cd dotfiles
# dotfilesのシンボリックをrootに張る
for f in .??*; do
  [ "$f" = ".git" ] && continue

  ln -sf ${PWD}/"$f" ~/

done
