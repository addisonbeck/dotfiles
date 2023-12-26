:filetype on
:syntax on

set noconfirm
set noswapfile
set termguicolors

set clipboard=unnamed
set cmdheight=1
set hidden
set ignorecase
set lazyredraw
set mouse=a
set scrolljump=-5
set noshowmode
set smartcase
set splitbelow
set splitright
set updatetime=300

set expandtab
set smartindent
set softtabstop=2
set tabstop=2

set undofile
set sw=2
set laststatus=3

set scl=no

nmap <S-j> <C-d>
nmap <S-k> <C-u>
nmap <CR> o<Esc>
nmap <S-n> :set nu!<CR>
nmap j gj
nmap k gk

highlight Comment cterm=italic
highlight StatusLine   cterm=none ctermfg=white ctermbg=none guibg=red
highlight StatusLineNC cterm=none ctermfg=white ctermbg=none guibg=green
highlight StatusLineNC cterm=none ctermfg=white ctermbg=none guibg=green

highlight SpellBad    gui=bold,underdotted cterm=bold,underdotted ctermfg=none ctermbg=none guifg=none guibg=none guisp=red
highlight SpellCap    gui=bold,undercurl cterm=bold,underdotted ctermfg=none ctermbg=none guifg=none guibg=none guisp=red
highlight SpellRare   gui=bold,underdotted cterm=bold,underdotted ctermfg=none ctermbg=none guifg=none guibg=none guisp=red
highlight SpellLocal  gui=bold,underdotted cterm=bold,underdotted ctermfg=none ctermbg=none guifg=none guibg=none guisp=red

set fillchars=eob:\ 
