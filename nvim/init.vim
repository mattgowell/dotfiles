"Matt's NeoVim
set nocompatible

call plug#begin()
	" Interface
	Plug 'itchyny/lightline.vim' " status bar

	"colors and themes
	Plug 'arcticicestudio/nord-vim'

	" Git
	Plug 'tpope/vim-fugitive'
call plug#end()

"--------------------
"Interface
"--------------------
set clipboard=unnamedplus "use system clipboard
set mouse=a " enable mouse in all
set ttyfast
set nu " show line number
set rnu " enable relative line numbers
set scrolloff=5 " include lines around when possible

" More intuitive window splitting direction
set splitbelow
set splitright
set noequalalways

"--------------------
"Syntax
"--------------------
syntax on " syntax highlighting
set showmatch " matching braces
set autoindent " newline automatically indented
set wrap
set synmaxcol=500 " limit syntax loading
set softtabstop=4
set shiftwidth=4

"--------------------
"Search
"--------------------
set incsearch " incremental search
set hls " highlight search

" Use smartcase for search
set ignorecase
set smartcase


"--------------------
"Colors and Styling
"--------------------
"colors
set termguicolors
colorscheme nord

"Lightline Config
set noshowmode
let g:lightline = {
	\ 'colorscheme': 'nord',
	\ 'active': {
	\   'left': [ [ 'mode', 'paste' ],
	\             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
	\ },
	\ 'component_function': {
	\   'gitbranch': 'FugitiveHead'
	\ },
	\ }
