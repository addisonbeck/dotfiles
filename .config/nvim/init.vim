" ██╗   ██╗██╗███╗   ███╗    ███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗
" ██║   ██║██║████╗ ████║    ██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗  ██║██╔════╝ ██╔════╝
" ██║   ██║██║██╔████╔██║    ███████╗█████╗     ██║      ██║   ██║██╔██╗ ██║██║  ███╗███████╗
" ╚██╗ ██╔╝██║██║╚██╔╝██║    ╚════██║██╔══╝     ██║      ██║   ██║██║╚██╗██║██║   ██║╚════██║
"  ╚████╔╝ ██║██║ ╚═╝ ██║    ███████║███████╗   ██║      ██║   ██║██║ ╚████║╚██████╔╝███████║
"   ╚═══╝  ╚═╝╚═╝     ╚═╝    ╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝
" Authored by Addison Beck
" Plagirized from r/neovim, r/vim, the GitHub dotfiles community, Practical Vim, and random Medium articles
" This document is a constant work in progress.


" Gotta get that OS first for dumb windows stuff {{

function! DetectOs()
    if has("win64")
        return 'windows'
    endif
    if has("win32")
        return 'windows'
    endif
    if has("mac")
        return 'mac'
    endif
    if has("unix")
        return "unix"
    endif
endfunction
:let sysOS = DetectOs()

" }} Get OS
"-------------------------------------------------------------------------------------------------


" General Settings {{
" Visual
filetype on                             " Tell Vim to process filetypes
syntax on                               " Syntax highlighting
set number                              " Add line numbers
set relativenumber                      " Sets the current line as 0
set wildmode=longest,list               " Bash-like tab completions
set splitbelow                          " Vertical window splits will appear below the active window
set splitright                          " Horizontal window splits will appear to the right of the active window
set cmdheight=2                         " Makes the command line a little bigger (this is better for messages)
set completeopt=longest,menuone,preview " Makes autocomplete work a little more like other editors
set noshowmode                          " Don't show current mode in message box
set wrap
" set textwidth=72
" set fo=tca
" set list
" set listchars=tab:→\ ,eol:¬,trail:⋅,extends:❯,precedes:❮
" set showbreak=↪
set breakat=";?"
set confirm
set gdefault

" Search
set ignorecase                          " Case insensitive matching
set hlsearch                            " Highlight search results
set smartcase                           " Override `ignorecase` option if a capital letter is typed in search
set incsearch                           " Highlight search results while typing

" Indent
set tabstop=4                           " Number of columns occupied by a tab character
set softtabstop=4                       " See multiple spaces as tabstops so <BS> does the right thing
set expandtab                           " Converts tabs to white space
set shiftwidth=4                        " Width for autoindents
set autoindent                          " Indent a new line the same amount as the line just typed
set smartindent                         " Try to indent to the correct column automatically
set shiftround

" Clipboard
set clipboard+=unnamedplus              " Use system clipboard by default

" Performance & Security
set hidden                              " Don't unload hidden buffers
set scrolljump=5                        " Scrolls by 5 lines when trying to navigate off screen
set lazyredraw                          " Don't redraw the screen if there is nothing to redraw
set updatetime=300

" QOL
set history=1000                        " Bumps up Vim's default command history of 10
set mouse=a                             " Enable mouse scrolling
set undofile                            " Enable undo persistence across sessions
set noautochdir                         " Don't change dirs automatically
set autoread                            " Auto reload files that have been changed outside vim
set backspace=indent,eol,start          " make backspace behave in a sane manner

" Autocommands
au FileType json syntax match Comment +\/\/.\+$+      " Proper comment syntax for jsonc
au BufEnter * set fo-=c fo-=r fo-=o                   " Stop annoying auto commenting on new lines

" }} General Settings


"-------------------------------------------------------------------------------------------------


" Custom Functions {{

" TODO: Make this plugin-agnostic and less dependent on normal mode commands
" Insert banner text from the word under the cursor (requires vim-commentary and the figlet npm package)
function! InsertFiglet()
    let currentLine = expand("<cword>")
    let cmd = "figlet -f \"ANSI Shadow\" " .currentLine
    exe "read! " .cmd
    :normal 7k
    :normal dd
    :normal 6gcc
    :normal 6j0
