return {
  'echasnovski/mini.indentscope',
  event = { "BufReadPre", "BufNewFile" },
  version = "*",
  opts = {
    delay = 0,
    draw = {
      animation = function()
        return 0
      end
    },
    symbol = "┊",
  },
  config = function(_, opts)
    require('mini.indentscope').setup(opts)
    vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", {
      ctermfg = 8,
    })
  end
}
