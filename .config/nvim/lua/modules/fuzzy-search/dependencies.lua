return {
  { "nvim-lua/plenary.nvim" },
  {
    "nvim-telescope/telescope-fzy-native.nvim",
    config = function()
      require('telescope').load_extension('fzy_native')
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    config = function()
      require('telescope').load_extension('file_browser')
    end,
  },
}
