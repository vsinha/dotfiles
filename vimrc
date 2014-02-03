set nocompatible "be iMproved
filetype off " On some Linux systems, this is necessary to make sure vundle
             " picks up ftdetect directories in plugins! :(
set modelines=0 "security hole involving modelines

"set t_Co=256
filetype plugin indent on "required for vundle
syntax enable

set background=dark

"nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
"nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

"disable auto-commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set shiftwidth=4
set tabstop=4
set mouse=a
"set noexpandtab
set expandtab

set encoding=utf-8
set scrolloff=5
set autoindent
set showmode
set showcmd
set hidden

set wildmenu
set wildmode=list:longest,full
set wildignore=*.o,*~,*.pyc,*.pyo,*.so,*.sw*,__pycache__

set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set nu
set undofile
"set cursorline
"set relativenumber

set ignorecase "case insensitive matching
set smartcase " match case sensitive if there are uppercase letters
set gdefault
set incsearch " shows the match while typing
set showmatch "show matching brackets
"set hlsearch

nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set wrap
"set textwidth=79
"set formatoptions=qrn1
"set colorcolumn=85

set noerrorbells visualbell t_vb = 
autocmd GUIEnter * set visualbell t_vb=

"nnoremap <up> <nop>
"nnoremap <down> <nop>
"nnoremap <left> <nop>
"nnoremap <right> <nop>
"inoremap <up> <nop>
"inoremap <down> <nop>
"inoremap <left> <nop>
"inoremap <right> <nop>
inoremap <up> <ESC><up>
inoremap <down> <ESC><down>
inoremap <left> <ESC>
inoremap <right> <ESC><right><right>
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk


inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; :
inoremap jj <ESC>
inoremap kk <ESC>

au FocusLost * :wa "save on lose focus
set wildignore+=*.lib,*.dll,*.exe,*.o,*.obj,*.pyc,*.pyo,*.png,*.gif,*.jpg,*.jpeg,*.bmp,*.tiff " ignore filetypes for auto complete
"set smartindent "Copy indent from current line when starting a new line.

set showmatch
highlight MatchParen cterm=bold ctermfg=Grey ctermbg=DarkGrey

" Enhanced keyboard mappings
"
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" recreate tags file with F5
map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
" create doxygen comment
map <F6> :Dox<CR>
" build using makeprg with <F7>
map <F7> :make<CR>
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
"F8 to disable all autoindents (for pasting)
nnoremap <F8> :setl noai nocin nosi inde=<CR> 
" goto definition with F12
map <F12> <C-]>
