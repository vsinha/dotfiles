filetype off

set nocompatible "be iMproved
set modelines=0 "security hole involving modelines

call vundle#rc()
" My bundles here:
" original repos on github
Bundle 'tpope/vim-fugitive'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'scrooloose/syntastic'
Bundle 'mikewest/vimroom'

let NERDTreeWinSize = 12

set t_Co=256
filetype plugin indent on "required!
syntax enable
set background=dark

nnoremap <silent> + :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> - :exe "resize " . (winheight(0) * 2/3)<CR>

"disable auto-commenting
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

set shiftwidth=2
set softtabstop=2
set mouse=a
"set expandtab

set encoding=utf-8
set scrolloff=5
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2
set nu
set undofile
"set wildmenu=list:longest
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

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
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

"F8 to disable all autoindents (for pasting)
nnoremap <F8> :setl noai nocin nosi inde=<CR> 

set showmatch
hi MatchParen cterm=NONE ctermbg=cyan ctermfg=black

"""""
"maps 'fc' and 'fq' in normal mode to optionally save 
"the current buffer then switch to a new buffer before deleting the original. 
"This preserves any splits you have set up.
map fc <Esc>:call CleanClose(1) <CR>
map fq <Esc>:call CleanClose(0) <CR>

function! CleanClose(tosave)
if (a:tosave == 1)
    w!
endif
let todelbufNr = bufnr("%")
let newbufNr = bufnr("#")
if ((newbufNr != -1) && (newbufNr != todelbufNr) && buflisted(newbufNr))
    exe "b".newbufNr
else
    bnext
endif

if (bufnr("%") == todelbufNr)
    new
endif
exe "bd".todelbufNr
endfunction
"""""

"smart tab completion
function! Smart_TabComplete()
  let line = getline('.')                         " current line

  let substr = strpart(line, -1, col('.')+1)      " from the start of the current
                                                  " line to one character right
                                                  " of the cursor
  let substr = matchstr(substr, "[^ \t]*$")       " word till cursor
  if (strlen(substr)==0)                          " nothing to match on empty string
    return "\<tab>"
  endif
  let has_period = match(substr, '\.') != -1      " position of period, if any
  let has_slash = match(substr, '\/') != -1       " position of slash, if any
  if (!has_period && !has_slash)
    return "\<C-X>\<C-P>"                         " existing text matching
  elseif ( has_slash )
    return "\<C-X>\<C-F>"                         " file matching
  else
    return "\<C-X>\<C-O>"                         " plugin matching
  endif
endfunction

inoremap <tab> <c-r>=Smart_TabComplete()<CR>
