return {
  "<space>g.",
  function()
    require("telescope.builtin").live_grep({
      cwd = "~",
    })
  end,
  desc = "Grep Dotfiles",
}

