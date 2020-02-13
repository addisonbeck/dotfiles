
" ██╗   ██╗██╗███╗   ███╗    ███████╗███████╗████████╗████████╗██╗███╗   ██╗ ██████╗ ███████╗
" ██║   ██║██║████╗ ████║    ██╔════╝██╔════╝╚══██╔══╝╚══██╔══╝██║████╗  ██║██╔════╝ ██╔════╝
" ██║   ██║██║██╔████╔██║    ███████╗█████╗     ██║      ██║   ██║██╔██╗ ██║██║  ███╗███████╗
" ╚██╗ ██╔╝██║██║╚██╔╝██║    ╚════██║██╔══╝     ██║      ██║   ██║██║╚██╗██║██║   ██║╚════██║
"  ╚████╔╝ ██║██║ ╚═╝ ██║    ███████║███████╗   ██║      ██║   ██║██║ ╚████║╚██████╔╝███████║
"   ╚═══╝  ╚═╝╚═╝     ╚═╝    ╚══════╝╚══════╝   ╚═╝      ╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝
" Authored by Addison Beck
" Plagirized from r/neovim, r/vim, the GitHub dotfiles community, Practical Vim, and random Medium articles
" This document is a constant work in progress.

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

" Compatability
set nocompatible                        " Bop Vi
set encoding=utf-8                      " Text encoding. Nothing to see here.

" Visual
filetype on                             " Tell Vim to process filetypes
syntax on                               " Syntax highlighting
set showmatch                           " Show matching brackets.
set number                              " Add line numbers
set relativenumber                      " Sets the current line as 0
set wildmode=longest,list               " Bash-like tab completions
set splitbelow                          " Vertical window splits will appear below the active window
set splitright                          " Horizontal window splits will appear to the right of the active window
set cmdheight=2                         " Makes the command line a little bigger (this is better for messages)
set completeopt=longest,menuone,preview " Makes autocomplete work a little more like other editors
set noshowmode                          " Don't show current mode in message box
set nocursorline
set nocursorcolumn                      " Stop highlighting the current column

" Search
set ignorecase                          " Case insensitive matching
set hlsearch                            " Highlight search results
set smartcase                           " Override `ignorecase` option if a capital letter is typed in search

" Indent
set tabstop=2                           " Number of columns occupied by a tab character
set softtabstop=2                       " See multiple spaces as tabstops so <BS> does the right thing
set expandtab                           " Converts tabs to white space
set shiftwidth=2                        " Width for autoindents
set autoindent                          " Indent a new line the same amount as the line just typed
set smartindent                         " Try to indent to the correct column automatically
filetype plugin indent on               " Allows auto-indenting depending on file type

" Clipboard
set clipboard+=unnamedplus              " Use system clipboard by default

" Performance & Security
set nobackup                            " Stop Vim from making backups of files
set nowritebackup                       " No backups!
set noswapfile                          " No swaps!
set hidden                              " Don't unload hidden buffers
set scrolljump=5                        " Scrolls by 5 lines when trying to navigate off screen
set lazyredraw                          " Don't redraw the screen if there is nothing to redraw
set updatetime=300

" QOL
set history=1000                        " Bumps up Vim's default command history of 10
set mouse=a                             " Enable mouse scrolling
set undofile                            " Enable undo persistence across sessions
set noautochdir                         " Don't change dirs automatically
set keywordprg=:help

" Autocommands
au FileType json syntax match Comment +\/\/.\+$+      " Proper comment syntax for jsonc
au BufEnter * set fo-=c fo-=r fo-=o                   " Stop annoying auto commenting on new lines

" ██████╗ ██╗     ██╗   ██╗ ██████╗ ██╗███╗   ██╗███████╗
" ██╔══██╗██║     ██║   ██║██╔════╝ ██║████╗  ██║██╔════╝
" ██████╔╝██║     ██║   ██║██║  ███╗██║██╔██╗ ██║███████╗
" ██╔═══╝ ██║     ██║   ██║██║   ██║██║██║╚██╗██║╚════██║
" ██║     ███████╗╚██████╔╝╚██████╔╝██║██║ ╚████║███████║
" ╚═╝     ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚═══╝╚══════╝

" Install VimPlug if it doesn't exist (macOS & Linux only)
" if empty(glob('~/.vim/autoload/plug.vim'))
"   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

