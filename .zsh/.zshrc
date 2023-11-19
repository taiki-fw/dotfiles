fetch_switch () {
  git fetch origin $1
  git switch $1
}

branch() {
  local branches branch
  branches=$(git branch -vv) &&
  branch=$(echo "$branches" | fzf +m) &&
  git switch $(echo "$branch" | awk '{print $1}' | sed "s/.* //")
}

stash() {
  local stash
  stashes=$(git stash list) &&
  stash=$(echo "$stashes" | fzf -m) &&
  git stash pop $(echo "$stash" | awk '{print $1}' | sed "s/://")
}

# エイリアス
alias ls='ls -F'
alias la='ls -a'
alias ll='ls -l'
alias mkdir='mkdir -p'

alias gsw=fetch_switch
alias awsp='export AWS_PROFILE=$(aws configure list-profiles | sed "/default/d" | sort | fzf)'

# 保管機能を強化
autoload -Uz compinit && compinit -u
# 補完関数の表示を強化する
zstyle ':completion:*:default' menu select=2
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format '%F{YELLOW}%d'$DEFAULT
zstyle ':completion:*:warnings' format '%F{RED}No matches for:''%F{YELLOW} %d'$DEFAULT
zstyle ':completion:*:descriptions' format '%F{YELLOW}completing %B%d%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'
zstyle ':completion:*:descriptions' format '%F{yellow}Completing %B%d%b%f'$DEFAULT
# マッチ種別を別々に表示
zstyle ':completion:*' group-name ''

# fzf 表示位置の設定
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'

# 履歴ファイルの保存先
export HISTFILE=${ZDOTDIR}/.zsh_history
# メモリに保存される履歴の件数
export HISTSIZE=1000
# 履歴ファイルに保存される履歴の件数
export SAVEHIST=100000
# 単語として判定する記号
export WORDCHARS="*?.[]~&;=!#$%^(){}<>"
# 開始と終了を記録
setopt EXTENDED_HISTORY
# 同時に起動しているzsh間でhistoryを共有する
setopt share_history
# 同じコマンドをhistoryに残さない
setopt hist_ignore_all_dups
# コマンドのスペルミスを指摘
# setopt correct
setopt no_beep

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
zstyle ':vcs_info:*' formats "
on%F{magenta} %b %c%u%f"
zstyle ':vcs_info:*' actionformats "[%b|%a]"

# 上記で設定したvsc_infoを呼びだす
precmd(){ vcs_info }

# コマンドの左側
PROMPT=$PROMPT'${vcs_info_msg_0_}
%F{green}>%f '


# OS依存zshファイルの読み込み
# uname ... OS名を表示
# - Mac ... Darwin
[ -f $ZDOTDIR/.zshrc_`uname` ] && . $ZDOTDIR/.zshrc_`uname`
[ -f ${HOME}/.zsh/.zshrc.local ] && source ${HOME}/.zsh/.zshrc.local

source ${HOME}/.zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh