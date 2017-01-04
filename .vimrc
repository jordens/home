set nocompatible

"autocmd!

if isdirectory(expand('~/.vim/bundle/Vundle.vim'))
  filetype off
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
    Plugin 'gmarik/Vundle.vim'
    Plugin 'tpope/vim-sensible'
    Plugin 'tpope/vim-repeat'
    Plugin 'tpope/vim-eunuch'
    Plugin 'tpope/vim-unimpaired'
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-fugitive'
    Plugin 'tpope/vim-dispatch'
    Plugin 'tpope/vim-sleuth'
    Plugin 'tpope/vim-commentary'
    Plugin 'tpope/vim-obsession'
    Plugin 'tpope/vim-rhubarb'
    "Plugin 'tpope/vim-vinegar'
    Plugin 'editorconfig/editorconfig-vim'
    Plugin 'rust-lang/rust.vim'
    Plugin 'racer-rust/vim-racer'
    " better than netrw/vinegar:
    Plugin 'jeetsukumaran/vim-filebeagle'
    Plugin 'altercation/vim-colors-solarized'
    "Plugin 'rking/ag.vim'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'ervandew/supertab'
    Plugin 'neomake/neomake'
    Plugin 'airblade/vim-gitgutter'
    "Plugin 'hynek/vim-python-pep8-indent'
    Plugin 'hdima/python-syntax'
    "Plugin 'klen/python-mode'
    "Plugin 'ctrlpvim/ctrlp.vim'
    Plugin 'dhruvasagar/vim-table-mode'
    "Plugin 'Valloric/YouCompleteMe'
    "Plugin 'google/vim-maktaba'
    "Plugin 'google/vim-codefmt'
    "Plugin 'google/vim-glaive'
    "Plugin 'ervandew/snipmate.vim'
    "Plugin 'davidhalter/jedi-vim'
    "Plugin 'Lokaltog/vim-easymotion'
    "Plugin 'mattn/emmet-vim'
  call vundle#end()
endif

"set number
"set shell=/bin/bash
set hidden
set mouse=a
set mousemodel=popup
set autowrite
set linebreak
set cpoptions+=n
let &showbreak='+ '
if exists('+breakindent')
  set breakindent
endif
set wrap
set textwidth=79
set wrapmargin=2
set formatoptions+=tcroqb
if v:version + has("patch541") >= 704
  set formatoptions+=j
endif
set encoding=utf-8
set pastetoggle=<f12>
set shiftround
set showmatch
set smartcase
set spelllang=en_us
set whichwrap=<,>,h,l,[,]
set noerrorbells
set magic
set lazyredraw
set cursorline
set switchbuf=useopen
set scrolloff=3
set modeline
set nojoinspaces
set clipboard=unnamedplus

set foldmethod=manual
set foldnestmax=3
set nofoldenable

set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/tmp,/tmp
set directory=~/.vim-tmp,~/tmp,/tmp

if !empty($SUDO_USER) && $USER !=# $SUDO_USER
  set viminfo=
  set directory-=~/.vim-tmp,~/tmp
  set backupdir-=~/.vim-tmp,~/tmp
endif

augroup swapskip
  autocmd!
  silent! autocmd BufNewFile,BufReadPre
        \ /tmp/*,/var/tmp/*,*/shm/*
        \ setlocal noswapfile viminfo=
  if has('persistent_undo')
    silent! autocmd BufWritePre
          \ /tmp/*,/var/tmp/*,*/shm/*
          \ setlocal noundofile
  endif
augroup END

augroup mkdirpre
  autocmd!
  autocmd BufWritePre *
    \ if !isdirectory(expand("<afile>:p:h")) |
        \ call mkdir(expand("<afile>:p:h"), "p") |
    \ endif
augroup END

set splitbelow
set splitright

set diffopt+=vertical

"set t_Co=256 " 256 colors
if has('gui_running')
  set background=light
else
  set background=dark
endif
let g:solarized_termcolors=&t_Co
"let g:solarized_contrast="high"
"let g:solarized_visibility="high"
let g:solarized_termtrans=1
if filereadable(expand("~/.vim/bundle/vim-colors-solarized/colors/solarized.vim"))
  colorscheme solarized
endif
highlight clear SignColumn

"syn match Braces display '[{}()\[\]]'
"hi Braces ctermfg=red

" set tags=./.git/tags
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

autocmd! BufWritePost * Neomake
let g:neomake_python_enabled_makers = ['flake8']

let python_highlight_all = 1

" autocmd FileType python setlocal omnifunc=python3complete#Complete

let python_highlight_all=1

let g:racer_cmd = "~/.cargo/bin/racer"

let g:airline_theme = 'solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline_left_sep = ''
let g:airline_right_sep = ''

let mapleader=","

" let cursors jump rows, not lines
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk

" keep visual mode on after indentation
vnoremap < <gv
vnoremap > >gv

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

nnoremap <Tab> :bnext<cr>
nnoremap <S-Tab> :bprevious<cr>
nnoremap <M-1> :buffer 1<cr>
nnoremap 1 :buffer 1<cr>
nnoremap <M-2> :buffer 2<cr>
nnoremap 2 :buffer 2<cr>
nnoremap <M-3> :buffer 3<cr>
nnoremap 3 :buffer 3<cr>
nnoremap <M-4> :buffer 4<cr>
nnoremap 4 :buffer 4<cr>
nnoremap <M-5> :buffer 5<cr>
nnoremap 5 :buffer 5<cr>
nnoremap <M-6> :buffer 6<cr>
nnoremap 6 :buffer 6<cr>
nnoremap <M-7> :buffer 7<cr>
nnoremap 7 :buffer 7<cr>
nnoremap <M-8> :buffer 8<cr>
nnoremap 8 :buffer 8<cr>
nnoremap <M-9> :buffer 9<cr>
nnoremap 9 :buffer 9<cr>
nnoremap <M-0> :buffer 10<cr>
nnoremap 0 :buffer 10<cr>

map  <F1>   <Esc>
map! <F1>   <Esc>
"nmap <silent> <F6> :if &previewwindow<Bar>pclose<Bar>elseif exists(':Gstatus')<Bar>exe 'Gstatus'<Bar>else<Bar>ls<Bar>endif<CR>
"nmap <silent> <F7> :if exists(':Lcd')<Bar>exe 'Lcd'<Bar>elseif exists(':Cd')<Bar>exe 'Cd'<Bar>else<Bar>lcd %:h<Bar>endif<CR>
map <F8>    :Make<CR>
map <F9>    :Dispatch<CR>
map <F10>   :Start<CR>

map <Leader>v  :so ~/.vimrc<CR>

noremap <Leader>w :w<CR>
noremap <Leader>q :q<CR>
noremap <Leader>wq :wq<CR>
noremap <Leader>b :bd<CR>

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" vim:set ts=2 sts=2 sw=2 expandtab:
