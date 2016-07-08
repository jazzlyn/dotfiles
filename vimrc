"""""""""""""""""""""""""""
" Vundle Plugin Manager
"""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
" my plugins
Plugin 'scrooloose/nerdTree' " left navigation tree
Plugin 'jistr/vim-nerdtree-tabs' " nerdtree behaves like one true panel, and closes with last file
Plugin 'Xuyuanp/nerdtree-git-plugin' " git marks on nerdtree
Plugin 'Valloric/YouCompleteMe' " autocomplete
Plugin 'scrooloose/syntastic' " error handling
Plugin 'mattn/emmet-vim' " emmet html/css plugin
Plugin 'nanotech/jellybeans.vim' " dark jelly theme

call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on

" " Brief help
" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins; append `!` to update or just
" :PluginUpdate
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins; append `!` to
" auto-approve removal
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

"""""""""""""""
" General
"""""""""""""""

filetype plugin on
filetype indent on
syntax on
colorscheme jellybeans

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

" be smart, when using tabs
set smarttab
" use spaces instead of tabs
set expandtab
" 1 tab == 2 spaces
set shiftwidth=2
set tabstop=2
" intent
set ai "auto intent
set si "smart intent
set wrap "wrap lines

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

"""""""""""""""""""""""""""
" Emmet
"""""""""""""""""""""""""""
let g:user_emmet_expandabbr_key='<Tab>'
"imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

"""""""""""""""""""""""""""
" NERDTree
"""""""""""""""""""""""""""
" map key to F5
map <F5> :NERDTreeToggle<CR>

" NERDTree GitStatus Symbols
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }

" NERDTree Tabs
let g:nerdtree_tabs_open_on_console_startup=1
let g:nerdtree_tabs_smart_startup_focus=1

" NERDTree File/Directory Colors
" function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
"       exec 'autocmd filetype nerdtree highlight ' . a:extension .'
"       ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='.
"       a:guifg
"             exec 'autocmd filetype nerdtree syn match ' . a:extension .'
"             #^\s\+.*'. a:extension .'$#'
"             endfunction
"
"             call NERDTreeHighlightFile('jade', 'red', 'none', 'green',
"             '#151515')
"             call NERDTreeHighlightFile('ini', 'yellow', 'none', 'yellow',
"             '#151515')
"             call NERDTreeHighlightFile('md', 'blue', 'none', '#3366FF',
"             '#151515')
"             call NERDTreeHighlightFile('yml', 'yellow', 'none', 'yellow',
"             '#151515')
"             call NERDTreeHighlightFile('config', 'yellow', 'none', 'yellow',
"             '#151515')
"             call NERDTreeHighlightFile('conf', 'yellow', 'none', 'yellow',
"             '#151515')
"             call NERDTreeHighlightFile('json', 'yellow', 'none', 'yellow',
"             '#151515')
"             call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow',
"             '#151515')
"             call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan',
"             '#151515')
"             call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan',
"             '#151515')
"             call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red',
"             '#151515')
"             call NERDTreeHighlightFile('js', 'Red', 'none', '#ff0000',
"             '#151515')
"             call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff',
"             '#151515')
"               
"               hi Directory guifg=#99FF99 ctermfg=green
"
