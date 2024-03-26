return {
  "mhinz/vim-startify",
  config = function()
      vim.g.startify_fortune_use_unicode = 1
      vim.g.startify_custom_header = "startify#center(startify#fortune#cowsay())"
      vim.g.startify_change_to_dir = 0
      vim.g.startify_change_to_vcs_root = 1
      vim.g.startify_session_persistence = 1
      vim.g.startify_session_dir = "$HOME/.vim-sessions"
      vim.g.startify_lists = {
        {
          type = "sessions",
          header = { "  Sessions" }
        },
        {
          type = 'dir',
          header = {"   Current Directory "..vim.fn.getcwd()..":"}
        }
     }
      vim.api.nvim_set_hl(0, "StartifyHeader", { ctermfg = 4, fg = "#65a9b6", bold = true, })
      vim.api.nvim_set_hl(0, "StartifyPath", { ctermfg = 6, fg = "#848884" })
      vim.api.nvim_set_hl(0, "StartifySlash", { ctermfg = 6, fg = "#848884" })
      vim.api.nvim_set_hl(0, "StartifyFile", { ctermfg = 12, fg = "#7daea3", bold=true })
      vim.api.nvim_set_hl(0, "StartifyBracket", { ctermfg = 12, fg = "#7daea3" })
      vim.api.nvim_set_hl(0, "StartifyNumber", { ctermfg = 4, fg = "#65a9b6", bold=true })
      vim.api.nvim_set_hl(0, "StartifySection", { ctermfg = 4, fg = "#65a9b6", bold=true })
  end
}
