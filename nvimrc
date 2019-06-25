call plug#begin()

" Color scheme
" Plug 'rakr/vim-one'
" Plug 'altercation/vim-colors-solarized'
" Plug 'tomasiser/vim-code-dark'
Plug 'morhetz/gruvbox'
Plug 'arcticicestudio/nord-vim'

" TypeScript (JS via nvim-typescript tsserver instance)
Plug 'HerringtonDarkholme/yats.vim'
"Plug 'mhartington/nvim-typescript', {'do': './install.sh'}
"Plug 'peitalin/vim-jsx-typescript'
Plug 'leafgarland/typescript-vim'

" JavaScript
" Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'elzr/vim-json'

" HTML
Plug 'mattn/emmet-vim'

" C++
Plug 'octol/vim-cpp-enhanced-highlight'

" Markdown
Plug 'plasticboy/vim-markdown'

" Improvements
Plug 'neoclide/coc.nvim', {'tag': '*', 'do': { -> coc#util#install()}}
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
"Plug 'jiangmiao/auto-pairs'
Plug 'cohama/lexima.vim'
Plug 'yggdroot/indentline'
Plug 'terryma/vim-multiple-cursors'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdcommenter'
"Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'rizzatti/dash.vim'
Plug 'ntpeters/vim-better-whitespace'

" Go
"Plug 'zchee/deoplete-go', { 'do': 'make'}

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
set signcolumn=yes

" Syntax Color
syntax on
colorscheme nord
highlight Comment cterm=italic
"set background=dark
let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_cursor_line_number_background = 1

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

let g:better_whitespace_enabled = 1
let g:strip_whitespace_on_save = 1

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


" COC NVIM
" Adds <TAB> shortcut for autocomplete selection
function! s:check_back_space() abort "{{{
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction"}}}

function! s:trigger_complete()
  "deoplete#manual_complete()
  coc#refresh()
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ <SID>trigger_complete()

" Use `[c` and `]c` for navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" fzf
nmap <C-F> :Ag<space>
nmap <C-u> :Buffers<CR>
nmap <leader>ap :Files<CR>
nmap <leader>t :BTags<CR>

command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

command! -bang -nargs=? -complete=dir GFiles
  \ call fzf#vim#gitfiles(<q-args>, fzf#vim#with_preview(), <bang>0)

if isdirectory('./.git')
  " GFiles
  nmap <C-p> :GFiles --exclude-standard --others --cached \| sort -d<CR>
else
  " Files
  nmap <C-p> :Files<CR>
endif

" NERDTree
nmap <C-b> :NERDTreeToggle<CR>
nmap <leader>b :NERDTreeFind<CR>
" close vim if only NERDTree is open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" indentline
let g:indentLine_fileTypeExclude = ['json']

let g:vim_json_syntax_conceal = 0

" Markdown
let g:vim_markdown_conceal = 0

" VIM Devicons
let g:WebDevIconsOS = 'Darwin'

let g:NERDTreeHighlightCursorline = 0 " prevents lag on nerdtree caused by coloring icons ('tiagofumo/vim-nerdtree-syntax-highlight')


set noshowmode
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'relativepath', 'modified' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ ['relativepath'] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }


" DASH
nmap <silent> <leader>d <Plug>DashSearch
nmap <C-D> :Dash<space>
