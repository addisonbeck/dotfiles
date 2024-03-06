local keymapper = require("utils.keymapper")

local rename = keymapper.bindKeymap{
  description = "Rename the file under the cursor",
  command = "rn",
  operation = vim.lsp.buf.rename,
}

local previousDiagnostic = keymapper.bindKeymap{
  description = "Go to the previous diagnostic",
  command = "[",
  operation = vim.diagnostic.goto_prev,
}

local nextDiagnostic = keymapper.bindKeymap{
  description = "Go to the next diagnostic",
  command = "]",
  operation = vim.diagnostic.goto_next,
}

local hover = keymapper.bindKeymap{
  description = "Show type documentation under the cursor",
  command = "h",
  operation = vim.lsp.buf.hover,
}

local hoverError = keymapper.bindKeymap{
  description = "Show the error under the cursor",
  command = "e",
  operation = vim.diagnostic.open_float
}

local performCodeAction = keymapper.bindKeymap{
  description = "Show code actions for the symbol under the cursor.",
  command = "ca",
  operation = vim.lsp.buf.code_action
}

local Keymaps = {
  rename:toLazyKeysSpec(),
  previousDiagnostic:toLazyKeysSpec(),
  nextDiagnostic:toLazyKeysSpec(),
  hover:toLazyKeysSpec(),
  hoverError:toLazyKeysSpec(),
  performCodeAction:toLazyKeysSpec()
}

return Keymaps
