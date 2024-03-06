local keymapper = require("utils.keymapper")

return {
  "nvim-telescope/telescope.nvim",
  tag = "0.1.5",
  dependencies = require("modules.fuzzy-search.dependencies"),
  opts = require("modules.fuzzy-search.setup"),
  keys = require("modules.fuzzy-search.keys"),
  config = function(_, opts)
    require('telescope').setup(opts)
    require('telescope').load_extension('file_browser')
  end
}
