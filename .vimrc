:filetype on

set completeopt-=preview
set noconfirm
set noswapfile
set nowrap
set nofoldenable
set termguicolors
set clipboard=unnamed
set cmdheight=0
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
set spell 
set spelllang=en_us
set textwidth=77
set wm=2

set expandtab
set smartindent
set softtabstop=2
set tabstop=2

set undofile
set sw=2
set laststatus=0
set winbar=%{'#\ '}%f

set fillchars=vert:│,horiz:─,horizdown:┬,horizup:┴,verthoriz:┼,vertleft:┤,vertright:├,wbr:\ ,stl:┴,eob:\ 

set scl=no

nmap <S-j> <C-d>
nmap <S-k> <C-u>
" nmap <CR> o<Esc>
nmap <S-n> :set nu!<CR>
nmap j gj
nmap k gk

nmap <c-k> :wincmd k<CR>
nmap <c-j> :wincmd j<CR>
nmap <c-h> :wincmd h<CR>
nmap <c-l> :wincmd l<CR>

nnoremap <c-Up>    :resize +2<CR>
nnoremap <c-Down>  :resize -2<CR>
nnoremap <c-Left>  :vertical resize -2<CR>
nnoremap <c-Right> :vertical resize +2<CR>

command! Bd silent! execute "%bd|e#|bd#"

" set foldmethod=expr
" set foldexpr=nvim_treesitter#foldexpr()
"augroup HelpInTabs
autocmd!
   autocmd BufEnter *.txt,*.md call HelpInNewTab()
augroup END

function! HelpInNewTab ()
  if &buftype == 'help'
    " convert help window to a tab
    setlocal buflisted
  endif
endfunction
