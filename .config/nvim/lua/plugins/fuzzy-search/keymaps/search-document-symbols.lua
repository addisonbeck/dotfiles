return {
  "<space>sy",
  function()
    require "telescope.builtin".lsp_document_symbols()
  end,
  desc = "Search document symbols",
}
