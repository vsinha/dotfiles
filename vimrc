set nocompatible "be iMproved
filetype off " necessary to make sure vundle does something
set modelines=0 "security hole involving modelines

filetype plugin indent on "required for vundle
syntax enable

" General Options
" -------------------------------------
" automatically set up vundle and install all bundles if vundle is not installed
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

Bundle 'gmarik/vundle'
"Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/SearchComplete'
Bundle 'Lokaltog/vim-powerline'
" Bundle 'bling/vim-airline'
Bundle 'kien/ctrlp.vim'
Bundle 'myusuf3/numbers.vim'
Bundle 'octol/vim-cpp-enhanced-highlight'
Bundle 'ervandew/supertab'
Bundle 'tpope/vim-fugitive'
" Bundle 'tpope/vim-sleuth'
Bundle 'tomtom/tcomment_vim'
Bundle 'christoomey/vim-tmux-navigator'

"Bundle "MarcWeber/vim-addon-mw-utils"
"Bundle "tomtom/tlib_vim"
"Bundle "garbas/vim-snipmate"
"Bundle "honza/vim-snippets"

"let g:Powerline_symbols = 'fancy'
set fillchars+=stl:\ ,stlnc:\


" General Options
" -------------------------------------
set t_Co=256                          " enable 256 colors
set encoding=utf-8
set mouse=a                           " make sure mouse is used in all cases.
set autoread                          " detect external changes
set scrolloff=5                       " lines between cursor and edge
set autoindent
set showmode
set hidden
set showcmd                           " display current command
set cmdheight=1                       " set the command height
set shortmess+=I                      " disable the welcome screen
set complete+=k                       " enable dictionary completion
set wildmenu  			      " cmd line completion
set wildmode=list:longest,full
set wildignore=*.o,*~,*.pyc,*.pyo,*.so,*.sw*,__pycache__
set ttyfast
set ruler                             " ruler display in status line
set backspace=2                       " full backspacing capabilities
set backspace=indent,eol,start        " behave like a normal backspace
set laststatus=2                      " always show a status line
set clipboard+=unnamed                " yank and copy to X clipboard
set number                            " show number line
set magic                             " enables regex highlight?
set ttimeoutlen=-1 
set timeoutlen=300	  	      " esc delay
"set cc=80                            " 80 char column indicator

" undofile 
" -------------------------------------
if exists("+undofile")
  " Uses .vim-undo first, then ~/.vim/undo
  " :help undo-persistence
  " (This is only present in 7.3+)
  if isdirectory($HOME . '/.vim/undo') == 0
    :silent !mkdir -p ~/.vim/undo > /dev/null 2>&1
  endif
  set undodir=./.vim-undo//
  set undodir+=~/.vim/undo//
  set undofile
endif

" tabs and indenting
" -------------------------------------
" should be taken care of by vim-sleuth 
set expandtab                         " replace tabs with spaces
"set noexpandtab
set shiftwidth=4
set tabstop=2
set autoindent                        " auto indents next new line
"set smarttab                          " it reads your mind?
set shiftround                        " better tab aligning


" searching
" -------------------------------------
"set hlsearch                         " highlight search results
set nohlsearch
set incsearch                         " increment search
set ignorecase                        " case-insensitive search
set smartcase                         " upper-case sensitive search
set gdefault
set showmatch                         " show matching brackets (),{},[]
highlight MatchParen cterm=bold ctermfg=Grey ctermbg=DarkGrey


"  wrap like other editors
" -------------------------------------
set wrap                              " word wrap
set lbr                               " line break


" no bells
" -------------------------------------
set noerrorbells visualbell t_vb = 
autocmd GUIEnter * set visualbell t_vb=

" Syntax for antlr files
au BufRead,BufNewFile *.g4 set syntax=antlr3


" Code Folding
"---------------------------------
if has ('folding')
  set foldenable
  set foldmethod=marker
  set foldmarker={{{,}}}
  set foldcolumn=0
endif


" syntax highlighting
" -------------------------------------
syntax on
syntax enable
"set background=dark
hi Visual ctermbg=grey ctermfg=black


" custom keybindings
" -------------------------------------
"nnoremap <leader><space> :noh<cr>
"nnoremap <tab> %
"vnoremap <tab> %

" hjkl only
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" remap H to go to beginning of line, L to end
nnoremap H ^
nnoremap L $

" halp
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" autocorrect plx
nnoremap ; :

" get out of insert mode
inoremap jj <ESC>
inoremap jk <ESC>
"inoremap kj <ESC>
"inoremap kk <ESC>

" some emacs-esque keybindings
noremap <C-a> <Home>
noremap <C-e> <End>

" allow writing root files when forgetting to sudo
cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

" F8 to disable all autoindents (for pasting)
nnoremap <F8> :setl noai nocin nosi inde=<CR> 

" keep macro window from popping up
map q: :q


" auto commands
" -------------------------------------
" turn hash bangs into executeables automatically
au BufWritePost * if getline(1) =~ "^#!" | silent :!chmod +x <afile>
au BufWritePost .vimrc source %

" save last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif "

" disable auto-commenting
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" save on lose focus
au FocusLost * :wa 
set wildignore+=*.lib,*.dll,*.exe,*.o,*.obj,*.pyc,*.pyo,*.png,*.gif,*.jpg,*.jpeg,*.bmp,*.tiff " ignore filetypes for auto complete

" highlight yacc files as if they were cpp files
au BufRead,BufNewFile *.y set syntax=cpp


" plugin settings
" -------------------------------------
" syntastic left side bar color
hi SignColumn ctermbg=237

" indentLine
let g:indentLine_color_term = 234
let g:indentLine_char = '|'

" delimiteMate
let delimitMate_expand_cr=1

"let g:Powerline_symbols = 'fancy'

" airline
" let g:airline_theme='powerlineish'
" let g:airline_powerline_fonts = 1
" let g:airline_section_z=''
" let g:airline_left_sep=''
" let g:airline_right_sep=''
" autocmd VimEnter * AirlineToggleWhitespace
