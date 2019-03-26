" ファイルタイプ別のVimプラグイン/インデントを有効にする
filetype plugin indent on

if has('vim_starting')
  set rtp+=~/.vim/plugged/vim-plug
  if !isdirectory(expand('~/.vim/plugged/vim-plug'))
    echo 'install vim-plug...'
    call system('mkdir -p ~/.vim/plugged/vim-plug')
    call system('git clone https://github.com/junegunn/vim-plug.git ~/.vim/plugged/vim-plug/autoload')
  end
endif

call plug#begin('~/.vim/plugged')
  " ツリー型エクスプローラ
  Plug 'scrooloose/nerdtree'

  " タブバーのカスタマイズ
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  " CoffeeScript
  Plug 'kchmck/vim-coffee-script'
call plug#end()

syntax on
set encoding=utf-8
set hlsearch
set ignorecase
set wrapscan
set noswapfile
set autoindent
set number
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set cursorline
set incsearch
set wildmenu wildmode=list:full
set clipboard=unnamed,autoselect
set laststatus=2
set statusline=%F%r%=
set backspace=indent,eol,start
set infercase
set completeopt=menuone
set scrolloff=3

" 不可視ファイルを表示する
let NERDTreeShowHidden = 1

" カラースキーマ
colorscheme Tomorrow-Night

" 入力補完
for k in split("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ_",'\zs')
	exec "imap <expr> " . k . " pumvisible() ? '" . k . "' : '" . k . "\<C-X>\<C-P>\<C-N>'"
endfor

" ----------------------------------------------------------------------------------------
" キーバインド
" ----------------------------------------------------------------------------------------

" 検索ハイライトの打ち消し
nmap <Esc><Esc> :nohlsearch<CR><Esc>

" エクスプローラの表示・非表
nnoremap <silent><C-e> :NERDTreeToggle<CR>

" タブバーのカスタマイズを有効にする
let g:airline#extensions#tabline#enabled = 1

" タブバーの右領域を非表示にする
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tab_type = 0
let g:airline#extensions#tabline#show_close_button = 0

let g:airline_theme='deus'

"タブ
nnoremap tt :tabnew<Enter>
nnoremap lt gT

" 画面分割
nnoremap ss :split<Enter>
nnoremap sv :vsplit<Enter>

" 画面移動
nnoremap w<Left> <C-w>h
nnoremap w<Down> <C-w>j
nnoremap w<Up> <C-w>k
nnoremap w<Right> <C-w>l