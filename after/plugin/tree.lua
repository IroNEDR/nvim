local function attach_fn(bufnr)
    local api = require "nvim-tree.api"

    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end

    -- default mappings
    api.config.mappings.default_on_attach(bufnr)

    -- custom mappings
    vim.keymap.set('n', '<C-t>', api.tree.toggle)
    vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))

  end

  -- pass to setup along with your other options
  require("nvim-tree").setup {
    on_attach = attach_fn,
    view = { adaptive_size = true },
    update_focused_file = { enable = true }
  }