endfunction
nmap <Leader>\ :call InsertFiglet()<CR>

au BufEnter * if &buftype == 'terminal' | :startinsert | endif
function! OpenTerminal()
    " if (sysOS == "windows")
    "   split term://cmd
    " endif
    " if (sysOS == "unix")
    "   split term://bash
    " endif
    split term://cmd
    resize 10
endfunction
function! OpenTerm(cmd, ...) abort
    let orien = get(a:, 2, 'h')
    if orien == 'h' | new | wincmd J | else | vnew | wincmd L | endif
    setf openterm
    call termopen(a:cmd, {'on_exit': {_,c,__ -> OnExit(c)}})
    call LayoutTerm(get(a:, 1, 0.5), orien)
endfunction

" }} Custom Functions


"-------------------------------------------------------------------------------------------------


" Keymappings {{

" Overides the default custom shortcut leader (default is \)
let mapleader = ","

" Allows using ; to enter command mode
nnoremap ; :

" easier esc
inoremap jk <esc>

" Allows for quicker and more inuitive buffer swapping
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>

" Faster saves
nmap <leader>w :w<CR>

" user Alt j/k to navigate the completion list
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" scroll the viewport faster
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

" moving up and down work as you would expect
nnoremap <silent> j gj
nnoremap <silent> k gk
noremap <silent> ^ g^
nnoremap <silent> $ g$

" helpers for dealing with other people's code
nmap \t :set ts=4 sts=4 sw=4 noet<cr>
nmap \s :set ts=4 sts=4 sw=4 et<cr>

" inner-line
xnoremap <silent> il :<c-u>normal! g_v^<cr>
onoremap <silent> il :<c-u>normal! g_v^<cr>

" around line
vnoremap <silent> al :<c-u>normal! $v0<cr>
onoremap <silent> al :<c-u>normal! $v0<cr>

" Add new lines without going in to insert mode
nmap <Leader>o o<Esc>
nmap <Leader>O O<Esc>

" Quickly jump to various config files (COC's is with the COC settings)
map <Leader>ev :e! $MYVIMRC<CR>
map <leader>eg :e! ~/.gitconfig<cr>

" clear highlighted search
noremap <space> :set hlsearch! hlsearch?<cr>

" remove extra whitespace
nmap <leader><space> :%s/\s\+$<cr>
nmap <leader><space><space> :%s/\n\{2,}/\r\r/g<cr>

" toggle cursor line
nnoremap <leader>i :set cursorline!<cr>

" Better window navigation
nnoremap <silent> <Leader>sp :split<CR>
nnoremap <silent> <Leader>on :only<CR>
nnoremap <silent> <Leader>cl :close<CR>
tnoremap <C-h> <C-\><C-n><C-w>h
tnoremap <C-j> <C-\><C-n><C-w>j
tnoremap <C-k> <C-\><C-n><C-w>k
tnoremap <C-l> <C-\><C-n><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nmap <leader><leader>h :exe 'hi '.synIDattr(synstack(line('.'), col('.'))[-1], 'name')<CR>

" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>

" Remap arrows to resize
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>


" remap the K command so I can use K for something else
nnoremap <Leader>k <S-k>

" more intuitive half page scrolling
nnoremap <S-j> <C-d>
nnoremap <S-k> <C-u>

" }} Keymappings


"-------------------------------------------------------------------------------------------------


" Plugins {{

" Install VimPlug if it doesn't exist 
if (sysOS == "unix" || sysOS == "mac")
    if empty(glob('~/.config/nvim/autoload/plug.vim'))
        silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
                    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
        autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
    endif
endif

"Automatically install new plugins when vim boots up
autocmd VimEnter *
            \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
            \|   PlugInstall --sync | q
            \| endif

" Load Plugins
if (sysOS == "unix" || sysOS == "mac")
    call plug#begin()
endif

if (sysOS == "windows")
    call plug#begin('C:/users/beckad/.config/.nvim/plugged')
endif

