return {
  "|",
  function()
    require("telescope.builtin").find_files({
      cwd = "~/notes",
    })
  end,
  desc = "Search Notes",
}

