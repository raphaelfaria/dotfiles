call plug#begin()

" Color scheme
Plug 'arcticicestudio/nord-vim'

Plug 'sheerun/vim-polyglot'

" Improvements
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
Plug 'junegunn/fzf.vim'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-fugitive'
Plug 'cohama/lexima.vim'
Plug 'yggdroot/indentline'
Plug 'terryma/vim-multiple-cursors'
Plug 'itchyny/lightline.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'rizzatti/dash.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'reekenx/vim-rename2'
Plug 'mattn/emmet-vim'

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

" Creates parent directories on save (from: https://stackoverflow.com/questions/4292733/vim-creating-parent-directories-on-save)
function s:MkNonExDir(file, buf)
    if empty(getbufvar(a:buf, '&buftype')) && a:file!~#'\v^\w+\:\/'
        let dir=fnamemodify(a:file, ':h')
        if !isdirectory(dir)
            call mkdir(dir, 'p')
        endif
    endif
endfunction
augroup BWCCreateDir
    autocmd!
    autocmd BufWritePre * :call s:MkNonExDir(expand('<afile>'), +expand('<abuf>'))
  augroup END

" Syntax Color
syntax on
colorscheme nord
highlight Comment cterm=italic

set undofile
set undodir=~/.config/nvim/undodir

let g:nord_italic = 1
let g:nord_italic_comments = 1
let g:nord_cursor_line_number_background = 1

let mapleader = "\<Space>"

function! OpenNewPaneTerminal()
  execute "split"
  execute "terminal"
endfunction

nnoremap <leader>t :call OpenNewPaneTerminal()<CR>

" clipboard
" copy
noremap <C-c> "+y
" paste
noremap <C-v> "+p
" cut
noremap <C-x> "+d
" paste in insert mode
inoremap <C-v> <Esc>"+pa

nmap n nzz
nmap N Nzz

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
nnoremap <leader>q :%bd<CR>


" COC NVIM

let g:coc_global_extensions = [ 'coc-ccls', 'coc-css', 'coc-eslint', 'coc-gocode', 'coc-jest', 'coc-tsserver', 'coc-json', 'coc-git' ]

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

nnoremap <silent> <leader>o :<C-u>CocList outline<cr>
nnoremap <silent> <leader>s  :<C-u>CocList -I symbols<cr>
nnoremap <silent> <leader>a  :<C-u>CocList diagnostics<cr>

" Use `[c` and `]c` for navigate diagnostics errors
nmap <silent> [c <Plug>(coc-diagnostic-prev-error)
nmap <silent> ]c <Plug>(coc-diagnostic-next-error)

" Use `[v` and `]v` for navigate diagnostics
nmap <silent> [v <Plug>(coc-diagnostic-prev)
nmap <silent> ]v <Plug>(coc-diagnostic-next)


" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

function! s:show_documentation()
  if &filetype == 'vim'
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Use K for show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

"somethingunique
" fzf

" Default options are --nogroup --column --color
let s:ag_options = ' --one-device --hidden --ignore .git'

command! -bang -nargs=* Ag
      \ call fzf#vim#ag(
      \   <q-args>,
      \   s:ag_options,
      \  <bang>0 ? fzf#vim#with_preview('up:60%')
      \        : fzf#vim#with_preview('right:50%:hidden', '?'),
      \   <bang>0
      \ )
nmap <C-F> :Ag<space>
nmap <C-u> :Buffers<CR>
nmap <leader>p :Files<CR>

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
let NERDTreeShowHidden = 1

" indentline
let g:indentLine_fileTypeExclude = ['json']

let g:vim_json_syntax_conceal = 0

" Markdown
let g:vim_markdown_conceal = 0

" VIM Devicons
let g:WebDevIconsOS = 'Darwin'

let g:NERDTreeHighlightCursorline = 0 " prevents lag on nerdtree caused by coloring icons ('tiagofumo/vim-nerdtree-syntax-highlight')

function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

set noshowmode
let g:lightline = {
      \ 'colorscheme': 'nord',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'currentfunction', 'readonly', 'relativepath', 'modified' ] ]
      \ },
      \ 'inactive': {
      \   'left': [ ['relativepath'] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction'
      \ },
      \ }


" DASH
nmap <silent> <leader>d <Plug>DashSearch
nmap <C-D> :Dash<space>

" Tabs
nnoremap <C-t>k :tabr<cr>
nnoremap <C-t>j :tabl<cr>
nnoremap <C-t>h :tabp<cr>
nnoremap <C-t>l :tabn<cr>
nnoremap <C-t><C-k> :tabr<cr>
nnoremap <C-t><C-j> :tabl<cr>
nnoremap <C-t><C-h> :tabp<cr>
nnoremap <C-t><C-l> :tabn<cr>
nnoremap <C-t><C-s> :tabs<cr>
nnoremap <C-t><C-n> :tabnew<cr>
nnoremap <C-t><C-w> :tabc<cr>

" NERDCommenter
let g:NERDSpaceDelims = 1
