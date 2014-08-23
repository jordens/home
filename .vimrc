" Referenced here: http://vimuniversity.com/samples/your-first-vimrc-should-be-nearly-empty
"
set nocompatible

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

set number
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

let g:solarized_termcolors=&t_Co
"let g:solarized_contrast="high"
"let g:solarized_visibility="high"
let g:solarized_termtrans=1
colorscheme solarized
set background=dark

let g:syntastic_quiet_messages = { "type": "style",
				\  "level": "warnings" }

" let cursors jump rows, not lines
imap <silent> <Down> <C-o>gj
imap <silent> <Up> <C-o>gk
nmap <silent> <Down> gj
nmap <silent> <Up> gk

"syn match Braces display '[{}()\[\]]'
"hi Braces ctermfg=red
