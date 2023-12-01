local vim = vim
local opt = vim.opt
local o = vim.o
local cmd = vim.cmd

cmd('filetype on')
cmd('syntax on')
cmd('confirm')
cmd('noswapfile')

-- global options
o.clipboard=[[unnamed,unnamedplus]]
o.cmdheight = 3
-- TODO: somehow set this up to only keep a min of 5 buffers with active edits? Look at bufhidden.
o.hidden = true
o.ignorecase = true
o.lazyredraw = true
o.mouse = 'a'
o.scrolljump = -5
o.showmode = false
o.smartcase = true
o.splitbelow = true
o.splitright = true
o.updatetime = 300

-- window-local options
o.number = true
o.relativenumber = true
o.signcolumn = 'number'

-- buffer-local options
o.expandtab = true
o.smartindent = true
o.softtabstop = 2
o.tabstop = 2

o.undofile = true
o.sw = 2


-- opt.foldmethod = "expr"
-- opt.foldexpr = "nvim_treesitter#foldexpr()"

