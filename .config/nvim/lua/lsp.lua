local lsp = require('lspconfig')

local on_attach = function(client, bufnr)
    -- Mappings.
    local opts = { noremap = true, silent = true }

    -- Turn this on if you turn off autocomplete
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gdec', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gdef', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'H', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gimp', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '<C-s>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'rename', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'fix', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gref', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "format", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, 'n', '?', "<cmd>lua vim.diagnostic.open_float()<CR>", opts)

    -- underline context keywords
    if client.resolved_capabilities.document_highlight then
        vim.cmd [[
            hi! LspReferenceRead cterm=underline gui=underline
            hi! LspReferenceText cterm=underline gui=underline
            hi! LspReferenceWrite cterm=underline gui=underline
        ]]
        vim.api.nvim_create_augroup('lsp_document_highlight', {
            clear = false
        })
        vim.api.nvim_clear_autocmds({
            buffer = bufnr,
            group = 'lsp_document_highlight',
        })
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            group = 'lsp_document_highlight',
            buffer = bufnr,
            callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd('CursorMoved', {
            group = 'lsp_document_highlight',
            buffer = bufnr,
            callback = vim.lsp.buf.clear_references,
        })
    end
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local simple_servers = { "tsserver", "gopls", "svelte" }

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

for _, server in ipairs(simple_servers) do
    lsp[server].setup {
        capabilities = capabilities,
        on_attach = on_attach,
        flags = {
            debounce_text_changes = 150,
        }
    }
end

-- local pid = vim.fn.getpid()
-- local omnisharp_dll = "/Users/addisonbeck/.local/share/omnisharp/OmniSharp.dll"
-- lsp.omnisharp.setup {
--     capabilities = capabilities,
--     cmd = { "dotnet", omnisharp_dll, "--languageserver", "--hostPID", tostring(pid) },
--     on_attach = on_attach,
--     filetypes = { "cs", "vb", "cshtml" }
-- }
