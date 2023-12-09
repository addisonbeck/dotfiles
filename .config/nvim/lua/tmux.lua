local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
vim.opt.rtp:prepend(lazypath)
require("lazy").setup({
  {
    "nvim-telescope/telescope.nvim", tag = "0.1.5",
    dependencies = { 
      { "nvim-lua/plenary.nvim" },
      { "camgraff/telescope-tmux.nvim" }
    }
  }
})
require('telescope').setup({
  defaults = {
    layout_config = {
      horizontal = { 
        width = 0.99,
        height = 0.99,
        prompt_position = "bottom"
      }
      -- other layout configuration here
    },
    -- other defaults configuration here
  },
  -- other configuration values here
})
require('telescope').load_extension('tmux')
