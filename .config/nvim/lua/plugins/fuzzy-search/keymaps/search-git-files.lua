return {
  "<S-Tab>",
  function()
    require "telescope.builtin".git_files()
  end,
  desc = "Search files in the current git repository",
}
