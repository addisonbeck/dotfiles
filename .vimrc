:filetype on

set completeopt-=preview
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
set laststatus=3
set colorcolumn=80
" set conceallevel=2
highlight ColorColumn ctermbg=black guibg=black


set scl=no

nmap <S-j> <C-d>
nmap <S-k> <C-u>
" nmap <CR> o<Esc>
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

nmap <c-k> :wincmd k<CR>
nmap <c-j> :wincmd j<CR>
nmap <c-h> :wincmd h<CR>
nmap <c-l> :wincmd l<CR>

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
