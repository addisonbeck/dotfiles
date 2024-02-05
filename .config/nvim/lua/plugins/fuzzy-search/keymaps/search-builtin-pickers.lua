return {
  "|",
  function()
    require "telescope".extensions.file_browser.file_browser({
      path = "%:p:h",
      hidden = true,
      respect_gitignore = false,
      select_buffer = true,
      use_fd = false,
    })
  end,
  desc = "Search Telescope builtin pickers",
}
