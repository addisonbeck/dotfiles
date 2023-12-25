:filetype on
:syntax on

set noconfirm
set noswapfile

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
" highlight EndOfBuffer ctermfg=gb ctermbg=none guibg=none guifg=gb
highlight StatusLine   cterm=none ctermfg=white ctermbg=none guibg=red
highlight StatusLineNC cterm=none ctermfg=white ctermbg=none guibg=green
" highlight Normal ctermbg=none guibg=none guifg=gb ctermfg=gb
" highlight NonText ctermbg=none guibg=none guifg=gb ctermfg=gb
set fillchars=eob:\ 
