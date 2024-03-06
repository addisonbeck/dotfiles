local keymapper = require("utils.keymapper")

local searchNotes = keymapper.bindKeymap{
  description = "Search files in my notes",
  command = "sn",
  operation = function()
    require("telescope.builtin").find_files({
      cwd = "~/notes",
    })
  end
}

local spellCheck = keymapper.bindKeymap{
  description = "Open a spell check search",
  command = "s=",
  operation = function()
    require "telescope.builtin".spell_suggest()
  end,
}

local grepDotfiles = keymapper.bindKeymap{
  description = "Grep a string over my dotfiles",
  command = "g.",
  operation = function()
    require("telescope.builtin").live_grep({
      cwd = "~",
    })
  end,
}

local grepNotes = keymapper.bindKeymap{
  description = "Grep a string over my notes",
  command = "gn",
  operation = function()
    require("telescope.builtin").live_grep({
      cwd = "~/notes",
    })
  end,
}

local openFileBrowser = keymapper.bindKeymap{
  description = "Open a file browser",
  leader = "",
  command = "\\",
  operation = function()
    require("telescope").extensions.file_browser.file_browser()
  end,
}

local searchTelescopePickers = keymapper.bindKeymap{
  description = "Search through Telescope pickers",
  leader = "",
  command = "|",
  function()
    require("telescope.builtin").builtin()
  end,
}

local searchDefinitions = keymapper.bindKeymap{
  description = "Search definitons of the symbol under the cursor",
  command = "sde",
  operation = function()
    require "telescope.builtin".lsp_definitions()
  end,
}

local searchDiagnostics = keymapper.bindKeymap{
  description = "Search availible diagnostics",
  command = "sdi",
  operation = function()
    require "telescope.builtin".diagnostics()
  end,
}

local searchDocumentSymbols = keymapper.bindKeymap{
  description = "Search all symbols in the current document",
  command = "sy",
  operation = function()
    require "telescope.builtin".lsp_document_symbols()
  end,
}

local searchDotfiles = keymapper.bindKeymap{
  description = "Search files in my dotfiles",
  command = "s.",
  operation = function()
    require("telescope.builtin").git_files({
      cwd = "~",
    })
  end,
}

local searchGitFiles = keymapper.bindKeymap{
  description = "Search files in the current git repo",
  leader = "",
  command = "<S-Tab>",
  operation = function()
    require "telescope.builtin".git_files()
  end,
}

local searchImplementations = keymapper.bindKeymap{
  description = "Search implementations for the symbol under the cursor",
  command  = "si",
  operation = function()
    require "telescope.builtin".lsp_implementations()
  end,
}

local searchOpenBuffers = keymapper.bindKeymap{
  description = "Search through open buffers",
  leader = "",
  command = "<Tab>",
  operation = function()
    require "telescope.builtin".buffers()
  end,
}

local searchReferences = keymapper.bindKeymap{
  description = "Search references for the symbol under the cursor",
  command  = "sr",
  operation = function()
    require "telescope.builtin".lsp_references()
  end,
}

local Keymaps = {
  grepDotfiles:toLazyKeysSpec(),
  grepNotes:toLazyKeysSpec(),
  openFileBrowser:toLazyKeysSpec(),
  searchDefinitions:toLazyKeysSpec(),
  searchDiagnostics:toLazyKeysSpec(),
  searchDocumentSymbols:toLazyKeysSpec(),
  searchDotfiles:toLazyKeysSpec(),
  searchGitFiles:toLazyKeysSpec(),
  searchImplementations:toLazyKeysSpec(),
  searchNotes:toLazyKeysSpec(),
  searchOpenBuffers:toLazyKeysSpec(),
  searchReferences:toLazyKeysSpec(),
  searchTelescopePickers:toLazyKeysSpec(),
  spellCheck:toLazyKeysSpec(),
}

return Keymaps
