-- MARKDOWN 

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

-- STARTIFY

vim.api.nvim_set_hl(0, "StartifyHeader", { ctermfg = 1 })
vim.api.nvim_set_hl(0, "StartifyPath", { ctermfg = 6 })
vim.api.nvim_set_hl(0, "StartifySlash", { ctermfg = 6 })
vim.api.nvim_set_hl(0, "StartifyFile", { ctermfg = 9 })
vim.api.nvim_set_hl(0, "StartifyBracket", { ctermfg = 9 })
vim.api.nvim_set_hl(0, "StartifyNumber", { ctermfg = 1 })
vim.api.nvim_set_hl(0, "StartifySection", { ctermfg = 1 })
