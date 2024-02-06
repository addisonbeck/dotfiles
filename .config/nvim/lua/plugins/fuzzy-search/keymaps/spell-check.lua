return {
  "<space>a",
  function()
    require "telescope.builtin".spell_suggest()
  end,
  desc = "Open a spell check search",
}
