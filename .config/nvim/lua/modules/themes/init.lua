return {
  -- 'projekt0n/github-nvim-theme',
  "ellisonleao/gruvbox.nvim",
  lazy = false, -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  opts = {
    transparent_mode = true,
    contrast = "soft",
    italic = {
      strings = true,
      emphasis = true,
      comments = true,
      operators = true,
      folds = true,
    },
    overrides = {
      Winbar = {
        bold=true,
        fg=4,
        bg=NONE,
      },
      WinbarNC = {
        bold=true,
        fg=8,
        bg=NONE,
      }
    }
  },
  config = function(_, opts)
    require('gruvbox').setup(opts)
    vim.cmd('colorscheme gruvbox')
    vim.api.nvim_set_hl(0, "Winbar", {guibg = NONE, ctermbg = NONE})
    vim.api.nvim_set_hl(0, "WinbarNC", {guibg = NONE, ctermbg = NONE})
  end,
}
