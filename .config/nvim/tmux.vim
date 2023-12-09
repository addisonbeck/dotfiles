set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
set nonumber
set noshowmode
set noruler
set laststatus=0
set noshowcmd
lua require('tmux')

