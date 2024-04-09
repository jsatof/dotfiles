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
    Plug 'prabirshrestha/asyncomplete-lsp.vim'
    Plug 'prabirshrestha/async.vim'
    Plug 'preservim/tagbar'
    Plug 'jiangmiao/auto-pairs'
    Plug 'prabirshrestha/vim-lsp'
    Plug 'mattn/vim-lsp-settings'
    Plug 'keremc/asyncomplete-clang.vim'
    Plug 'hiterm/asyncomplete-look'

    Plug 'vim-scripts/HTML-AutoCloseTag'
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

let g:airline_theme='minimalist'
colorscheme candle

set bg=dark

if $term == "screen-256color"
    set t_Co=256
else
    set termguicolors
endif

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

set backspace=indent,eol,start " more powerful backspacing"
set autoindent
filetype plugin indent on

" INDENTATION: SPACES. Tab to 4 space characters
" actual tab characters will appear their full length for clarity
set tabstop=8 softtabstop=0
set shiftwidth=4 smarttab
set expandtab

" INDENTATION: TAB.
"set noexpandtab
"set copyindent
"set preserveindent
"set softtabstop=0
"set shiftwidth=4
"set tabstop=4

let g:tagbar_position='left'

" Remove auto comments, but without setting/unsetting the paste feature
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>

nnoremap <C-x> :term<CR><C-w><C-r>

nmap <F8> :TagbarToggle<CR>

" open a vertical window 69 chars wide on the left, then switch to main window on right
silent execute "69vsplit " . getcwd()
wincmd l

" Pasting without updating display
noremap <C-S-V> :read !xclip -o<CR>

" asyncomplete config
autocmd User asyncomplete_setup call asyncomplete#register_source(
    \ asyncomplete#sources#clang#get_source_options())

" Enter will always insert new line
inoremap <expr> <cr> pumvisible() ? asyncomplete#close_popup() . "\<cr>" : "\<cr>"

autocmd User asyncomplete_setup call asyncomplete#register_source(
    \ asyncomplete#sources#clang#get_source_options({
    \     'config': {
    \         'clang_args': {
    \             'cpp': ['-std=c++23', '-I/usr/include/SDL2', '-I/usr/local/include/JUCE-7.0.11', '-I/usr/include/opus']
    \         }
    \     }
    \ }))

au User asyncomplete_setup call asyncomplete#register_source({
            \ 'name': 'look',
            \ 'allowlist': ['text', 'markdown'],
            \ 'completor': function('asyncomplete#sources#look#completor'),
            \ })

nmap <F2> :LspStopServer<CR>
