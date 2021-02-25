#!/bin/sh

# 未定義な変数があるとき途中で終了する
set -u

ZSHPLUGINS = $ZDOTDIR/plugins

if [ ! -d "${ZSHPLUGINS}/zsh-autosuggestions" ];then
  echo "fetch zsh plugins"

  mkdir $ZSHPLUGINS/zsh-autosuggestions
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSHPLUGINS/zsh-autosuggestions
fi