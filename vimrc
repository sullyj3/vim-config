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
Bundle 'closetag.vim'
Bundle 'unite.vim'
Bundle 'vimroom.vim'
Bundle 'fugitive.vim'
Bundle 'vim-indent-object'
Bundle 'bling/vim-bufferline'
Bundle 'luochen1990/rainbow'
"colors
Bundle 'chriskempson/base16-vim'
Bundle 'baskerville/bubblegum'
Bundle "daylerees/colour-schemes", { "rtp": "vim/" }
Bundle 'jonathanfilip/vim-lucius'
"-----------------------------

"ui stuff --------------------
colorscheme badwolf

syntax enable 			"enable syntax highlighting
set number 			"line numbers
set relativenumber
set cursorline			"highlight current line
set showcmd			"shows curent command bottom right
set wildmenu			"tab completion menu for command line mode
set wildignorecase		"tab completion ignores case
set lazyredraw			"redraws screen less often, improves performance
"undo any fucking with my cursorline the colorscheme may have done:
hi CursorLine term=bold cterm=bold guibg=Grey40
if has("gui_running")
	set guifont=Monospace\ 10
endif

"-----------------------------
"set autochdir " automatically change window's current working dir to file's dir

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
"allows horizontal movement between lines: 
"bkspce, space, left/right arrow, h, l (normal/visual) left/right arrow (insert)
set whichwrap=b,s,<,>,h,l,[,] 

set mouse=a "a for all modes

filetype plugin indent on

"xml folding
let g:xml_syntax_folding=1
au FileType xml setlocal foldmethod=syntax

"airline
set laststatus=2 "when does last window have statusline? 2=always
set noshowmode
set ttimeoutlen=40
let g:airline_powerline_fonts = 1
let g:airline#extensions#bufferline#enabled = 1
let g:bufferline_echo = 0

" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
"requires vimproc plugin for async
"nnoremap <leader>t :<C-u>Unite -buffer-name=files   -start-insert file_rec/async:!<cr>

"requires unite-outline plugin
"nnoremap <leader>o :<C-u>Unite -buffer-name=outline -start-insert outline<cr>

nnoremap <leader>f :<C-u>Unite -buffer-name=files   -start-insert file<cr>
nnoremap <leader>m :<C-u>Unite -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>y :<C-u>Unite -buffer-name=yank    -start-insert history/yank<cr>
nnoremap <leader>b :<C-u>Unite -buffer-name=buffer  buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  "let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

let g:rainbow_active = 1
