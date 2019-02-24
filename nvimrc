call plug#begin()

" Color scheme
" Plug 'rakr/vim-one'
" Plug 'altercation/vim-colors-solarized'
" Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox'

" TypeScript (JS via nvim-typescript tsserver instance)
Plug 'HerringtonDarkholme/yats.vim'
Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
Plug 'peitalin/vim-jsx-typescript'

" JavaScript
" Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'

" C++
Plug 'octol/vim-cpp-enhanced-highlight'

" Improvements
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
"Plug 'ryanoasis/vim-devicons'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
"Plug 'jiangmiao/auto-pairs'
Plug 'cohama/lexima.vim'
Plug 'yggdroot/indentline'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

call plug#end()

" Editor config
set encoding=utf-8
set nu rnu
set ruler
set showcmd
set nowrap
set autoread
au CursorHold * checktime
set ignorecase
set smartcase
set cursorline
filetype plugin indent on
set tabstop=2
set shiftwidth=2
set expandtab
set splitbelow
set splitright
set scrolloff=8

" Syntax Color
syntax on
colorscheme gruvbox
set background=dark

let mapleader = "\<Space>"

" clipboard
" copy
noremap <C-c> "+y
" paste
noremap <C-v> "+p
" cut
noremap <C-x> "+d
" paste in insert mode
inoremap <C-v> <Esc>"+pa

nnoremap <silent> <leader><Esc> :noh<CR>
"
" Temp swap files
set dir=$HOME/.vim/tmp/swap
if !isdirectory(&dir) | call mkdir(&dir, 'p', 0700) | endif

" Splits navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Close all buffers
nnoremap <leader>bda :%bd<CR>

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
" let g:nvim_typescript#diagnostics_enable = 0

" fzf
nmap <C-S-F> :Ag<space>
nmap <C-u> :Buffers<CR>
nmap <leader>ap :Files<CR>
nmap <leader>t :BTags<CR>

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

if isdirectory('./.git')
  " GFiles
  nmap <C-p> :GFiles<CR>
else
  " Files
  nmap <C-p> :Files<CR>
endif


" NERDTree
nmap <C-b> :NERDTreeToggle<CR>
" close vim if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" indentline
let g:indentLine_fileTypeExclude = ['json']

" ALE
let g:ale_linters = { 
\'javascript': ['eslint'],
\'javascript.jsx': ['eslint'],
\'typescript': ['tslint'],
\'typescript.tsx': ['tslint']
\}
let g:ale_sign_column_always = 1
