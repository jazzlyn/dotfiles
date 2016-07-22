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
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight' " nerdtree highlighting
Plugin 'Xuyuanp/nerdtree-git-plugin' " git marks on nerdtree
Plugin 'scrooloose/syntastic' " linting all programming languages, if available
Plugin 'Shutnik/jshint2.vim' " javascript jshint for syntastic
Plugin 'jelera/vim-javascript-syntax' " better syntax highlighting
Plugin '1995eaton/vim-better-javascript-completion' " replaces default vim syntax completion with newer version
Plugin 'othree/jspc.vim' " function param completer
Plugin 'mattn/emmet-vim' " emmet html/css plugin
Plugin 'w0ng/vim-hybrid' " hybrid theme

call vundle#end()            " required
filetype plugin indent on    " required
syntax on

" " :PluginList       - lists configured plugins
" " :PluginInstall    - installs plugins
" " :PluginUpdate     - update plugins
" " :PluginSearch foo - searches for foo; append `!` to refresh local cache
" " :PluginClean      - confirms removal of unused plugins
" "
" " see :h vundle for more details or wiki for FAQ
" " Put your non-Plugin stuff after this line

"""""""""""""""
" General
"""""""""""""""

set omnifunc=syntaxcomplete#Complete " set default syntax completion on
let g:vimjs#smartcomplete = 1 " if enabled, typing ocument will suggest document too

" hybrid theme config
colorscheme hybrid
"let g:hybrid_custom_term_colors = 1 " uses colors from .Xresources
set background=dark

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

"""""""""""""""""""""""""""
" Emmet
"""""""""""""""""""""""""""
"let g:user_emmet_expandabbr_key='<Tab>'
"imap <expr> <tab> emmet#expandAbbrIntelligent("\<tab>")

"""""""""""""""""""""""""""
" Syntastic
"""""""""""""""""""""""""""
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

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

" NERDTree Highlighting
let g:NERDTreeFileExtensionHighlightFullName = 1 " highlight full filename
let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid errors, '' in array sets color to none
let g:NERDTreeExtensionHighlightColor['css'] = '00FF00'
let g:NERDTreeExtensionHighlightColor['css'] = '00FF00'
let g:NERDTreeExtensionHighlightColor['css'] = '00FF00'
let g:NERDTreeExtensionHighlightColor['css'] = '00FF00'
let g:NERDTreeExtensionHighlightColor['css'] = '00FF00'
let g:NERDTreeExtensionHighlightColor['css'] = '00FF00'
let g:NERDTreeExtensionHighlightColor['css'] = '00FF00'
let g:NERDTreeExtensionHighlightColor['css'] = '00FF00'
let g:NERDTreeExtensionHighlightColor['css'] = '00FF00'
let g:NERDTreeExtensionHighlightColor['css'] = '00FF00'
let g:NERDTreeExtensionHighlightColor['css'] = '00FF00'
