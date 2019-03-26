" 行を表示
set number
set encoding=utf-8
scriptencoding utf-8
set ambiwidth=double " □や○文字が崩れる問題を解決
set tabstop=3 "画面上でタブ文字が占める割合
set cursorline "カーソルをハイライト
set ruler "カーソルが何行目の何列目に置かれているかを表示する
set showmatch "括弧の対応関係を一瞬表示する
set wildmenu "コマンドの補完をする

"クリップボードからのペーストのインデントを自動調節
if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
endif

"----------------------------------------------------------
" ステータスラインの設定
"----------------------------------------------------------
set laststatus=2 " ステータスラインを常に表示
set showmode " 現在のモードを表示
set showcmd " 打ったコマンドをステータスラインの下に表示
set ruler " ステータスラインの右側にカーソルの現在位置を表示する
":NERTreeをcontroll-eで使用
nnoremap <silent><C-e> :NERDTreeToggle<CR>

set t_Co=256 " iTerm2など既に256色環境なら無くても良い
syntax enable " 構文に色を付ける


" ファイルタイプ別のVimプラグイン/インデントを有効にする
filetype plugin indent on

""""""""""""""""""""""""""
" プラグイン管理dein.vim "
""""""""""""""""""""""""""
" プラグインが実際にインストールされるディレクトリ
let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
" let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
" call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif

syntax on
colorscheme molokai
