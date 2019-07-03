set nocompatible      " be iMproved, required
set encoding=utf-8
set clipboard=unnamed

" Allows you to :e file automplete in subdirectories
set path+=**
set wildmenu

" Execute line under cursor in bash
nmap <F6> :exec '!'.getline('.')

" For some reason, the vertical bar cursor stopped working by default in
" insert mode, and I found this which also apparently applies some fixes to
" tmux, which I use
if exists('$TMUX')
  let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
  let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
else
  let &t_SI = "\<Esc>]50;CursorShape=1\x7"
  let &t_EI = "\<Esc>]50;CursorShape=0\x7"
endif

filetype plugin indent on

call plug#begin()
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'othree/yajs'
Plug 'mxw/vim-jsx'
Plug 'hashivim/vim-terraform'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
Plug 'vim-airline/vim-airline'
Plug 'airblade/vim-gitgutter'
Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }
Plug 'mustache/vim-mustache-handlebars'
call plug#end()

colorscheme onehalfdark

" vodoo for true color, along with .tmux.conf settings
set termguicolors
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

let g:prettier#autoformat = 0
au BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml Prettier
au BufRead,BufNewFile *.js setlocal syntax=javascript.jsx
au BufRead,BufNewFile *.yaml,*.yml set filetype=yaml.ansible

" automatically wrap in markdown
au BufRead,BufNewFile *.md setlocal textwidth=80

" new version of vim is dumb and wont delete over line breaks
set backspace=2

" Enable syntax highlight
syntax enable

set autoindent
set smartindent
set ttyfast

" Spaces to tabs
set expandtab
set tabstop=2
set shiftwidth=2

" Turn on search highlighting
set hlsearch

" Deal with upper/lower better
set smartcase
set ignorecase

" Light 80 column ruler for non-intrusive visual guide for format
if exists('+colorcolumn')
   set colorcolumn=80
endif

" Add line numbers
set number

" Set the status line to something nifty
set stl=%f\ Line:%l/%L\ (%p%%)\ Col:%v\ Buf:#%n\ 0x%B

" always show a status line
set laststatus=2
