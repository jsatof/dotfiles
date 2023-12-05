call plug#begin()
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'

    Plug 'sainnhe/gruvbox-material'
    Plug 'w0ng/vim-hybrid'
    Plug 'creasty/candle.vim'
    Plug 'mattsacks/vim-eddie'
    Plug 'alessandroyorba/alduin'
    Plug 'loliee/vim-patatetoy'
    Plug 'sblauen/chalk'
    Plug 'axvr/raider.vim'

    Plug 'prabirshrestha/asyncomplete.vim'
    Plug 'preservim/tagbar'
    Plug 'jiangmiao/auto-pairs'
call plug#end()

let g:airline_theme='minimalist'

colorscheme raider_fork

set termguicolors
set bg=dark

syntax on
set number
set cursorline
set nowrap
set incsearch
set showmatch
set hlsearch
set ignorecase
set showcmd
set showmatch

" Enable vb then set the effect of vb to nothing
set vb
set t_vb=

set autoindent
filetype plugin indent on

" INDENTATION: SPACES. Tab to 4 space characters
" actual tab characters will appear their full length for clarity
"set tabstop=8 softtabstop=0
"set shiftwidth=4 smarttab
"set expandtab

" INDENTATION: TAB.
set noexpandtab
set copyindent
set preserveindent
set softtabstop=0
set shiftwidth=4
set tabstop=4

" Remove auto comments, but without setting/unsetting the paste feature
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>

nnoremap <C-x> :vert :term<CR>
nnoremap <C-b> :set syntax=whitespace<CR>

nmap <F8> :TagbarToggle<CR>
