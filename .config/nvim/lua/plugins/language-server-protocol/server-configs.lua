return {
  svelte = {},
  tsserver = {},
  angularls = {},
  bashls = {},
  csharp_ls = {},
  eslint = {},
  marksman = {},
  vimls = {},
  html = {},
  gopls = {},
  lua_ls = {
    settings = {
      Lua = {
        workspace = {
          checkThirdParty = false,
          library = {
            vim.env.VIMRUNTIME
          }
        }
      }
    }
  },
}
