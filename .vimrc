set nocompatible

call plug#begin('~/.vim/plugged')
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" sensible editor settings
Plug 'tpope/vim-sensible'
" repeat support for plugins
Plug 'tpope/vim-repeat'
" Shell commands
Plug 'tpope/vim-eunuch'
" [os ]os spell, [<space>, ]<space>, newlines
Plug 'tpope/vim-unimpaired'
" cs"' change surround " to ', ds" delete, ysiw( add
Plug 'tpope/vim-surround'
" git wrappers
Plug 'tpope/vim-fugitive'
" Make, Dispatch for tmux
" Plug 'tpope/vim-dispatch'
" heuristic shiftwidth and expandtab
Plug 'tpope/vim-sleuth'
" comment stuff gcc gcap
Plug 'tpope/vim-commentary'
" session files
Plug 'tpope/vim-obsession'
" github extension
" Plug 'tpope/vim-rhubarb'
" tmux integration
Plug 'tpope/vim-tbone'
" netrw tweaks - I . y.
" but https://github.com/tpope/vim-vinegar/issues/13
" Plug 'tpope/vim-vinegar'
" better than netrw/vinegar?
Plug 'scrooloose/nerdcommenter'
Plug 'sjl/gundo.vim'
Plug 'jeetsukumaran/vim-filebeagle'
Plug 'editorconfig/editorconfig-vim'
Plug 'dense-analysis/ale'
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
"Plug 'altercation/vim-colors-solarized'
" retro groove colorscheme
Plug 'morhetz/gruvbox'
" Plug 'liuchengxu/space-vim-dark'
" Plug 'rking/ag.vim'
Plug 'ervandew/supertab'
"Plug 'neomake/neomake'
Plug 'airblade/vim-gitgutter'
"Plug 'hynek/vim-python-pep8-indent'
"Plug 'hdima/python-syntax'
"Plug 'python-mode/python-mode'
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'dhruvasagar/vim-table-mode'
Plug 'junegunn/vim-easy-align'
"Plug 'Valloric/YouCompleteMe'
"Plug 'prabirshrestha/asyncomplete.vim'
"Plug 'google/vim-maktaba'
"Plug 'google/vim-codefmt'
"Plug 'google/vim-glaive'
"Plug 'ervandew/snipmate.vim'
"Plug 'davidhalter/jedi-vim'
"Plug 'Lokaltog/vim-easymotion'
"Plug 'mattn/emmet-vim'
"Plug 'nathanielc/vim-tickscript'
Plug 'nathangrigg/vim-beancount'
call plug#end()

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
set termencoding=utf-8
set pastetoggle=<f12>
set shiftround
set showmatch
set showcmd
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
set backupdir=~/.vim/tmp//,~/tmp//,/tmp//
set directory=~/.vim/tmp//,~/tmp//,/tmp//

if !empty($SUDO_USER) && $USER !=# $SUDO_USER
  set viminfo=
  set directory-=~/.vim/tmp//,~/tmp//
  set backupdir-=~/.vim/tmp//,~/tmp//
endif

filetype plugin indent on

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

augroup ftoptions
  autocmd!
  "autocmd FileType * if exists("+omnifunc") && &omnifunc == "" | setlocal omnifunc=syntaxcomplete#Complete | endif
  "autocmd FileType * if exists("+completefunc") && &completefunc == "" | setlocal completefunc=syntaxcomplete#Complete | endif
  "autocmd FileType python setlocal omnifunc=python3complete#Complete
  autocmd FileType markdown
    \ syn region math start=/\$\$/ end=/\$\$/ |
    \ syn match math_block '\$[^$].\{-}\$' |
    \ hi link math Function |
    \ hi link math_block Function
augroup END

augroup pyfilters
  autocmd!
  autocmd FileType python nnoremap <LocalLeader>= :0,$!yapf<CR>
  autocmd FileType python nnoremap <LocalLeader>i :!isort %<CR><CR>
augroup END

augroup glogopen
  autocmd!
  autocmd QuickFixCmdPost *grep* cwindow
augroup END

set splitbelow
set splitright

set diffopt+=vertical

"set t_Co=256 " 256 colors
"set termguicolors
if has('gui_running')
  set background=light
else
  set background=dark
endif
let g:solarized_termcolors=&t_Co
"let g:solarized_contrast="high"
"let g:solarized_visibility="high"
let g:solarized_termtrans=1
"colorscheme solarized
"colorscheme space-vim-dark
let g:gruvbox_termcolors=&t_Co
let g:gruvbox_sign_column="bg0"
let g:gruvbox_vert_split="gray"
let g:gruvbox_color_column="bg1"
let g:gruvbox_contrast_dark="hard"
let g:gruvbox_italic=1
let g:gruvbox_italicize_comments=1
let g:gruvbox_italicize_strings=1
colorscheme gruvbox
"hi Comment    cterm=italic
"hi Normal     ctermbg=NONE guibg=NONE
"hi LineNr     ctermbg=NONE guibg=NONE
"hi SignColumn ctermbg=NONE guibg=NONE
"hi clear SignColumn

"syn match Braces display '[{}()\[\]]'
"hi Braces ctermfg=red
"hi pythonSelf  ctermfg=68  guifg=#5f87d7 cterm=bold gui=bold

set tags=./.git/tags,tags
let g:EditorConfig_exclude_patterns = ['fugitive://.*']

" autocmd! BufWritePost * Neomake
" let g:neomake_python_enabled_makers = ['flake8']

let python_highlight_all = 1

let g:racer_cmd = "~/.cargo/bin/racer"
let g:racer_experimental_completer = 1
let g:racer_insert_paren = 1

"let g:airline_theme = "solarized"
let g:airline_theme = "bubblegum"
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_min_count = 2
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_symbols.space = "\ua0"
"let g:airline_detect_spell=1
let g:airline_detect_spelllang=0
"let g:airline_inactive_collapse=1

" ALE
"let g:ale_sign_error = "✗"
"let g:ale_sign_warning = "⚠️"
"
" gitgutter
let g:gitgutter_realtime = 0

" use latex for plain .tex files
let g:tex_flavor='latex'

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

" Don't show the stupid recent-commands window by accident
map q: :q

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif

" vim:set ts=2 sts=2 sw=2 expandtab:
