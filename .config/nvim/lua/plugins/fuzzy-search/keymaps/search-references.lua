return {
  "<space>gr",
  function()
    require "telescope.builtin".lsp_references()
  end,
  desc = "Go to references",
}