" Tools
Plug 'neoclide/coc.nvim', {'branch': 'release'}     " LSP
let g:coc_global_extensions=[
            \'coc-angular',
            \'coc-css',
            \'coc-explorer',
            \'coc-highlight',
            \'coc-html',
            \'coc-json',
            \'coc-lists',
            \'coc-omnisharp',
            \'coc-prettier',
            \'coc-python',
            \'coc-snippets',
            \'coc-tsserver',
            \'coc-utils',
            \'coc-vetur',
            \'coc-vimlsp',
            \'coc-yank',
            \]
if (sysOS == "windows")
    let g:coc_extension_root = 'C:/users/beckad/.config/.nvim'
    let g:coc_config_home = 'C:/Users/beckad/.config/.nvim'
endif

" Show documentation from Coc
function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

map <Leader>ec :CocConfig<CR>
inoremap <silent><expr> <TAB>
    \ pumvisible() ? coc#_select_confirm() :
    \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

function! s:CheckBackSpace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Coc shortcuts
nmap <silent> H :call <SID>show_documentation()<CR>
nmap <silent><C-t> :CocCommand explorer<CR>
nmap <silent>gdef <Plug>(coc-definition)
nmap <silent>gdec <Plug>(coc-definition)
nmap <silent>gimp <Plug>(coc-implementation)
nmap <silent>gtdef <Plug>(coc-type-definition)
nmap <leader>f <Plug>(coc-format)
nmap <silent>rn <Plug>(coc-rename)

Plug 'tpope/vim-fugitive'                           " Git
function! GitInfo()
    let git = fugitive#head()
    if git != ''
        return '→ '.fugitive#head() . ' '
    else
        return ''
    endif
endfunction

Plug 'dstein64/vim-startuptime'                     " Vim startup metrics
Plug 'kristijanhusak/vim-carbon-now-sh'             " Sexy screenshots

" Editing
Plug 'gregsexton/MatchTag'                          " Highlight matching HTML tags
Plug 'tpope/vim-commentary'                         " Boss ass commenting shortcuts

Plug 'alvan/vim-closetag'                           " Autocreate close tags for HTML
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.md, *.cshtml'

Plug 'sirver/ultisnips'                             " Snippets
" Plug 'tpope/vim-surround'                         " Surround motions

" Navigation
Plug 'junegunn/fzf', { 'do': './install --all' }    " Fuzzy search (may require command line tool FZF)
Plug 'yuki-ycino/fzf-preview.vim'
let g:fzf_preview_use_dev_icons = 1
let g:fzf_preview_fzf_preview_window_option = "bottom:70%"
nnoremap <silent><C-s> :FzfPreviewGitFiles<CR>

Plug 'easymotion/vim-easymotion'                    " Quickly jump to a specific place in the current buffer
nmap go <Plug>(easymotion-jumptoanywhere)
Plug 'christoomey/vim-tmux-navigator'

" Linting
Plug 'w0rp/ale'                                       " Or just ale if you have custom sensible defaults

" let g:ale_fixers = {
"             \'*': ['remove_trailing_lines', 'trim_whitespace'],
"             \'javascript': ['prettier'],
"             \'typescript': ['prettier'],
"             \'css' : ['prettier'],
"             \'html' : ['prettier'],
"             \'markdown' : ['prettier'],
"             \'yaml': ['prettier'],
"             \'json': ['prettier'],
"             \}

" let g:ale_linters = {
"             \'cs': ['omnisharp'],
"             \'typescript': ['prettier']
"             \}


" let g:ale_set_quickfix = 1
let g:ale_set_signs = 0
" let g:ale_linter_aliases =
let g:ale_linters_explicit = 1
let g:ale_javascript_prettier_options = '--single-quote --trailing-comma es5'

let g:ale_virtualtext_cursor = 1

if (sysOS == "unix"  || sysOS == "mac")
    let g:ale_virtualtext_prefix = ' ♥️  '
endif

" Lint always in Normal Mode
let g:ale_lint_on_text_changed = 'normal'

" Lint when leaving Insert Mode but don't lint when in Insert Mode
let g:ale_lint_on_insert_leave = 1

" Set ALE's 200ms delay to zero
let g:ale_lint_delay = 0

" Set gorgeous colors for marked lines to sane, readable combinations
" working with any colorscheme
au VimEnter,BufEnter,ColorScheme *
            \ exec "hi! ALEInfoLine
            \ guifg=".(&background=='light'?'#808000':'#ffff00')."
            \ guibg=".(&background=='light'?'#ffff00':'#555500') |
            \ exec "hi! ALEWarningLine
            \ guifg=".(&background=='light'?'#808000':'#ffff00')."
            \ guibg=".(&background=='light'?'#ffff00':'#555500') |
            \ exec "hi! ALEErrorLine
            \ guifg=".(&background=='light'?'#ff0000':'#ff0000')."
            \ guibg=".(&background=='light'?'#ffcccc':'#550000') |
            \ exec "hi! AleVirtualTextError
            \ guifg=".(&background=='light'?'#121212':'#e4e4e4')."
            \ guibg=".(&background=='light'?'#ffcccc':'#121212')."
            \ gui=italic"

" display errors from Ale in statusline
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? "DON'T PANIC": printf(
                \ "PANIC")
endfunction


Plug 'OmniSharp/omnisharp-vim'                    " Omnisharp?
let g:OmniSharp_server_stdio = 1

autocmd FileType cs nnoremap <buffer> <Leader>gd :OmniSharpGotoDefinition<CR>
autocmd FileType cs nnoremap <buffer> <Leader>pd :OmniSharpPreviewDefinition<CR>
autocmd FileType cs nnoremap <buffer> <Leader>pi :OmniSharpPreviewImplementation<CR>
autocmd FileType cs nnoremap <buffer> <Leader>fi :OmniSharpFindImplementations<CR>
autocmd FileType cs nnoremap <buffer> <Leader>fs :OmniSharpFindSymbol<CR>
autocmd FileType cs nnoremap <buffer> <Leader>fu :OmniSharpFindUsages<CR>
autocmd FileType cs nnoremap <buffer> <Leader>fx :OmniSharpFixUsings<CR>
autocmd FileType cs nnoremap <buffer> <Leader>cc :OmniSharpGlobalCodeCheck<CR>
autocmd FileType cs nnoremap <buffer> <Leader><Space> :OmniSharpGetCodeActions<CR>
autocmd FileType cs nnoremap <buffer> <Leader>rn :OmniSharpRename<CR>

" Plug 'OrangeT/vim-csharp'                         " C#?

" Themes
Plug 'addisonbeck/sith.vim'
Plug 'logico/typewriter'                            " Super minimal
" Plug 'morhetz/gruvbox'                            " Super retro
" Plug 'challenger-deep-theme/vim'                  " Super deep
" Plug 'hzchirs/vim-material'                       " Super material

" Visual
Plug 'mhinz/vim-startify'                           " Splash screen
" starify
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1

if (sysOS == "unix" || sysOS == "mac")
    let g:startify_fortune_use_unicode = 1
endif

if (sysOS == "windows")
    let g:startify_bookmarks = [
                \'C:/Users/beckad/source/repos/Products.RemitSplitting',
                \'C:/Users/beckad/.config'
                \]
endif
if (sysOS == "unix")
    let g:startify_bookmarks = [
                \'/mnt/c/Users/beckad/source/repos/Products.RemitSplitting'
                \]
endif

let g:startify_lists = [
            \ { 'type': 'dir',       'header': ['   Current Directory'] },
            \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
            \ ]
" let g:startify_custom_footer = [
"       \"          .-'-.
"       \       __|     `\
"       \      `-,-`--._  `\
"       \ []  .->'  a   `|-'
"       \  `=/ (__/_     /
"       \    \_,    `  _)
"       \      `----; |
"       \"]
let g:startify_custom_header =
            \ 'startify#center(startify#fortune#cowsay())'
" let g:startify_custom_footer =
"        \ ['', "   Vim is charityware. Please read ':help uganda'.", '']

Plug 'ryanoasis/vim-devicons'                       " Cute icons
" Plug 'vim-airline/vim-airline'                      " Cute status bar
" Plug 'vim-airline/vim-airline-themes'               " Cute themes for cute status bar


" Plug 'blueyed/vim-diminactive'                      " Dims inactive windows
let g:diminactive_enable_focus = 1
let g:diminactive_use_colorcolumn = 1


" Plug 'psliwka/vim-smoothie'                       " Smooth scrolling