"Automatically install new plugins when vim boots up
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

if (sysOS == "unix" || sysOS == "mac")
  call plug#begin()
endif

if (sysOS == "windows")
  call plug#begin('C:/users/beckad/.config/.nvim/plugged')
endif

" Tools
Plug 'neoclide/coc.nvim', {'branch': 'release'}     " LSP
Plug 'tpope/vim-fugitive'                           " Git
Plug 'dstein64/vim-startuptime'                     " Vim startup metrics
Plug 'kristijanhusak/vim-carbon-now-sh'             " Sexy screenshots

" Editing
Plug 'gregsexton/MatchTag'                          " Highlight matching HTML tags
Plug 'tpope/vim-commentary'                         " Boss ass commenting shortcuts
Plug 'alvan/vim-closetag'                           " Autocreate close tags for HTML
Plug 'sirver/ultisnips'                             " Snippets
" Plug 'tpope/vim-surround'                         " Surround motions

" Navigation
Plug 'junegunn/fzf', { 'do': './install --all' }    " Fuzzy search (may require command line tool FZF)
Plug 'easymotion/vim-easymotion'                    " Quickly jump to a specific place in the current buffer

" Linting
" Plug 'desmap/ale-sensible' | Plug 'w0rp/ale'        " Super powerful and super janky linter & sensible defaults
Plug 'w0rp/ale'                                       " Or just ale if you have custom sensible defaults
" Plug 'OmniSharp/omnisharp-vim'                    " Omnisharp?
" Plug 'OrangeT/vim-csharp'                         " C#?

" Themes
Plug 'addisonbeck/sith.vim'
" Plug 'logico/typewriter'                            " Super minimal
" Plug 'morhetz/gruvbox'                            " Super retro
" Plug 'challenger-deep-theme/vim'                  " Super deep
" Plug 'hzchirs/vim-material'                       " Super material

" Visual
Plug 'mhinz/vim-startify'                           " Splash screen
Plug 'ryanoasis/vim-devicons'                       " Cute icons
" Plug 'vim-airline/vim-airline'                      " Cute status bar
" Plug 'vim-airline/vim-airline-themes'               " Cute themes for cute status bar
Plug 'junegunn/goyo.vim'                            " Zen mode
Plug 'blueyed/vim-diminactive'                      " Dims inactive windows
" Plug 'nathanaelkane/vim-indent-guides'            " Show indent guides
" Plug 'psliwka/vim-smoothie'                       " Smooth scrolling
" Plug 'luochen1990/rainbow'                        " Rainbow braces
Plug 'junegunn/limelight.vim'

call plug#end()

let g:coc_global_extensions=[ 'coc-omnisharp', 'coc-explorer', 'coc-vetur', 'coc-angular', 'coc-tsserver', 'coc-json', 'coc-lists', 'coc-html', 'coc-css', 'coc-python', 'coc-highlight', 'coc-snippets', 'coc-yank', 'coc-vimlsp']

" ████████╗██╗  ██╗███████╗███╗   ███╗██╗███╗   ██╗ ██████╗
" ╚══██╔══╝██║  ██║██╔════╝████╗ ████║██║████╗  ██║██╔════╝
"    ██║   ███████║█████╗  ██╔████╔██║██║██╔██╗ ██║██║  ███╗
"    ██║   ██╔══██║██╔══╝  ██║╚██╔╝██║██║██║╚██╗██║██║   ██║
"    ██║   ██║  ██║███████╗██║ ╚═╝ ██║██║██║ ╚████║╚██████╔╝
"    ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚═╝╚═╝  ╚═══╝ ╚═════╝

colorscheme sith
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

hi User1 guibg=#b5b5b5 guifg=#262525 gui=bold
hi User2 guibg=#b5b5b5 guifg=#000000 gui=bold
set laststatus=2
set statusline=
set statusline+=\%1*\ %{toupper(g:currentmode[mode()])}\ MODE
set statusline+=%=
set statusline+=\%2*\ %{LinterStatus()}
set statusline+=%=
set statusline+=\%1*\ %t\ %1*
set statusline+=%1*\ %{GitInfo()}                        " Git Branch name

