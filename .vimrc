" vim:set ts=2 sts=2 sw=2 expandtab:

set nocompatible

"autocmd!

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'
Plugin 'tpope/vim-sensible'
Plugin 'altercation/vim-colors-solarized'
Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
Plugin 'ervandew/supertab'
Plugin 'ervandew/snipmate.vim'
Plugin 'scrooloose/syntastic'
Plugin 'jmcantrell/vim-virtualenv'
"Plugin 'Lokaltog/vim-easymotion'
"Plugin 'kien/ctrlp.vim'
"Plugin 'mattn/emmet-vim'
call vundle#end()

"set number
set hidden
set mouse=a
set autowrite
set linebreak
set wrap
set textwidth=79
set wrapmargin=2
set formatoptions+=cqrtb
set pastetoggle=<f12>
set whichwrap=<,>,h,l,[,]
set noerrorbells
set magic
set modeline
set modelines=3
set history=10000
set cursorline
set shell=bash
set switchbuf=useopen
set scrolloff=3
set foldmethod=manual
set nofoldenable
set nojoinspaces

set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set t_Co=256 " 256 colors
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
" Move around splits with <c-hjkl>
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l
" Align selected lines
vnoremap <leader>ib :!align<cr>

command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S.0 %z')<cr>

command! GdiffInTab tabedit %|vsplit|Gdiff
nnoremap <leader>d :GdiffInTab<cr>
nnoremap <leader>D :tabclose<cr>
