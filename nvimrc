call plug#begin()

" Color scheme
" Plug 'rakr/vim-one'
Plug 'tomasiser/vim-code-dark'

" TypeScript (JS via nvim-typescript tsserver instance)
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}

" Improvements
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'tpope/vim-surround'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
"Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'jiangmiao/auto-pairs'
Plug 'yggdroot/indentline'
Plug 'itchyny/lightline.vim'

call plug#end()

" Editor config
set encoding=utf-8
syntax on
set nu rnu
set ruler
set showcmd
set nowrap
set autoread
set smartcase
set cursorline
colorscheme codedark
let $NVIM_TUI_ENABLE_TRUE_COLOR = 1
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab

" Temp swap files
set dir=$HOME/.vim/tmp/swap
if !isdirectory(&dir) | call mkdir(&dir, 'p', 0700) | endif

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

let mapleader = "\<Space>"

" Deoplete config
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_ignore_case = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#enable_camel_case = 1
let g:deoplete#enable_refresh_always = 1

" Adds <TAB> shortcut for autocomplete selection                                                                                      
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ deoplete#manual_complete()     


" nvim-typescript
let g:nvim_typescript#javascript_support = 1
let g:nvim_typescript#default_mappings = 1

" fzf
function! GetFiles()
  if isdirectory('./.git')
    GFiles
  else
    Files
  endif
endfunction

nmap <C-S-F> :Ag<space>
nmap <C-p> :call GetFiles()<CR>
nmap <C-u> :Buffers<CR>
nmap <leader>ap :Files<CR>
nmap <leader>t :BTags<CR>

" NERDTree
nmap <C-b> :NERDTreeToggle<CR>
