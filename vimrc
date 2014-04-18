set shell=bash

" vundle stuff --------------
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'
"bundles
Bundle 'mbadran/headlights'
Bundle 'yegappan/mru'
Bundle 'kevinw/pyflakes-vim'
Bundle 'tmhedberg/SimpylFold'
Bundle 'bling/vim-airline'
Bundle 'syntastic'
Bundle 'xmledit'
"-----------------------------

"ui stuff --------------------
syntax enable 			"enable syntax highlighting
set number 			"line numbers
set cursorline			"highlight current line
set showcmd			"shows curent command bottom right
set wildmenu			"tab completion menu for command line mode
set lazyredraw			"redraws screen less often, improves performance
"set showmatch			"highlight matching bracket

if has("gui_running")
	set guifont=Monospace\ 10
	set background=light
	colorscheme solarized
else
	set background=dark
	colorscheme molokai
"	hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=NONE guibg=darkred guifg=white
endif

"-----------------------------
set autochdir " automatically change window's current working dir to file's dir

"search options --------------
set ignorecase
set smartcase "only case sensitive if string contains caps
set hlsearch

" backslash space for :noh
nnoremap <leader><space> :nohlsearch<CR>  

" make Y yank to EOL rather than synonym for yy
nnoremap Y y$

"-----------------------------
set backspace=indent,eol,start
set whichwrap+=<,>,h,l "allows horizontal movement between lines

set mouse=a "a for all modes

filetype plugin indent on

"xml folding
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

"airline
set laststatus=2 "when does last window have statusline? 2=always
set noshowmode
set ttimeoutlen=40
