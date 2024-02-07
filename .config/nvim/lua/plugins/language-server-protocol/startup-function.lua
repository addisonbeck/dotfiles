return function(_, opts)
  local servers = opts.servers
  local capabilities = vim.tbl_deep_extend(
    "force",
    {},
    vim.lsp.protocol.make_client_capabilities(),
    opts.capabilities or {}
  )

  local function setup(server)
    vim.cmd [[
      hi DiagnosticUnderlineError cterm=undercurl,bold,italic ctermfg=9 guisp=ctermfg
      hi DiagnosticUnderlineWarn cterm=undercurl,bold,italic ctermfg=11 guisp=ctermfg
      hi DiagnosticUnderlineHint cterm=undercurl ctermfg=12 guisp=ctermfg
      hi DiagnosticUnderlineInfo cterm=undercurl ctermfg=12 guisp=ctermfg
      hi DiagnosticUnderlineOk cterm=undercurl ctermfg=12 guisp=ctermfg
      hi DiagnosticUnnecessary cterm=undercurl ctermfg=6 guisp=ctermfg
      highlight NormalFloat ctermbg=0 guibg=ctermbg
      highlight FloatBorder ctermfg=7 ctermbg=0 guibg=ctermbg guifg=ctermfg
    ]]

    local border = {
        {"🭽", "FloatBorder"},
        {"▔", "FloatBorder"},
        {"🭾", "FloatBorder"},
        {"▕", "FloatBorder"},
        {"🭿", "FloatBorder"},
        {"▁", "FloatBorder"},
        {"🭼", "FloatBorder"},
        {"▏", "FloatBorder"},
    }

    -- float overrides
    local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
    function vim.lsp.util.open_floating_preview(contents, syntax, bopts, ...)
      bopts = bopts or {}
      bopts.border = bopts.border or border
      return orig_util_open_floating_preview(contents, syntax, bopts, ...)
    end

    vim.diagnostic.config(
      {
        virtual_text = {
          prefix = "",
          spacing = 0,
          format = function(diagnostic)
           if diagnostic.severity == vim.diagnostic.severity.ERROR then
             return '←🧚'
           end
           if diagnostic.severity == vim.diagnostic.severity.WARN then
             return '←🧚'
           end
           if diagnostic.severity == vim.diagnostic.severity.INFO then
             return '←🧚'
           end
           if diagnostic.severity == vim.diagnostic.severity.HINT then
             return '←🧚'
           end
           return diagnostic.message
          end
        },
        float = {
          source = true,
          suffix = " ✨",
          prefix = "🧚 ",
          header = ""
        }
      }
    )

    -- vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    --  vim.lsp.handlers.hover, {
    --    -- Use a sharp border with `FloatBorder` highlights
    --    border = "single",
    --  }
    -- )

    local server_opts = vim.tbl_deep_extend("force", {
      capabilities = vim.deepcopy(capabilities),
    }, servers[server] or {})

    if opts.setup[server] then
      if opts.setup[server](server, server_opts) then
        return
      end
    elseif opts.setup["*"] then
      if opts.setup["*"](server, server_opts) then
        return
      end
    end
    require("lspconfig")[server].setup(server_opts)
  end

  local have_mason, mlsp = pcall(require, "mason-lspconfig")
  local all_mslp_servers = {}
  if have_mason then
    all_mslp_servers = vim.tbl_keys(
      require("mason-lspconfig.mappings.server").lspconfig_to_package)
  end

  local ensure_installed = {} ---@type string[]
  for server, server_opts in pairs(servers) do
    if server_opts then
      server_opts = server_opts == true and {} or server_opts
      -- run manual setup if mason=false or if this is a server that 
      -- cannot be installed with mason-lspconfig
      if server_opts.mason == false
        or not vim.tbl_contains(all_mslp_servers, server)
      then
        setup(server)
      else
        ensure_installed[#ensure_installed + 1] = server
      end
    end
  end

  if have_mason then
    mlsp.setup({ ensure_installed = ensure_installed })
    mlsp.setup_handlers({ setup })
  end
end
