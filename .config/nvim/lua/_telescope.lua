local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', 'gdef', '<Cmd>lua require"telescope.builtin".lsp_definitions{}<CR>', opts)
vim.api.nvim_set_keymap('n', 'gimp', '<Cmd>lua require"telescope.builtin".lsp_implementations{}<CR>', opts)
vim.api.nvim_set_keymap('n', 'gref', '<Cmd>lua require"telescope.builtin".lsp_references{}<CR>', opts)
vim.api.nvim_set_keymap('n', 'gtype', '<Cmd>lua require"telescope.builtin".lsp_type_definitions{}<CR>', opts)
vim.api.nvim_set_keymap('n', '\\', ':Telescope<CR>', opts)
-- vim.api.nvim_set_keymap('n', '<Space>', ':Telescope treesitter<CR>', opts)
vim.api.nvim_set_keymap('n', '<Tab>', ':Telescope buffers<CR>', opts)
vim.api.nvim_set_keymap('n', '<S-Tab>', ':Telescope find_files<CR>', opts)

require('telescope').setup({
    extensions = {
        luasnip = {}
    }
})
require('telescope').load_extension('luasnip')
