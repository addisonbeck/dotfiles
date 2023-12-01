local opts = { noremap=true, silent=true }
local optss = { noremap=true, silent=true, unique=true }
vim.api.nvim_set_keymap('n', '|', ':NvimTreeFindFileToggle<CR>', opts)
