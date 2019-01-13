" Dependencies:
" - ctags (tagbar)
" - powerline fonts (vim-airline)
" - the_silver_searcher (ctrlp)


if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'tomasiser/vim-code-dark'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'jiangmiao/auto-pairs'
Plug 'yggdroot/indentline'

" -- JavaScript
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'leshill/vim-json'
Plug 'psychollama/further.vim'

" -- TypeScript
Plug 'Quramy/tsuquyomi'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'

" Plug 'ctrlpvim/ctrlp.vim'
Plug 'valloric/youcompleteme'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
" Plug 'majutsushi/tagbar'
Plug 'terryma/vim-multiple-cursors'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-eunuch'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'w0rp/ale'

call plug#end()


let g:airline_theme = 'codedark'
let g:airline_powerline_fonts = 1
let g:indent_guides_enable_on_vim_startup = 1

set encoding=utf-8
syntax on
colorscheme codedark
set nu rnu
set ruler
set showcmd
set nowrap
set cursorline
set autoread

" Temp swap files
set dir=$HOME/.vim/tmp/swap
if !isdirectory(&dir) | call mkdir(&dir, 'p', 0700) | endif

" disable scrollbars
set guioptions-=r
set guioptions-=R
set guioptions-=l
set guioptions-=L

filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
set updatetime=100

let mapleader = "\<Space>"

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nmap <C-S-F> :Ag<Space>

" -- Plugin Config

" NERDTree
nmap <C-b> :NERDTreeToggle<CR>
nmap <leader>b :NERDTreeToggle<CR>

" FZF
nmap <leader>p :call fzf#vim#gitfiles('', fzf#vim#with_preview('right'))<CR>
nmap <C-p> :call fzf#vim#gitfiles('', fzf#vim#with_preview('right'))<CR>
" nmap <C-p> :GFiles<CR>
" nmap <leader>p :GFiles<CR>
nmap <leader>ap :Files<CR>
nmap <C-u> :Buffers<CR>
nmap <leader>u :Buffers<CR>

" Tagbar
nmap <leader>t :TagbarToggle<CR>
set mouse=
set ttymouse=

" JavaScript syntax
let g:javascript_plugin_flow = 1


let g:ale_lint_on_text_changed = 'never'
