set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
" Plugin 'L9'
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}


"YouCompleteMe-----------------------------------------------------
Plugin 'Valloric/YouCompleteMe'
let g:ycm_python_binary_path = 'python3'
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_confirm_extra_conf = 0
let g:ycm_complete_in_strings = 1
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_complete_in_comments=1
let g:ycm_use_ultisnips_completer=1
set completeopt=longest,menu
inoremap <expr> <CR>       pumvisible() ? "\<C-i>" : "\<CR>"
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1




"NerdTree---------------------------------------------------------
Plugin 'scrooloose/nerdtree'
" NERD tree
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
" Automatically open a NERDTree if no files where specified
autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
" Open a NERDTree
nmap <F2> :NERDTreeToggle<cr>
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }


"TagBar----------------------------------------------------------------
Plugin 'majutsushi/tagbar'
nmap <F10> :TagbarToggle<CR>
let g:tagbar_type_markdown = {
    \ 'ctagstype' : 'markdown',
    \ 'kinds' : [
        \ 'h:Heading_L1',
        \ 'i:Heading_L2',
        \ 'k:Heading_L3'
    \ ]
\ }



"CtrlP-----------------------------------------------------------
Plugin 'kien/ctrlp.vim'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif




"Syntastic----------------------------------------------------------
Plugin 'vim-syntastic/syntastic'
" configure syntastic syntax checking to check on open as well as save
let g:syntastic_check_on_open=0
let g:syntastic_python_checker=['flake8']
let g:syntastic_python_checker_args='--ignore=E501'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_auto_jump = 0
let g:syntastic_check_on_wq = 0
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"emmet---------------------------------------------------------------
Plugin 'mattn/emmet-vim'
let g:user_emmet_mode='n'    "only enable normal mode functions.
let g:user_emmet_mode='inv'  "enable all functions, which is equal to
let g:user_emmet_mode='a'    "enable all function in all mode.
let g:user_emmet_install_global = 0
autocmd FileType html,css,php,htmldjango EmmetInstall
"let g:user_emmet_leader_key='<C-Z>'



"commentary------------------------------------------------------
Plugin 'tpope/vim-commentary'
autocmd FileType apache setlocal commentstring=#\ %s


"delimitMate-------------------------------------------------------
Plugin 'Raimondi/delimitMate'
au FileType python let b:delimitMate_nesting_quotes = ['"']
inoremap <c-a> <esc>la
inoremap <c-A> <esc>la
"pydiction----------------------------------------------------
Plugin 'rkulla/pydiction'
let g:pydiction_location = '~/.vim/tools/pydiction/complete-dict'
let g:pydiction_menu_height = 3
autocmd FileType python set omnifunc=pythoncomplete#Complete

"ultisnips----------------------------------------------------
"Track the engine.
Plugin 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<leader>u"
let g:UltiSnipsEditSplit="vertical"

"help to intelligent fold
Plugin 'tmhedberg/SimpylFold'


"indentython---------------------------------------------------
"auto indent
Plugin 'vim-scripts/indentpython.vim'


"python-mode----------------------------------------------------
Plugin 'python-mode/python-mode', { 'branch': 'develop' }
let g:pymode = 1
let g:pymode_python = 'python3'
let g:pymode_trim_whitespaces = 1
let g:pymode_options = 1
let g:pymode_options_max_line_length = 79
let g:pymode_options_colorcolumn = 1
let g:pymode_quickfix_minheight = 3
let g:pymode_quickfix_maxheight = 6
let g:pymode_indent = 1
let g:pymode_folding = 1


"Dash------------------------------------------------------------
Plugin 'rizzatti/dash.vim'


"Go---------------------------------------------------------------
Plugin 'fatih/vim-go'
Plugin 'Blackrush/vim-gocode'


"" StatusLine-----------------------------------------------------
Plugin 'itchyny/lightline.vim'




" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line






"-----------------------------------------------------------------------


"leader map
let g:mapleader = ","

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Enable folding
set foldmethod=indent
set foldlevel=99



"show blank character
hi BadWhitespace guifg=gray guibg=red ctermfg=gray ctermbg=red
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Enable folding with the spacebar
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

" theme
let g:rehash256 = 1
set t_Co=256
set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }
colorscheme onehalfdark

syntax enable
syntax on

set encoding=utf-8
"PEP8 style indent
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix |
"web indent
au BufNewFile,BufRead *.js,*.html,*.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

"standard
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set autoindent

set showmatch

" Numbers
set number
set numberwidth=5
set ruler
set showcmd


set matchpairs+=<:>
set nohlsearch
set ignorecase
set incsearch
set smartcase


" Highlight current line
au WinLeave * set nocursorline nocursorcolumn
au WinEnter * set cursorline cursorcolumn
set cursorline cursorcolumn
