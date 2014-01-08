set nocompatible "be iMproved
filetype off " On some Linux systems, this is necessary to make sure vundle
             " picks up ftdetect directories in plugins! :(
set modelines=0 "security hole involving modelines

" should automatically set up vundle and install all bundles is vundle is not installed
" Setting up Vundle - the vim plugin bundler
" Run :BundleInstall to install bundles after vundle is installed
  let iCanHazVundle=1
  let vundle_readme=expand('~/.vim/bundle/vundle/README.md')
  if !filereadable(vundle_readme)
      echo "Installing Vundle.."
      echo ""
      silent !mkdir -p ~/.vim/bundle
      silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
      let iCanHazVundle=0
  endif
  set rtp+=~/.vim/bundle/vundle/
  call vundle#rc()

  Bundle 'tpope/vim-fugitive'
  Bundle 'tpope/vim-surround'
  Bundle 'scrooloose/syntastic'
  Bundle 'mikewest/vimroom'
  Bundle 'vim-scripts/screen.vim'
  Bundle 'vim-scripts/SearchComplete'
  Bundle 'ervandew/supertab'
  Bundle 'altercation/vim-colors-solarized'
  Bundle 'Lokaltog/vim-powerline' 
  Bundle 'myusuf3/numbers.vim'
  Bundle 'matze/dwm.vim'
  Bundle 'osyo-manga/vim-over'
  "Bundle 'scrooloose/nerdtree'
  "Bundle 'wikitopian/hardmode' "no movement keys work
  "Bundle 'vim-scripts/VimClojure'
  
  "python
  Bundle 'python.vim'
  Bundle 'kevinw/pyflakes-vim'
  Bundle 'python_match.vim'
  Bundle 'pythoncomplete'

"Bundle Configs
"let NERDTreeWinSize = 12

set t_Co=256
filetype plugin indent on "required for vundle
syntax enable

if !has('gui_running')
	let g:solarized_termtrans=1
endif

colorscheme solarized
set background=dark

"nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
"nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

"disable auto-commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set shiftwidth=4
set tabstop=4
set mouse=a
set noexpandtab

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

inoremap <up> <ESC><up>
inoremap <down> <ESC><down>
inoremap <left> <ESC>
inoremap <right> <ESC><right><right>
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

"remap H to go to beginning of line - enhanced h behavior
nnoremap H 0
 
"remap L to go to end of line - enhanced l behavior
nnoremap L $

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

nnoremap ; :
inoremap jj <ESC>
inoremap jk <ESC>
inoremap kj <ESC>
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
