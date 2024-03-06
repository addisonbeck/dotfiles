return { "lukas-reineke/virt-column.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = {
    char="│",
    virtcolumn="80",
    exclude = {
      filetypes = {
        "lspinfo",
        "help",
        "man",
        "TelescropePrompt",
        "TelescroptResults",
        "startify",
      },
    },
  },
}
