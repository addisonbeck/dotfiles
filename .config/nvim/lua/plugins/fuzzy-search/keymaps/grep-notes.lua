return {
  "<space>gn",
  function()
    require("telescope.builtin").live_grep({
      cwd = "~/notes",
      path_display = { "tail" },
    })
  end,
  desc = "Grep Notes",
}

