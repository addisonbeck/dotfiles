:filetype on

set noconfirm
set noswapfile
set nowrap
set nofoldenable
" set termguicolors
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
set colorcolumn=80
set conceallevel=2
highlight ColorColumn ctermbg=black guibg=black


set scl=no

nmap <S-j> <C-d>
nmap <S-k> <C-u>
nmap <CR> o<Esc>
nmap <S-n> :set nu!<CR>
nmap j gj
nmap k gk

highlight Comment     gui=italic    cterm=italic    ctermfg=none ctermbg=none guifg=grey guibg=none guisp=none
highlight StatusLine  gui=bold      cterm=bold      ctermfg=none ctermbg=none guibg=none guifg=grey guisp=none

highlight SpellBad    gui=undercurl cterm=undercurl ctermfg=none ctermbg=none guifg=none guibg=none guisp=red
highlight SpellCap    gui=undercurl cterm=undercurl ctermfg=none ctermbg=none guifg=none guibg=none guisp=red
highlight SpellRare   gui=undercurl cterm=undercurl ctermfg=none ctermbg=none guifg=none guibg=none guisp=red
highlight SpellLocal  gui=undercurl cterm=undercurl ctermfg=none ctermbg=none guifg=none guibg=none guisp=red
highlight NonText     ctermfg=11

set fillchars=eob:\ 

nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

syntax keyword pyKeyword alpha conceal cchar=α
syntax match Normal '\v<[[:alpha:]_]+[^_[:digit:]]*0>'ms=e conceal cchar=━

