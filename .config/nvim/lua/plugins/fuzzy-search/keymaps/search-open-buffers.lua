return {
  "<Tab>",
  function()
    require "telescope.builtin".buffers()
  end,
  desc = "Search files with open buffers",
}
