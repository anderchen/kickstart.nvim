return {
  'stevearc/oil.nvim',
  ---@module 'oil'
  ---@type oil.SetupOpts
  opts = {
    default_file_explorer = true,
    float = { padding = 2, max_height = 0.5, max_width = 0.7, border = 'rounded', win_options = {
      winblend = 0,
    } },
    win_options = { wrap = true },
    view_options = { show_hidden = false },
    keymaps = { ['q'] = { 'actions.close', mode = 'n' } },
  },
  -- Optional dependencies
  dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
  -- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  -- Lazy loading is not recommended because it is very tricky to make it work correctly in all situations.
  lazy = false,
  vim.keymap.set('n', '-', '<CMD>Oil<CR>', { desc = 'Open parent directory' }),

  -- FIX: Preview not working properly. Work on/off
  vim.keymap.set('n', '<leader>oo', function()
    require('oil').open_float '.'
    vim.schedule(function()
      require('oil').open_preview()
    end)
  end, { desc = '[O]pen' }),
}

-- "<CMD>lua require('oil').toggle_float('.')<CR> <BAR> <CMD>lua require('oil').open_preview()<CR>"
