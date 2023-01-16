set relativenumber "номера строк со смещением
set number "номера строк
set ignorecase
"отступы
set autoindent
set tabstop=4 
set shiftwidth=4
set smarttab
set softtabstop=4
"-

"биндинг клавиш
imap jj <Esc>
"-

"подсветка синтаксиса
syntax on 
set runtimepath^=~/.vim
"-

"поддержка плагинов
set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'git://git.wincent.com/command-t.git'
Plugin 'file:///home/gmarik/path/to/plugin'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
call vundle#end()
filetype plugin indent on
"-