" ██████╗ ██╗     ██╗   ██╗ ██████╗ ██╗███╗   ██╗     ██████╗ ██████╗ ███╗   ██╗███████╗██╗ ██████╗
" ██╔══██╗██║     ██║   ██║██╔════╝ ██║████╗  ██║    ██╔════╝██╔═══██╗████╗  ██║██╔════╝██║██╔════╝
" ██████╔╝██║     ██║   ██║██║  ███╗██║██╔██╗ ██║    ██║     ██║   ██║██╔██╗ ██║█████╗  ██║██║  ███╗
" ██╔═══╝ ██║     ██║   ██║██║   ██║██║██║╚██╗██║    ██║     ██║   ██║██║╚██╗██║██╔══╝  ██║██║   ██║
" ██║     ███████╗╚██████╔╝╚██████╔╝██║██║ ╚████║    ╚██████╗╚██████╔╝██║ ╚████║██║     ██║╚██████╔╝
" ╚═╝     ╚══════╝ ╚═════╝  ╚═════╝ ╚═╝╚═╝  ╚═══╝     ╚═════╝ ╚═════╝ ╚═╝  ╚═══╝╚═╝     ╚═╝ ╚═════╝

" coc
if (sysOS == "windows")
  let g:coc_extension_root = 'C:/users/beckad/.config/.nvim'
  let g:coc_config_home = 'C:/Users/beckad/.config/.nvim'
endif

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
" omnisharp
" let g:OmniSharp_server_stdio = 1
" let g:OmniSharp_highlight_types = 3
" let g:OmniSharp_timeout = 10
" let g:OmniSharp_selector_ui = 'fzf'    " Use fzf.vim

"ale
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

" rainbow
let g:rainbow_active = 1

" closetag
let g:closetag_filenames = '*.html,*.xhtml,*.phtml, *.md, *.cshtml'

" floaterm
let g:floaterm_position = 'center'
let g:floaterm_borderchars = ['','','','','','','','']
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F9>'
let g:floaterm_keymap_toggle = '<F10>'

" diminactive
let g:diminactive_enable_focus = 1
let g:diminactive_use_colorcolumn = 1

" indent guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_color_change_percent = 1

" limelight
let g:limelight_default_coefficient = 0.8

" ███████╗██╗   ██╗███╗   ██╗ ██████╗████████╗██╗ ██████╗ ███╗   ██╗███████╗
" ██╔════╝██║   ██║████╗  ██║██╔════╝╚══██╔══╝██║██╔═══██╗████╗  ██║██╔════╝
" █████╗  ██║   ██║██╔██╗ ██║██║        ██║   ██║██║   ██║██╔██╗ ██║███████╗
" ██╔══╝  ██║   ██║██║╚██╗██║██║        ██║   ██║██║   ██║██║╚██╗██║╚════██║
" ██║     ╚██████╔╝██║ ╚████║╚██████╗   ██║   ██║╚██████╔╝██║ ╚████║███████║
" ╚═╝      ╚═════╝ ╚═╝  ╚═══╝ ╚═════╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝╚══════╝

function! CreateCenteredFloatingWindow()
    let $TERM = ''
    let width = min([&columns - 4, max([80, &columns - 20])])
    let height = min([&lines - 4, max([20, &lines - 10])])
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "/" . repeat("-", width - 2) . "\\"
    let mid = "|" . repeat(" ", width - 2) . "|"
    let bot = "\\" . repeat("-", width - 2) . "/"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction

function! Fzf_dev()
  let l:fzf_files_options = '--preview "bat --line-range :'.&lines.' --style=numbers,changes --color always {2..-1}" --preview-window down:50'
  function! s:files()
    let l:files = split(system($FZF_DEFAULT_COMMAND), '\n')
    return s:prepend_icon(l:files)
  endfunction

  function! s:prepend_icon(candidates)
    let l:result = []
    for l:candidate in a:candidates
      let l:filename = fnamemodify(l:candidate, ':p:t')
      let l:icon = WebDevIconsGetFileTypeSymbol(l:filename, isdirectory(l:filename))
      call add(l:result, printf('%s %s', l:icon, l:candidate))
    endfor

    return l:result
  endfunction

  function! s:edit_file(item)
    let l:pos = stridx(a:item, ' ')
    let l:file_path = a:item[pos+1:-1]
    execute 'silent e' l:file_path
  endfunction

  call fzf#run({
        \ 'source': <sid>files(),
        \ 'sink':   function('s:edit_file'),
        \ 'options': '-m --reverse ' . l:fzf_files_options,
        \ 'down':    '40%',
        \ 'window': 'call CreateCenteredFloatingWindow()'})

