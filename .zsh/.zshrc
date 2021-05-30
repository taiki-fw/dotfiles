# エイリアス
alias ls='ls -F'
alias la='ls -a'
alias ll='ls -l'
alias mkdir='mkdir -p'

# 保管機能を強化
autoload -U compinit
compinit

# 履歴ファイルの保存先
export HISTFILE=${ZDOTDIR}/.zsh_history
# メモリに保存される履歴の件数
export HISTSIZE=1000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
# 開始と終了を記録
setopt EXTENDED_HISTORY
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
PROMPT='%F{cyan}%~%f'
# バージョン管理システムから情報を自動的に取得する
autoload -Uz vcs_info

# PROMPT変数内で変数参照
setopt prompt_subst


# formats 設定項目で %c, %u が使用可
zstyle ':vcs_info:git:*' check-for-changes true

# commit されていないファイルがある
zstyle ':vcs_info:git:*' stagedstr "%F{red}[+]"

# add　されていないファイルがある
zstyle ':vcs_info:git:*' unstagedstr "%F{red}[?]"

# 通常
zstyle ':vcs_info:*' formats "%F{magenta} %b %c%u%f"
zstyle ':vcs_info:*' actionformats "[%b|%a]"

# 上記で設定したvsc_infoを呼びだす
precmd(){ vcs_info }

# コマンドの左側
PROMPT=$PROMPT' on${vcs_info_msg_0_}
%F{green}>%f '


# OS依存zshファイルの読み込み
# uname ... OS名を表示
# - Mac ... Darwin
[ -f $ZDOTDIR/.zshrc_`uname` ] && . $ZDOTDIR/.zshrc_`uname`
[ -f $ZDOTDIR/.zshrc_local ] && . $ZDOTDIR/.zshrc_local

. $ZDOTDIR/plugins/.zsh_plugins
