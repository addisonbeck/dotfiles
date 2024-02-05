return {
  "nvim-telescope/telescope.nvim", tag = "0.1.5",
  dependencies = {
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
  },
  setup = {
    extensions = {
      file_browser = {
        hidden = true,
        grouped = true,
        respect_gitignore = false
      },
    },
  },
  keys = {
    {
      "\\",
      function()
        require("telescope.builtin").builtin()
      end,
      desc = "Open File Browser",
    },
    {
      "|",
      function()
        require "telescope".extensions.file_browser.file_browser({
          path = "%:p:h",
          hidden = true,
          respect_gitignore = false,
          select_buffer = true,
          use_fd=false,
        })
      end,
      desc = "Search Telescope builtin pickers",
    },
    {
      "<Tab>",
      function()
        require "telescope.builtin".buffers()
      end,
      desc = "Search files with open buffers",
    },
    {
      "<S-Tab>",
      function()
        require "telescope.builtin".git_files()
      end,
      desc = "Search files in the current git repository",
    },
    {
      "<space>gd",
      function()
        require "telescope.builtin".lsp_definitions()
      end,
      desc = "Go to definition",
    },
    {
      "<space>gr",
      function()
        require "telescope.builtin".lsp_references()
      end,
      desc = "Go to references",
    },
    {
      "<space>gi",
      function()
        require "telescope.builtin".lsp_implementations()
      end,
      desc = "Go to implementations",
    },
  },
}
