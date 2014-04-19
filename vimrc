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
"-----------------------------

"ui stuff --------------------
syntax enable 			"enable syntax highlighting
set number 			"line numbers
set relativenumber
set cursorline			"highlight current line
set showcmd			"shows curent command bottom right
set wildmenu			"tab completion menu for command line mode
set wildignorecase		"tab completion ignores case
set lazyredraw			"redraws screen less often, improves performance
"set showmatch			"highlight matching bracket

if has("gui_running")
	set guifont=Monospace\ 10
	set background=light
	colorscheme solarized
else
	set background=dark
	colorscheme zenburn
"	hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=NONE guibg=darkred guifg=white
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

"ctrlp stuff
let g:ctrlp_cache_dir = $HOME . '/.cache/ctrlp'
if executable('ag')
	let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
endif

" Unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
"doesnt seem to work
"nnoremap <leader>t :<C-u>Unite -no-split -buffer-name=files   -start-insert file_rec/async:!<cr>
nnoremap <leader>f :<C-u>Unite -no-split -buffer-name=files   -start-insert file<cr>
nnoremap <leader>r :<C-u>Unite -no-split -buffer-name=mru     -start-insert file_mru<cr>
nnoremap <leader>o :<C-u>Unite -no-split -buffer-name=outline -start-insert outline<cr>
nnoremap <leader>y :<C-u>Unite -no-split -buffer-name=yank    history/yank<cr>
nnoremap <leader>e :<C-u>Unite -no-split -buffer-name=buffer  buffer<cr>

" Custom mappings for the unite buffer
autocmd FileType unite call s:unite_settings()
function! s:unite_settings()
  " Play nice with supertab
  "let b:SuperTabDisabled=1
  " Enable navigation with control-j and control-k in insert mode
  imap <buffer> <C-j>   <Plug>(unite_select_next_line)
  imap <buffer> <C-k>   <Plug>(unite_select_previous_line)
endfunction

