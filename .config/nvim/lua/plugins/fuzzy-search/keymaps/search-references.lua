return {
  "<space>sr",
  function()
    require "telescope.builtin".lsp_references()
  end,
  desc = "Go to references",
}
