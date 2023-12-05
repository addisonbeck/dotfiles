local opts = { noremap=true, silent=true }
local optss = { noremap=true, silent=true, unique=true }
vim.api.nvim_set_keymap('n', '|', ':NvimTreeFindFileToggle<CR>', opts)
vim.api.nvim_set_keymap('n', '\\', ':Telescope<CR>', opts)
vim.api.nvim_set_keymap('n', '<Tab>', ':Telescope buffers<CR>', opts)
vim.api.nvim_set_keymap('n', '<S-Tab>', ':Telescope git_files<CR>', opts)
