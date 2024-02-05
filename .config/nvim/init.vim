set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

" I keep most of my vim settings in ~/.vimrc This way I can still use vim in 
" the absence of neovim without losing core editor settings
source ~/.vimrc
lua require('init')
