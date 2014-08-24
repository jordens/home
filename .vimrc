" vim:set ts=2 sts=2 sw=2 expandtab:

set nocompatible

"autocmd!

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-dispatch'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'ervandew/supertab'
Plugin 'ervandew/snipmate.vim'
"Plugin 'scrooloose/syntastic'
"Plugin 'jmcantrell/vim-virtualenv'
Plugin 'kien/ctrlp.vim'
Plugin 'davidhalter/jedi-vim'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'mattn/emmet-vim'
"Plugin 'klen/python-mode'
call vundle#end()

"set number
set hidden
set mouse=a
set mousemodel=popup
set autowrite
set linebreak
set wrap
set textwidth=79
set wrapmargin=2
set formatoptions+=tcroqb
if v:version + has("patch541") >= 704
  set formatoptions+=j
endif
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

set foldmethod=manual
set nofoldenable

set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/tmp,/tmp,/tmp
set directory=~/.vim-tmp,~/tmp,/tmp,/tmp

if !empty($SUDO_USER) && $USER !=# $SUDO_USER
  set viminfo=
  set directory-=~/.vim-tmp,~/tmp
  set backupdir-=~/.vim-tmp,~/tmp
endif

set splitbelow
set splitright

set diffopt+=vertical

"set t_Co=256 " 256 colors
set background=dark
"color grb256
let g:solarized_termcolors=&t_Co
"let g:solarized_contrast="high"
"let g:solarized_visibility="high"
let g:solarized_termtrans=1
colorscheme solarized

"syn match Braces display '[{}()\[\]]'
"hi Braces ctermfg=red

let g:syntastic_quiet_messages = { "type": "style",
				\  "level": "warnings" }

" let cursors jump rows, not lines
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk

let mapleader=","
map <leader>y "*y
map <leader>p "*p

" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

map  <F1>   <Esc>
map! <F1>   <Esc>
nmap <silent> <F6> :if &previewwindow<Bar>pclose<Bar>elseif exists(':Gstatus')<Bar>exe 'Gstatus'<Bar>else<Bar>ls<Bar>endif<CR>
nmap <silent> <F7> :if exists(':Lcd')<Bar>exe 'Lcd'<Bar>elseif exists(':Cd')<Bar>exe 'Cd'<Bar>else<Bar>lcd %:h<Bar>endif<CR>
map <F8>    :Make<CR>
map <F9>    :Dispatch<CR>
map <F10>   :Start<CR>

map <Leader>v  :so ~/.vimrc<CR>

let python_highlight_all=1

if filereadable(expand("~/.vimrc.local"))
  source ~/.vimrc.local
endif
