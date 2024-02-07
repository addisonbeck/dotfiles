-- Install lazyvim if it does not exist
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local enabled_plugins = {
  require "plugins.fuzzy-search",
  require "plugins.icons",
  require "plugins.start-screen",
  require "plugins.language-server-protocol",
  require "plugins.syntax-highlighting",
  require "plugins.quick-comments",
  require "plugins.virtual-column",
  require "plugins.focus-mode",
  -- require "plugins.session-manager",
}

vim.cmd [[
  hi DiagnosticUnderlineError cterm=undercurl,bold,italic ctermfg=red guisp=ctermfg
  hi DiagnosticUnderlineWarn cterm=undercurl,bold,italic ctermfg=yellow guisp=ctermfg
  hi DiagnosticUnderlineHint cterm=undercurl ctermfg=blue guisp=ctermfg
  hi DiagnosticUnderlineInfo cterm=undercurl ctermfg=cyan guisp=ctermfg
]]

vim.diagnostic.config(
  {
    virtual_text = {
      prefix = "",
      spacing = 0,
      format = function(diagnostic)
       if diagnostic.severity == vim.diagnostic.severity.ERROR then
         return '←🧚'
       end
       if diagnostic.severity == vim.diagnostic.severity.WARN then
         return '←🧚'
       end
       if diagnostic.severity == vim.diagnostic.severity.HINT then
         return '←🧚'
       end
       if diagnostic.severity == vim.diagnostic.severity.HINT then
         return '←🧚'
       end
       return diagnostic.message
      end,
    },
  }
)

require("lazy").setup(enabled_plugins)

