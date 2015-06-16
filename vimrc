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

Plugin 'gmarik/vundle'
Plugin 'scrooloose/syntastic'
Plugin 'vim-scripts/SearchComplete'
Plugin 'Lokaltog/vim-powerline'
Plugin 'kien/ctrlp.vim'
Plugin 'myusuf3/numbers.vim'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'ervandew/supertab'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-sleuth' 
Plugin 'tomtom/tcomment_vim'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'justinmk/vim-sneak'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'terryma/vim-expand-region'
Plugin 'chase/vim-ansible-yaml'
Plugin 'vim-scripts/st.vim'
Plugin 'jelera/vim-javascript-syntax'
Plugin 'altercation/vim-colors-solarized'
"Plugin 'jiangmiao/auto-pairs'
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'scrooloose/nerdcommenter'
Plugin 'ingydotnet/yaml-vim'

" javascript / react
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
let g:jsx_ext_required = 0

" haskell
Plugin 'raichoo/haskell-vim'
Plugin 'adinapoli/cumino'


" OSX specific options
" -------------------------------------
set clipboard=unnamed 		      " yy p etc all use the mac clipboard


" General Options
" -------------------------------------
set t_Co=256                          " enable 256 colors
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
set wildignore=*.o,*~,*.pyc,*.pyo,*.so,*.sw*,__pycache__,*/tmp/*,*.swp,*.zip 
set ttyfast
set ruler                             " ruler display in status line
set backspace=2                       " full backspacing capabilities
set backspace=indent,eol,start        " behave like a normal backspace
set laststatus=2                      " always show a status line
set clipboard+=unnamed                " yank and copy to X clipboard
set number                            " show number line
set magic                             " enables regex highlight?
set ttimeoutlen=70
set timeoutlen=400	  	      " esc delay
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
set softtabstop=4
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
let g:solarized_termcolors=256
set background=dark
colorscheme solarized
"let g:solarized_contrast="high"
"highlight MatchParen cterm=bold ctermfg=Grey ctermbg=DarkGrey

"hi Visual ctermbg=grey ctermfg=black


" custom keybindings
" -------------------------------------
"nnoremap <leader><space> :noh<cr>
"nnoremap <tab> %
"vnoremap <tab> %

" space is leader (all hail space)
let mapleader = "\<Space>"
let maplocalleader = "\\"

" save quicker
nnoremap <Leader>w :w<CR>

" v to expand selection, <C-v> to reduce
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

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
"nnoremap ; :

" get out of insert mode
inoremap jj <ESC>
inoremap jk <ESC>
"inoremap kj <ESC>
"inoremap kk <ESC>

" allow writing root files when forgetting to sudo
cmap w!! w !sudo tee % >/dev/null<CR>:e!<CR><CR>

" F8 to disable all autoindents (for pasting)
nnoremap <F8> :setl noai nocin nosi inde=<CR> 

" keep macro window from popping up
map q: :q

vmap <C-x> :!pbcopy<CR>  
vmap <C-c> :w !pbcopy<CR><CR> 

set clipboard=unnamed


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

" haskell specific settings
autocmd FileType haskell set tabstop=8|set expandtab|set softtabstop=4|set shiftwidth=4|set shiftround


" this function should auto-toggle paste mode when using cmd+v to paste
function! WrapForTmux(s)
  if !exists('$TMUX')
    return a:s
  endif

  let tmux_start = "\<Esc>Ptmux;"
  let tmux_end = "\<Esc>\\"

  return tmux_start . substitute(a:s, "\<Esc>", "\<Esc>\<Esc>", 'g') . tmux_end
endfunction

let &t_SI .= WrapForTmux("\<Esc>[?2004h")
let &t_EI .= WrapForTmux("\<Esc>[?2004l")

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

" create a module separator/header with keycode "--s"
" like so: 
"--------------------------------------------------------------------------------
"--  my section
"
let s:width = 80
function! HaskellModuleSection(...)
    let name = 0 < a:0 ? a:1 : inputdialog("Section name: ")

    return  repeat('-', s:width) . "\n"
    \       . "--  " . name . "\n"
    \       . "\n"
endfunction
nmap <silent> --s "=HaskellModuleSection()<CR>gp


" create a module header with keycode "--h"
" like so:
"--------------------------------------------------------------------------------
"-- | 
"-- Module      : MyModule
"-- Note        : This is a preview
"-- 
"-- This is an empty module, to show the headercomment produced. 
"-- 
"-------------------------------------------------------------------------------- 
let s:width = 80

function! HaskellModuleHeader(...)
    let name = 0 < a:0 ? a:1 : inputdialog("Module: ")
    let note = 1 < a:0 ? a:2 : inputdialog("Note: ")
    let description = 2 < a:0 ? a:3 : inputdialog("Describe this module: ")
    
    return  repeat('-', s:width) . "\n" 
    \       . "-- | \n" 
    \       . "-- Module      : " . name . "\n"
    \       . "-- Note        : " . note . "\n"
    \       . "-- \n"
    \       . "-- " . description . "\n"
    \       . "-- \n"
    \       . repeat('-', s:width) . "\n"
    \       . "\n"
endfunction
nmap <silent> --h "=HaskellModuleHeader()<CR>:0put =<CR>


" plugin settings
" -------------------------------------
" syntastic left side bar color
"hi SignColumn ctermbg=237
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" On by default, turn it off for html
let g:syntastic_mode_map = { 'mode': 'active',
    \ 'active_filetypes': [],
    \ 'passive_filetypes': ['html'] }

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_signs=1
" fix react settings
let g:syntastic_javascript_checkers = ['jsxhint']
let g:syntastic_javascript_jsxhint_exec = 'jsx-jshint-wrapper'

" indentLine
let g:indentLine_color_term = 234
let g:indentLine_char = '|'

" delimiteMate
let delimitMate_expand_cr=1

" ctrl p uses gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files . -co --exclude-standard', 'find %s -type f']
let g:ctrlp_use_caching = 0

" easymotion config
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)

let g:EasyMotion_startofline = 0 " keep cursor colum when JK motion



"if has("mac") || has("macunix")
"    set guifont=Monaco\ for\ Powerline:h24
"elseif has("win32") || has("win64")
"    set guifont=Monaco\ for\ Powerline:h14:cANSI
"    set renderoptions=type:directx,renmode:5
"endif
set guifont=Monaco\ for\ Powerline\ for\ Powerline
let g:Powerline_symbols = 'fancy'

