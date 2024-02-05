return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = require(
    "plugins.language-server-protocol.dependencies"),
  opts = require("plugins.language-server-protocol.plugin-settings"),
  keys = require("plugins.language-server-protocol.keymaps"),
  config = require(
    "plugins.language-server-protocol.startup-function"
  )
}
