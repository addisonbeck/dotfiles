return {
  "<space>sdi",
  function()
    require "telescope.builtin".diagnostics()
  end,
  desc = "Search lsp diagnostics",
}
