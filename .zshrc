# cd なしで移動する
setopt auto_cd
setopt auto_pushd

# 保管機能を強化
autoload -U compinit
compinit

# 色を付けられる
autoload -Uz colors
colors

#prompt コマンドの左側
PROMPT='%K{white}%F{black}%W %T%f%k %F{cyan}%n%f:%F{yellow}%~%f'
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
PROMPT=$PROMPT'${vcs_info_msg_0_} %% '

#重複したコマンドを記録しない
setopt hist_ignore_dups
