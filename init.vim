" ── Base ──────────────────────────────────────────────────────
set hidden
set nobackup
set nowritebackup
set updatetime=300
set signcolumn=yes
set cmdheight=2
set shortmess+=c
set mouse=a
set clipboard=unnamedplus
set termguicolors
set number
set relativenumber
set hlsearch
set incsearch
set ignorecase
set smartcase
set autoindent
set expandtab
set tabstop=4
set shiftwidth=4
set backspace=2
set wildmenu
set wildmode=list:longest,full
set noswapfile
set undodir=~/.vim/undo
set undofile
set splitbelow
set splitright

syntax enable
filetype plugin indent on

let mapleader = ' '

" ── Plugins ───────────────────────────────────────────────────
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'scrooloose/nerdtree'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'sainnhe/everforest'
Plug 'itchyny/lightline.vim'
Plug 'preservim/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } }

call plug#end()

colorscheme everforest
set background=dark
set noshowmode

" ── Source config ─────────────────────────────────────────────
let g:vim_dir = expand('<sfile>:p:h')
for s:f in glob(g:vim_dir . '/plugins/*.vim', 0, 1)
  execute 'source ' . s:f
endfor
execute 'source ' . g:vim_dir . '/keymaps.vim'
