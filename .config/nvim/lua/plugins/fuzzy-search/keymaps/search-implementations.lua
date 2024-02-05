return {
  "<space>gi",
  function()
    require "telescope.builtin".lsp_implementations()
  end,
  desc = "Go to implementations",
}