" Plug 'luochen1990/rainbow'                        " Rainbow braces
" rainbow
let g:rainbow_active = 1

Plug 'tmux-plugins/vim-tmux'


Plug 'vimwiki/vimwiki'
let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
" Writing
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-colors-pencil'
Plug 'reedes/vim-lexical'
Plug 'reedes/vim-wordy'
Plug 'reedes/vim-litecorrect'
Plug 'panozzaj/vim-autocorrect'
" Plug 'tpope/vim-markdown'
Plug 'dbmrq/vim-ditto'
Plug 'junegunn/limelight.vim'
Plug 'junegunn/goyo.vim'                            " Zen mode
call plug#end()


nmap <leader>g :Goyo<CR>
let g:limelight_default_coefficient = 0.8
nmap <Leader>l :Limelight!!<CR>
xmap <Leader>l :Limelight!!<CR>
let g:ditto_mode = "file"
let g:pencil_terminal_italics = 1
let g:pencil#autoformat = 1      " 0=disable, 1=enable (def)
let g:lexical#thesaurus_key = '<leader>t'
let g:lexical#dictionary_key = '<leader>r'

if (sysOS == "mac" || sysOS == "unix")
    let g:lexical#thesaurus = ['~/.config/thesaurus/mthesaur.txt',]
endif

autocmd FileType markdown,mkd,text,tex let g:lexical#thesaurus_key = '<leader>t'
autocmd FileType markdown,mkd,text,tex let g:lexical#dictionary_key = '<leader>d'

augroup writingMode
  autocmd!
  autocmd FileType markdown,mkd,text,tex call pencil#init()
                                     " \ | call lexical#init()
                                     " \ | call litecorrect#init()
  " autocmd FileType markdown,mkd,text,tex DittoOn
augroup END

" }} Plugins


"-------------------------------------------------------------------------------------------------


" Themeing {{

set background=light
colorscheme pencil
if has('nvim') || has('termguicolors')
    set termguicolors " Allow for all the colors of the rainbow
endif

" Always show comments in italics
autocmd BufNewFile,BufRead *.* highlight Comment cterm=italic gui=italic
autocmd BufNewFile,BufRead *.* highlight Function cterm=NONE gui=NONE

" Show some C# keywords as italic
autocmd BufNewFile,BufRead *.cs highlight Keyword cterm=italic gui=italic
autocmd BufNewFile,BufRead *.cs highlight Special cterm=italic gui=italic

" Show some Typescript keywords as italic
autocmd BufNewFile,BufRead *.ts highlight Keyword cterm=italic gui=italic
autocmd BufNewFile,BufRead *.ts highlight Special cterm=italic gui=italic
autocmd BufNewFile,BufRead *.ts highlight Structure cterm=italic gui=italic

" Status Bar
let g:currentmode={
            \ 'n'      : 'NORMAL',
            \ 'no'     : 'NORMAL',
            \ 'v'      : 'CHEAT',
            \ 'V'      : 'CHEAT ',
            \ '\<C-V>' : 'CHEAT',
            \ 's'      : 'Select ',
            \ 'S'      : 'S·Line ',
            \ '\<C-S>' : 'S·Block ',
            \ 'i'      : 'INSERT',
            \ 'R'      : 'REPLACE',
            \ 'Rv'     : 'V·Replace ',
            \ 'c'      : 'Command ',
            \ 'cv'     : 'Vim Ex ',
            \ 'ce'     : 'Ex ',
            \ 'r'      : 'Prompt ',
            \ 'rm'     : 'More ',
            \ 'r?'     : 'Confirm ',
            \ '!'      : 'Shell ',
            \ 't'      : 'Terminal '
            \}

hi User1 guibg=#b5b5b5 guifg=#262525
hi User2 guibg=#b5b5b5 guifg=#000000
set laststatus=2
set statusline=
set statusline+=\%1*\ %{toupper(g:currentmode[mode()])}\ MODE
set statusline+=%=
set statusline+=\%2*\ %{LinterStatus()}
set statusline+=%=
set statusline+=\%1*\ %t\ %1*
set statusline+=%1*\ %{GitInfo()}                        " Git Branch name

" }} Themeing
