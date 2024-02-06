return {
  "<space>cd",
  function()
    require "telescope.builtin".diagnostics()
  end,
  desc = "Search lsp diagnostics",
}