endfunction

let g:fzf_layout = { 'window': 'call CreateCenteredFloatingWindow()' }
let $FZF_DEFAULT_OPTS="--reverse"

" use rg by default
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --iglob "!node_modules" --iglob "!.git" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif


" Show documentation from Coc
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

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

" Function: display errors from Ale in statusline
function! LinterStatus() abort
   let l:counts = ale#statusline#Count(bufnr(''))
   let l:all_errors = l:counts.error + l:counts.style_error
   let l:all_non_errors = l:counts.total - l:all_errors
   return l:counts.total == 0 ? "DON'T PANIC": printf(
   \ "PANIC")
endfunction

function! GitInfo()
  let git = fugitive#head()
  if git != ''
    return '→ '.fugitive#head() . ' '
  else
    return ''
  endif
endfunction

 " ██████╗ ██████╗ ███╗   ███╗███╗   ███╗ █████╗ ███╗   ██╗██████╗ ███████╗
" ██╔════╝██╔═══██╗████╗ ████║████╗ ████║██╔══██╗████╗  ██║██╔══██╗██╔════╝
" ██║     ██║   ██║██╔████╔██║██╔████╔██║███████║██╔██╗ ██║██║  ██║███████╗
" ██║     ██║   ██║██║╚██╔╝██║██║╚██╔╝██║██╔══██║██║╚██╗██║██║  ██║╚════██║
" ╚██████╗╚██████╔╝██║ ╚═╝ ██║██║ ╚═╝ ██║██║  ██║██║ ╚████║██████╔╝███████║
 " ╚═════╝ ╚═════╝ ╚═╝     ╚═╝╚═╝     ╚═╝╚═╝  ╚═╝╚═╝  ╚═══╝╚═════╝ ╚══════╝

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" ███╗   ███╗ █████╗ ██████╗ ██████╗ ██╗███╗   ██╗ ██████╗ ███████╗
" ████╗ ████║██╔══██╗██╔══██╗██╔══██╗██║████╗  ██║██╔════╝ ██╔════╝
" ██╔████╔██║███████║██████╔╝██████╔╝██║██╔██╗ ██║██║  ███╗███████╗
" ██║╚██╔╝██║██╔══██║██╔═══╝ ██╔═══╝ ██║██║╚██╗██║██║   ██║╚════██║
" ██║ ╚═╝ ██║██║  ██║██║     ██║     ██║██║ ╚████║╚██████╔╝███████║
" ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝     ╚═╝╚═╝  ╚═══╝ ╚═════╝ ╚══════╝

" coc
" user Alt j/k to navigate the completion list
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Overides the default custom shortcut leader (default is \)
let mapleader = ","

" Allows using ; to enter command mode
nnoremap ; :

"Insert a Figlet of the word under the cursor (requires vim-commentary & the figlet npm package
nmap <Leader>\ :call InsertFiglet()<CR>

" Allows for quicker and more inuitive buffer swapping
nmap <Tab> :bnext<CR>
nmap <S-Tab> :bprevious<CR>

" Faster saves
nmap <leader>w :w<CR>

" Activate zen mode
nmap <leader>g :Goyo<CR>

" VS Code style fuzzy search
nmap <C-p> :call Fzf_dev()<CR>

" GO to anywhere on the screen
nmap go <Plug>(easymotion-jumptoanywhere)

" Omnisharp shortcuts
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

" Add new lines without going in to insert mode
nmap <Leader>o o<Esc>
nmap <Leader>O O<Esc>

" Quickly jump to various config files
map <Leader>v :e $MYVIMRC<CR>
map <Leader>c :CocConfig<CR>

" Try and make TAB automatically autocomplete with coc
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>CheckBackSpace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:CheckBackSpace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Coc shortcuts
nnoremap <silent> H :call <SID>show_documentation()<CR>
nmap ge :CocCommand explorer<CR>

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

" Remap arrows to resize
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>

" limelight
nmap <Leader>l :Limelight!!<CR>
xmap <Leader>l :Limelight!!<CR>

" remap the K command so I can use K for something else
nnoremap <Leader>k <S-k>

" more intuitive half page scrolling
nnoremap <S-j> <C-d>
nnoremap <S-k> <C-u>

