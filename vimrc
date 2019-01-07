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

Plug 'ctrlpvim/ctrlp.vim'
"Plug 'valloric/youcompleteme'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
Plug 'majutsushi/tagbar'
Plug 'terryma/vim-multiple-cursors'

Plug 'tpope/vim-eunuch'
Plug 'editorconfig/editorconfig-vim'
Plug 'mattn/emmet-vim'
Plug 'airblade/vim-gitgutter'
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

" -- Plugin Config

" NERDTree
nmap <C-b> :NERDTreeToggle<CR>
nmap <leader>b :NERDTreeToggle<CR>

" CtrlP
nmap <leader>p :CtrlP<CR>
nmap <C-u> :CtrlPBuffer<CR>
nmap <leader>u :CtrlPBuffer<CR>

if executable('ag')
  " Use ag over grep
  let g:ackprg = 'ag --vimgrep --smart-case'

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" Tagbar
nmap <leader>t :TagbarToggle<CR>
set mouse=
set ttymouse=

" JavaScript syntax
let g:javascript_plugin_flow = 1

