filetype plugin indent on
syntax on

call plug#begin('~/.config/nvim/plugged')

Plug 'jiangmiao/auto-pairs' 					    " auto-close brackets
Plug 'w0ng/vim-hybrid'                              " hybrid theme

call plug#end()

" " :PlugInstall    - installs plugins
" " :PlugUpdate     - install or update plugins
" " :PlugClean      - confirms removal of unused plugins
" " :PlugUpgrade    - upgrades vim-plug itself
" " :PlugStatus     - checks status of plugins
" " :PlugDiff       - diff changes from last update

""""""""""""""""""""""
" General
""""""""""""""""""""""
" encoding
set encoding=utf-8
scriptencoding utf-8

" hybrid theme config
" let g:hybrid_custom_term_colors = 1 " uses colors from .Xresources
set background=dark
colorscheme hybrid

""""""""""""""""""""""
" User Interface
""""""""""""""""""""""

" always show current position
set ruler
" configure backspace
set backspace=eol,start,indent
set whichwrap+=<,>,h,l
" when searching be smart about cases
set smartcase
set ignorecase
" highlight search results
set hlsearch
" modern search
set incsearch
" line numbers
set number
set mouse=a

" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" intent
set ai " auto intent
set si " smart intent
set wrap " wrap lines

" Return to last edit position when opening files
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

""""""""""""""""""""""""""""
" Visual Mode Related
""""""""""""""""""""""""""""

" Visual mode pressing * or # searches for the current selection
vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

" Indent Lines
"""""""""""""""""""""""""""
let g:indentLine_color_term = 13
let g:indentLine_char = '┆'

"""""""""""""""""""""""""""
