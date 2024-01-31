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
  "kyazdani42/nvim-web-devicons",
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.5",
    setup = {
      extensions = {
        file_browser = {
          hidden = true,
          grouped = true,
          respect_gitignore = false
        },
      },
    },
    dependencies = { 
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzy-native.nvim" },
      { "nvim-telescope/telescope-file-browser.nvim" },
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
              "markdown_inline",
              "python",
              "rust",
              "svelte",
              "sql",
            },
            sync_install = false,
            auto_install = true,
            highlight = { 
              enable = true,
              additional_vim_regex_highlighting = false,
            },
            indent = { enable = true },
        })
      end
  },
  { "williamboman/mason.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "WhoIsSethDaniel/mason-tool-installer.nvim" },
  { "lukas-reineke/virt-column.nvim",
    opts = {
    },
    config = {
      char="│",
      virtcolumn="+80",
      exclude = {
        filetypes = {
          "lspinfo",
          "help",
          "man", 
          "TelescropePrompt",
          "TelescroptResults",
          "startify",
        },
      },
    },
  },
  { "junegunn/goyo.vim", branch = 'master' }
})

require('telescope').load_extension('fzy_native')
require('telescope').load_extension('file_browser')

vim.api.nvim_set_hl(0, "@markup.heading.1.marker", { 
  ctermfg = 8
})

vim.api.nvim_set_hl(0, "@markup.heading.2.marker", { 
  ctermfg = 8
})

vim.api.nvim_set_hl(0, "@markup.heading.3.marker", { 
  ctermfg = 8
})

vim.api.nvim_set_hl(0, "@punctuation.special.markdown", { 
  ctermfg = 8
})

vim.api.nvim_set_hl(0, "@markup.heading", { 
  -- ctermfg = 2,
  underdotted = true,
  bold = true,
})

vim.api.nvim_set_hl(0, "@markup.quote.markdown", { 
  italic = true,
  ctermfg = 6
})

vim.api.nvim_set_hl(0, "@markup.list.markdown", { 
  ctermfg = 2,
})

vim.api.nvim_set_hl(0, "@markup.link.label.markdown", { 
  ctermfg = 4,
})

vim.api.nvim_set_hl(0, "@markup.link.label.markdown_inline", { 
  ctermfg = 4,
})

vim.api.nvim_set_hl(0, "@markup.link.markdown_inline", { 
  ctermfg = 2,
})

vim.api.nvim_set_hl(0, "@markup.link.url.markdown", { 
  ctermfg = 6,
})

vim.api.nvim_set_hl(0, "@markup.raw.block.markdown", { 
  ctermfg = 6,
})

vim.api.nvim_set_hl(0, "@markup.raw.markdown_inline", { 
  ctermfg = 6,
})

vim.api.nvim_set_hl(0, "@markup.raw.delimiter.markdown", { 
  ctermbg = 0,
  ctermfg = 2,
})

vim.api.nvim_set_hl(0, "@markup.raw.delimiter.markdown_inline", { 
  ctermfg = 2,
  ctermbg = 0,
})

vim.api.nvim_set_hl(0, "@markup.list.unchecked.markdown", { 
  ctermfg = 1,
})

vim.api.nvim_set_hl(0, "@markup.list.checked.markdown", { 
  ctermfg = 2,
})
