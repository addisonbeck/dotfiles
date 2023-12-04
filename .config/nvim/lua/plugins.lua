-- local execute = vim.api.nvim_command
local fn = vim.fn

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  "morhetz/gruvbox",
  {
      "mhinz/vim-startify",
      config = function()
          vim.g.startify_fortune_use_unicode = 1
          vim.g.startify_custom_header = "startify#center(startify#fortune#cowsay())"
          vim.g.startify_change_to_dir = 1
          vim.g.startify_change_to_vcs_root = 1
      end
  },
  "neovim/nvim-lspconfig",
  "tpope/vim-commentary",
  "kyazdani42/nvim-tree.lua",
  "kyazdani42/nvim-web-devicons",
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.x",
    dependencies = { 
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzy-native.nvim" },
    }
  },
  { 
      "nvim-treesitter/nvim-treesitter",
      build = ":TSUpdate",
      config = function ()
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = { 
              "c",
              "lua",
              "vim",
              "vimdoc",
              "query",
              "c_sharp",
              "typescript",
              "javascript",
              "html",
              "markdown",
              "python",
              "rust",
              "svelte",
              "sql",
            },
            sync_install = false,
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
      end
  },
  {
    "williamboman/mason.nvim"
  },
  {
    "williamboman/mason-lspconfig.nvim"
  },
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim"
  },
})

require('telescope').load_extension('fzy_native')
