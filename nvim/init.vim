filetype plugin indent on
syntax on

function! DoRemote(arg)
  UpdateRemotePlugins
endfunction

call plug#begin('~/.config/nvim/plugged')

Plug 'scrooloose/nerdTree' 					        " left navigation tree
Plug 'jistr/vim-nerdtree-tabs' 					    " nerdtree behaves like one true panel, and closes with last file
Plug 'tiagofumo/vim-nerdtree-syntax-highlight' 	    " nerdtree highlighting
Plug 'Xuyuanp/nerdtree-git-plugin' 				    " git marks on nerdtree
Plug 'scrooloose/syntastic' 					    " linting all programming languages, if available
Plug 'Shutnik/jshint2.vim' 					        " javascript jshint for syntastic
Plug 'jelera/vim-javascript-syntax' 			    " better syntax highlighting
Plug '1995eaton/vim-better-javascript-completion' 	" replaces default vim syntax completion with newer version
Plug 'Shougo/deoplete.nvim', { 'do': function('DoRemote')}	" autocomplete for nvim
Plug 'jiangmiao/auto-pairs' 					    " auto-close brackets
Plug 'othree/jspc.vim'                              " function param completer
Plug 'mattn/emmet-vim'                              " emmet html/css plugin
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

" autocomplete plugin
let g:deoplete#enable_at_startup = 1

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
highlight SyntasticErrorSign guifg=red
highlight SyntasticWarningSign guifg=yellow

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 1
let g:syntastic_enable_signs = 1
let g:syntastic_error_symbol = '>>'
let g:syntastic_warning_symbol = '>>'
let g:syntastic_html_checkers = ['tidy']
" let g:syntastic_jinja2_checkers = ['']
let g:syntastic_css_checkers = ['csslint']
let g:syntastic_scss_checkers = ['sass-lint']
let g:syntastic_sass_checkers = ['sass-lint']
let g:syntastic_js_checkers = ['jshint']
let g:syntastic_json_checkers = ['jsonlint']
" let g:syntastic_py_checkers = ['']

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
let g:NERDTreeExtensionHighlightColor['html'] = '00FFFF'
let g:NERDTreeExtensionHighlightColor['jinja2'] = '00FFFF'
let g:NERDTreeExtensionHighlightColor['css'] = 'FFFF00'
let g:NERDTreeExtensionHighlightColor['scss'] = 'FFFF00'
let g:NERDTreeExtensionHighlightColor['js'] = 'FF00FF'
let g:NERDTreeExtensionHighlightColor['jar'] = 'FF00FF'
let g:NERDTreeExtensionHighlightColor['py'] = 'FF0000'
let g:NERDTreeExtensionHighlightColor['json'] = '80800'
