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
    })

    vim.api.nvim_set_hl(0, "@markup.heading.1.marker", { 
      ctermfg = 8
    })

    vim.api.nvim_set_hl(0, "@markup.heading.2.marker", { 
      ctermfg = 8
    })

    vim.api.nvim_set_hl(0, "@markup.heading.3.marker", { 
      ctermfg = 8
    })

    vim.api.nvim_set_hl(0, "@markup.heading.4.marker", { 
      ctermfg = 8
    })

    vim.api.nvim_set_hl(0, "@markup.heading.5.marker", { 
      ctermfg = 8
    })

    vim.api.nvim_set_hl(0, "@punctuation.special.markdown", { 
      ctermfg = 8
    })

    vim.api.nvim_set_hl(0, "@markup.heading", { 
      -- ctermfg = 2,
      underdotted = true,
      bold = true,
    })

    vim.api.nvim_set_hl(0, "@markup.quote.markdown", { 
      italic = true,
      ctermfg = 6
    })

    vim.api.nvim_set_hl(0, "@markup.list.markdown", { 
      ctermfg = 2,
    })

    vim.api.nvim_set_hl(0, "@markup.link.label.markdown", { 
      ctermfg = 4,
    })

    vim.api.nvim_set_hl(0, "@markup.link.label.markdown_inline", { 
      ctermfg = 4,
    })

    vim.api.nvim_set_hl(0, "@markup.link.markdown_inline", { 
      ctermfg = 2,
    })

    vim.api.nvim_set_hl(0, "@markup.link.url.markdown", { 
      ctermfg = 6,
    })

    vim.api.nvim_set_hl(0, "@markup.raw.block.markdown", { 
      ctermfg = 6,
    })

    vim.api.nvim_set_hl(0, "@markup.raw.markdown_inline", { 
      ctermfg = 6,
    })

    vim.api.nvim_set_hl(0, "@markup.raw.delimiter.markdown", { 
      ctermbg = 0,
      ctermfg = 2,
    })

    vim.api.nvim_set_hl(0, "@markup.raw.delimiter.markdown_inline", { 
      ctermfg = 2,
      ctermbg = 0,
    })

    vim.api.nvim_set_hl(0, "@markup.list.unchecked.markdown", { 
      ctermfg = 1,
    })

    vim.api.nvim_set_hl(0, "@markup.list.checked.markdown", { 
      ctermfg = 2,
    })
  end
}
