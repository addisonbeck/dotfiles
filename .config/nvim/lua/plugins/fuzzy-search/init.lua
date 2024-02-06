return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = require("plugins.fuzzy-search.dependencies"),
  opts = require("plugins.fuzzy-search.setup"),
  keys = require("plugins.fuzzy-search.keymaps"),
  config = function(_, opts)
    require('telescope').setup(opts)
    require('telescope').load_extension("file_browser")
  end
}
