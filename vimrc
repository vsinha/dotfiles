set nocompatible "be iMproved
filetype off " necessary to make sure vundle does something
set modelines=0 "security hole involving modelines

filetype plugin indent on "required for vundle
"syntax enable

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

Bundle 'scrooloose/syntastic'
Bundle 'vim-scripts/SearchComplete'
Bundle 'altercation/vim-colors-solarized'
Bundle 'bling/vim-airline'
Bundle 'Yggdroot/indentLine'          
Bundle 'kien/ctrlp.vim'
Bundle 'Raimondi/delimitMate'
Bundle 'myusuf3/numbers.vim'
"Bundle 'ervandew/supertab'
"Bundle 'tpope/vim-fugitive'

" General Options
" -------------------------------------
set t_Co=256                          " enable 256 colors
set mouse=a                           " make sure mouse is used in all cases.
set autoread                          " detect external changes
"set encoding=utf-8
set autoread                          " detect external changes
set scrolloff=5                       " lines between cursor and edge
set autoindent
set showmode
set hidden
set showcmd                           " display current command
set cmdheight=1                       " set the command height
set shortmess+=I                      " disable the welcome screen
set complete+=k                       " enable dictionary completion
set wildmenu  " cmd line completion
set wildmode=list:longest,full
set wildignore=*.o,*~,*.pyc,*.pyo,*.so,*.sw*,__pycache__
set ttyfast
set ruler                             " ruler display in status line
set backspace=2                       " full backspacing capabilities
set backspace=indent,eol,start        " behave like a normal backspace
set laststatus=2                      " always show a status line
set clipboard+=unnamed                " yank and copy to X clipboard
set number                            " show number line
set undofile
set magic                             " enables regex highlight?
"set cc=80                            " 80 char column indicator

" tabs and indenting
" -------------------------------------
"set expandtab                         " replace tabs with spaces
set noexpandtab
set shiftwidth=4
set tabstop=4
set autoindent                        " auto indents next new line
set smarttab                          " it reads your mind?
set shiftround                        " better tab aligning

" searching
" -------------------------------------
set hlsearch                          " highlight search results
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
set noerrorbells visualbell t_vb = 
autocmd GUIEnter * set visualbell t_vb=
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

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
set background=dark

" custom keybindings
" -------------------------------------
" hjkl only
inoremap <up> <ESC><up>
inoremap <down> <ESC><down>
inoremap <left> <ESC>
inoremap <right> <ESC><right><right>
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
inoremap kj <ESC>
inoremap kk <ESC>

" allow writing root files when forgetting to sudo
cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

" auto commands
" -------------------------------------
" turn hash bangs into executeables automatically
au BufWritePost * if getline(1) =~ "^#!" | silent :!chmod +x <afile>
au BufWritePost .vimrc source %

" save last position
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif "

"disable auto-commenting
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"save on lose focus
au FocusLost * :wa 
set wildignore+=*.lib,*.dll,*.exe,*.o,*.obj,*.pyc,*.pyo,*.png,*.gif,*.jpg,*.jpeg,*.bmp,*.tiff " ignore filetypes for auto complete

" F key bindings
" -------------------------------------
" in normal mode F2 will save the file
nmap <F2> :w<CR>
" in insert mode F2 will exit insert, save, enters insert again
imap <F2> <ESC>:w<CR>i
" switch between header/source with F4
map <F4> :e %:p:s,.h$,.X123X,:s,.cpp$,.h,:s,.X123X$,.cpp,<CR>
" recreate tags file with F5
map <F5> :!ctags -R –c++-kinds=+p –fields=+iaS –extra=+q .<CR>
" create doxygen comment
"map <F6> :Dox<CR>
" build using makeprg with <F7>
map <F7> :make<CR>
" build using makeprg with <S-F7>
map <S-F7> :make clean all<CR>
"F8 to disable all autoindents (for pasting)
nnoremap <F8> :setl noai nocin nosi inde=<CR> 
" goto definition with F12
map <F12> <C-]>

" plugin settings
" -------------------------------------
"filetype plugin indent on " required for vundle

" syntastic left side bar color
hi SignColumn ctermbg=237

" indentLine
let g:indentLine_color_term = 234
let g:indentLine_char = '|'

" delimiteMate
let delimitMate_expand_cr=1

" airline
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"

" Syntastic
let g:syntastic_error_symbol = '✘'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✘'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_check_on_wq = 1
let g:syntastic_check_on_open = 1
let g:syntastic_auto_loc_list = 2
let g:syntastic_always_populate_loc_list = 1
" let syntastic_full_redraws = 0
" let g:sytastic_mode_map = { 'mode': 'active',
                          " \ 'active_filetypes': ['javascript', 'python'],
                          " \ 'passive_filetypes': []}
