"Matt's NeoVim
set nocompatible

"Set python to use
if has('unix')
	let g:python3_host_prog = '~/miniconda3/bin/python'
    endif

call plug#begin()
	" Interface colors and themes
	Plug 'arcticicestudio/nord-vim' " colorscheme
	Plug 'itchyny/lightline.vim' " status bar

	" Git
	Plug 'tpope/vim-fugitive'
	
	" SQL
	Plug 'tpope/vim-dadbod'

	" lsp and completion
	Plug 'neovim/nvim-lspconfig'
	Plug 'nvim-lua/completion-nvim'
	Plug 'steelsojka/completion-buffers'
	Plug 'kristijanhusak/vim-dadbod-completion'
call plug#end()

"--------------------
" source other files
"--------------------
source ~/.config/nvim/mydadbods.vim

"--------------------
" lsp and completion
"--------------------
" require language server
lua << EOF
require'lspconfig'.pyls.setup{}
EOF

" completion in every buffer
autocm BufEnter * lua require'completion'.on_attach()

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

"map <c-p> to manually trigger completion
imap <silent> <c-p> <Plug>(completion_trigger)

let g:completion_matching_strategy_list = ['exact', 'substring']

let g:completion_chain_complete_list = {
    \'default' : [
    \   {'complete_items' : ['lsp', 'buffers']},
    \   {'mode' : '<c-p>'},
    \   {'mode' : '<c-n>'}
    \],
    \'sql': [
    \	{'complete_items' : ['vim-dadbod-completion', 'lsp', 'buffers']},
    \]
    \}

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

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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
