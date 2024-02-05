return {
  "<space>gd",
  function()
    require "telescope.builtin".lsp_definitions()
  end,
  desc = "Go to definition",
}
