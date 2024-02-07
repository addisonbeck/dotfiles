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

require("lazy").setup(enabled_plugins)

