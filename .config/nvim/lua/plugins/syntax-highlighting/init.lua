return { 
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")
    configs.setup({
        ensure_installed = {
          "c",
          "lua",
          "vim",
          "vimdoc",
          "query",
          "c_sharp",
          "typescript",
          "javascript",
          "html",
          "markdown",
          "markdown_inline",
          "python",
          "rust",
          "svelte",
          "sql",
        },
        sync_install = false,
        auto_install = true,
        highlight = { 
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        require("plugins.syntax-highlighting.markdown-overrides")
    })
  end
}
