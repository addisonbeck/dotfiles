-- cool pickers to check out more later:
-- 1. vim_options
-- 2. commands
-- 3. command_history
-- 4. man_pages
-- 5. keymaps
-- 6. highlights
-- 7. autocommads

return {
  defaults = {
    layout_strategy = 'horizontal',
    layout_config = {
      horizontal = {
        height = 0.99,
        width = 0.99,
        preview_width = 0.65
      }
    },
    prompt_prefix = "🝖 ",
    entry_prefix = " - ",
    selection_caret = " - ",
    path_display = { "truncate" },
    dynamic_preview_title = true,
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" }
  },
  pickers = {
    find_files = {
      show_untracked = true,
      layout_strategy = "vertical",
      sorting_strategy = "ascending",
      layout_config = {
        width = 0.99,
        height = 0.99,
        mirror = true,
        prompt_position = "top",
        preview_height = 0.6,
      },
    },
    git_files = {
      show_untracked = true,
      layout_strategy = "vertical",
      sorting_strategy = "ascending",
      layout_config = {
        width = 0.99,
        height = 0.99,
        mirror = true,
        prompt_position = "top",
        preview_height = 0.6,
      },
    },
    builtin = {
      include_extensions = true,
    },
    planets = {
      show_pluto = true,
      show_moon = true,
    },
    buffers = {
      layout_strategy = "vertical",
      sorting_strategy = "ascending",
      ignore_current_buffer = false,
      bufnr_width = 0,
      sort_mru = true,
      path_display = { "smart" },
      layout_config = {
        width = 0.99,
        height = 0.99,
        mirror = true,
        prompt_position = "top",
        preview_height = 0.6,
      },
    },
    colorscheme = {
      enable_preview = true,
      layout_strategy = "bottom_pane",
    },
    spell_suggest = {
      layout_strategy = "vertical",
      results_title = "",
      prompt_title = "Autocorrect",
      sorting_strategy = "ascending",
      get_status_text = function() return "" end,
      layout_config = {
        height = 10,
        width = 60,
        prompt_position = "top"
      },
    },
    lsp_references = {
      layout_strategy = "vertical",
      include_current_line = true,
      sorting_strategy = "ascending",
      show_line = false,
      layout_config = {
        width = 0.99,
        height = 0.99,
        mirror = true,
        prompt_position = "top",
        preview_height = 0.6,
      },
    },
    lsp_definitions = {
      layout_strategy = "vertical",
      sorting_strategy = "ascending",
      show_line = false,
      layout_config = {
        width = 0.99,
        height = 0.99,
        mirror = true,
        prompt_position = "top",
        preview_height = 0.7,
      },
    },
    lsp_implementatations = {
      layout_strategy = "vertical",
      sorting_strategy = "ascending",
      show_line = false,
      layout_config = {
        width = 0.99,
        height = 0.99,
        mirror = true,
        prompt_position = "top",
        preview_height = 0.7,
      },
    },
    lsp_document_symbols = {
      layout_strategy = "vertical",
      sorting_strategy = "ascending",
      show_line = false,
      entry_prefix = "│ ",
      selection_caret = "│ ",
      symbol_width = 0.5,
      layout_config = {
        width = 0.99,
        height = 0.99,
        mirror = true,
        prompt_position = "top",
        preview_height = 0.5,
      },
    },
    diagnostics = {
      layout_strategy = "vertical",
      sorting_strategy = "ascending",
      show_line = false,
      entry_prefix = " ",
      selection_caret = " ",
      layout_config = {
        width = 0.99,
        height = 0.99,
        mirror = true,
        prompt_position = "top",
        preview_height = 0.5,
      },
    }
  },
  extensions = {
    file_browser = {
      layout_strategy = "vertical",
      git_status = false,
      path = "%:p:h",
      hidden = true,
      respect_gitignore = false,
      select_buffer = true,
      use_fd = false,
      prompt_path = true,
      display_stat = false,
      layout_config = {
        width = 0.99,
        height = 0.99,
        mirror = true,
        prompt_position = "top",
        preview_height = 0.5,
      },
    },
  },
}
