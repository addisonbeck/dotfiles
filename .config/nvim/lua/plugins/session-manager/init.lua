return {
  "Shatur/neovim-session-manager",
  branch = "master",
  setup = {
    autosave_last_session = true,
    autosave_ignore_not_normal = true,
    autosave_ignore_dirs = {},
    autoload_mode = 'Disabled',
    autosave_ignore_filetypes = {
      'gitcommit',
      'gitrebase',
    },
    autosave_ignore_buftypes = {},
    autosave_only_in_session = false,
    max_path_length = 80,
  }
}
