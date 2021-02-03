# エイリアス
alias ls='ls -F'
alias la='ls -a'
alias ll='ls -l'

alias mkdir='mkdir -p'

export EDITOR=code

# 保管機能を強化
autoload -U compinit
compinit

# 同時に起動しているzsh間でhistoryを共有する
setopt share_history
# 同じコマンドをhistoryに残さない
setopt hist_ignore_all_dups
# コマンドのスペルミスを指摘
setopt correct

# 色を付けられる
autoload -Uz colors
colors

#prompt コマンドの左側
PROMPT='
%F{cyan}%n%f:%F{yellow}%~%f'
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

# uname ... OS名を表示
# - Mac ... Darwin
[ -f $ZDOTDIR/.zshrc_`uname` ] && . $ZDOTDIR/.zshrc_`uname`
[ -f $ZDOTDIR/.zshrc_local ] && . $ZDOTDIR/.zshrc_local
