-- local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

local packer_is_missing = fn.empty(fn.glob(install_path)) > 0

if packer_is_missing then
    packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
        install_path })
end

return require('packer').startup(
    {
        function(use)
            use { 'wbthomason/packer.nvim' }
            use { 'morhetz/gruvbox' }
            use { 'wesgibbs/vim-irblack' }
            use
            {
                'mhinz/vim-startify',
                config = function()
                    vim.g.startify_fortune_use_unicode = 1
                    vim.g.startify_custom_header = 'startify#center(startify#fortune#cowsay())'
                    vim.g.startify_change_to_dir = 1
                    vim.g.startify_change_to_vcs_root = 1
                end
            }
            use { 'neovim/nvim-lspconfig' }
            use { 'tpope/vim-commentary' }
            use { 'kyazdani42/nvim-tree.lua', }
            use { 'kyazdani42/nvim-web-devicons' }
            use {
                'addisonbeck/telescope.nvim',
                requires = {
                    { 'nvim-lua/popup.nvim' },
                    { 'nvim-lua/plenary.nvim'},
                },
            }
            use { 'Pocco81/TrueZen.nvim' }
            use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
            use { 'hrsh7th/cmp-nvim-lsp' }
            use { 'hrsh7th/cmp-buffer' }
            use { 'hrsh7th/cmp-path' }
            use { 'hrsh7th/cmp-cmdline' }
            use { 'hrsh7th/nvim-cmp' }
            use { 'saadparwaiz1/cmp_luasnip' }
            use { "windwp/nvim-autopairs" }
            use { "windwp/nvim-ts-autotag" }
            use { "L3MON4D3/LuaSnip", tag = "v>CurrentMajor>.*" }
            use { "preservim/vim-colors-pencil" }
            use {
                "benfowler/telescope-luasnip.nvim",
            }
            if packer_bootstrap then
                require('packer').sync()
            end
        end
    }
)

