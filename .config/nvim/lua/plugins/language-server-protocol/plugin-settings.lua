return {
  diagnostics = {
    underline = true,
    update_in_insert = false,
    virtual_text = {
      spacing = 4,
      source = "if_many",
      prefix = "●",
    },
    severity_sort = true,
  },
  capabilities = {},
  servers = require(
    "plugins.language-server-protocol.server-configs"
  ),
  setup = {},
}
