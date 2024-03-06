return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = require(
    "modules.language-server-protocol.dependencies"),
  opts = require("modules.language-server-protocol.plugin-settings"),
  keys = require("modules.language-server-protocol.keymaps"),
  config = require(
    "modules.language-server-protocol.startup-function"
  )
}
