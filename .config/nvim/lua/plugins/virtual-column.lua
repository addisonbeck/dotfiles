return { "lukas-reineke/virt-column.nvim",
  opts = {
  },
  config = {
    char="│",
    virtcolumn="+80",
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
