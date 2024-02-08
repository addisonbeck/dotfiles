return {
  "<space>s.",
  function()
    require("telescope.builtin").git_files({
      cwd = "~",
    })
  end,
  desc = "Search Dotfiles",
}

