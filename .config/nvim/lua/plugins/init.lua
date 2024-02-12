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

-- Declare a list of currently in use plugins
local enabled_plugins = {
  "fuzzy-search",
  "icons",
  "start-screen",
  "language-server-protocol",
  "syntax-highlighting",
  "quick-comments",
  "virtual-column",
  "focus-mode",
  --"plugins.session-manager",
}

-- Only load plugins that don't have any syntax errors
local functional_plugins = {}
for i = 1, #enabled_plugins do
  local pluginIsOk, plugin = pcall(require, 'plugins.' .. enabled_plugins[i])
  if pluginIsOk then
    table.insert(functional_plugins, plugin)
  else
    print("Module had an error")
  end
  i = i + 1
end

require("lazy").setup(functional_plugins)
