# エイリアス
alias stoppos='brew services stop postgres'
alias startpos='brew services start postgres'
alias startpy='source ~/pydataenv/bin/activate'
alias stoppy="deactivate"
export EDITOR=code

# 保管機能を強化
autoload -U compinit
compinit

# 色を付けられる
autoload -Uz colors
colors

#prompt コマンドの左側
PROMPT='%F{cyan}%n%f:%F{yellow}%~%f'
# バージョン管理システムから情報を自動的に取得する
autoload -Uz vcs_info

# PROMPT変数内で変数参照
setopt prompt_subst


# formats 設定項目で %c, %u が使用可
zstyle ':vcs_info:git:*' check-for-changes true

# commit されていないファイルがある
zstyle ':vcs_info:git:*' stagedstr "%F{yellow}!"

# add　されていないファイルがある
zstyle ':vcs_info:git:*' unstagedstr "%F{red}+"

# 通常
zstyle ':vcs_info:*' formats "%F{green} [%b] %c%u%f"
zstyle ':vcs_info:*' actionformats "[%b|%a]"

# 上記で設定したvsc_infoを呼びだす
precmd(){ vcs_info }

# コマンドの左側
PROMPT=$PROMPT'${vcs_info_msg_0_}
%(?:😶 %F{green}→%f :🙃🙃🙃 %F{red}→%f )%{$fg_bold[green]%}'

# ヒストリに追加されるコマンド行が古いものと同じなら古いものを削除
setopt hist_ignore_all_dups

# uname ... OS名を表示
# - Mac ... Darwin
[ -f ~/.zshrc_`uname` ] && . ~/.zshrc_`uname`
[ -f ~/.zshrc_local ] && . ~/.zshrc_local
