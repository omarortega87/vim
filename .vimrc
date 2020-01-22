"setup shell
set shell=/bin/zsh
syntax on                  " Enable syntax highlighting.
filetype plugin indent on  " Enable file type based indentation.
set laststatus=2

let g:currentmode={
       \ 'n'  : 'NORMAL ',
       \ 'v'  : 'VISUAL ',
       \ 'V'  : 'V·Line ',
       \ '' : 'V·Block ',
       \ 'i'  : 'INSERT ',
       \ 'R'  : 'R ',
       \ 'Rv' : 'V·Replace ',
       \ 'c'  : 'Command ',
       \}

set statusline=
set statusline+=\ %{toupper(g:currentmode[mode()])}
set statusline+=%{&modified?'[+]':''}
"" use highlight group User2

set autoindent             " Respect indentation when starting a new line.
set expandtab              " Expand tabs to spaces. Essential in Python.
set tabstop=4              " Number of spaces tab is counted for.
set shiftwidth=4           " Number of spaces to use for autoindent.

set backspace=2            " Fix backspace behavior on most terminals.

" Navigate windows with <Ctrl-hjkl> instead of <Ctrl-w> followed by hjkl.
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

set wildmenu                    " Enable enhanced tab autocomplete.
set wildmode=list:longest,full  " Complete till longest string, then open menu.

set number                      " Display column numbers.
set relativenumber              " Display relative column numbers.

set hlsearch                    " Highlight search results.
set incsearch                   " Search as you type.

" Map arrow keys nothing so I can get used to hjkl-style movement.
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" Immediately add a closing quotes or braces in insert mode.
inoremap ' ''<esc>i
inoremap " ""<esc>i
inoremap ( ()<esc>i
inoremap { {}<esc>i
inoremap [ []<esc>i

let mapleader = ','   " Map the leader key to a comma.

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')
" Declare the list of plugins.
"Neerdtree plugin - desplaying the folders tree"
Plug 'scrooloose/nerdtree'
Plug 'artur-shaik/vim-javacomplete2', {'for': 'java'} 
Plug 'scrooloose/syntastic'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
""Plug 'liuchengxu/space-vim-dark'
Plug 'dikiaap/minimalist'
" List ends here. Plugins become visible to Vim after this call.

call plug#end()

"Setting up the colorcheme"
""colorscheme space-vim-dark
""hi Normal     ctermbg=NONE guibg=NONE
""hi LineNr     ctermbg=NONE guibg=NONE
""hi SignColumn ctermbg=NONE guibg=NONE
set t_Co=256
syntax on
colorscheme minimalist



"Setting up Imports - Java
nmap <F5> <Plug>(JavaComplete-Imports-Add)
imap <F5> <Plug>(JavaComplete-Imports-Add)
" Easy compile java in vim
autocmd FileType java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C.%#
setlocal omnifunc=javacomplete#Complete
let g:JavaComplete_JavaCompiler="/Library/Java/JavaVirtualMachines/jdk1.8.0_231.jdk/Contents/Home/bin"

" Syntastic Settings
let g:syntastic_always_populate_loc_list=1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_auto_loc_list = 2
let g:syntastic_enable_signs = 1
let g:syntastic_java_checkers = ['checkstyle', 'javac']
let g:syntastic_java_javac_delete_output = 1
let g:syntastic_java_checkstyle_conf_file = '/Users/omarortega/.vim/custom/config/sun_checks.xml'
let g:syntastic_java_checkstyle_classpath = '/Users/omarortega/.vim/custom/config/checkstyle-8.27-all.jar'
let g:syntastic_filetype_map = { 'rnoweb': 'tex'}

"Settings Ctags
set tags=tags

"NERDTree Settings"
"Bookmarks"
let NERDTreeShowBookmarks=1 "Display bookmarks on startup"
"autocmd VimEnter * NERDTree "Enable NERDTree on Vim Startup"
" Autoclose NERDTree if it's the only open window left.
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") &&
   \ b:NERDTree.isTabTree()) | q | endif

"FZF customazing "
" [Buffers] Jump to the existing window if possible
let g:fzf_buffers_jump = 1

" [[B]Commits] Customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R'

" [Commands] --expect expression for directly executing the command
let g:fzf_commands_expect = 'alt-enter,ctrl-x'


