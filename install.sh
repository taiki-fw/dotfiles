#!/bin/sh

# 未定義な変数があるとき途中で終了する
set -u

BASEDIR=$(dirname $0)
cd $BASEDIR

for f in .??*; do
  [ "$f" = ".git" ] && continue

  ln -sf ${PWD}/"$f" ~/

done
