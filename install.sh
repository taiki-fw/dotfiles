#!/bin/sh

# 未定義な変数があるとき途中で終了する
set -u

git clone https://github.com/taiki-fw/dotfiles.git

BASEDIR=$(dirname $0)
cd $BASEDIR

# dotfilesのシンボリックをrootに張る
for f in .??*; do
  [ "$f" = ".git" ] && continue

  ln -sf ${PWD}/"$f" ~/

done
