execute pathogen#infect()

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab
set background=dark
syntax on
colorscheme gruvbox

nnoremap ,<space> :nohlsearch<CR>
set number
set hlsearch

let g:clang_library_path='/usr/lib64/libclang.so'
let g:clang_complete_macros=1
let g:clang_snippets = 1
let g:clang_snippets_engine = 'clang_complete'
let g:clang_complete_patterns=1

