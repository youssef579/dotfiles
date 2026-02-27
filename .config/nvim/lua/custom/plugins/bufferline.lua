return {
  'akinsho/bufferline.nvim',
  dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
  version = '*',
  config = function()
    local bufferline = require 'bufferline'
    require('mini.icons').mock_nvim_web_devicons()
    bufferline.setup {
      options = {
        style_preset = bufferline.style_preset.no_italic,
        separator_style = { '╎', '╎' },
        show_buffer_close_icons = false,
        indicator = {
          icon = ' ',
        },
        always_show_bufferline = false,
        diagnostics = 'nvim_lsp',
        tab_size = 5,
      },
    }

    vim.keymap.set('n', 'gb', bufferline.pick, { desc = 'Go to Buffer' })
    vim.keymap.set('n', 'gD', bufferline.close_with_pick, { desc = 'Delete Buffer' })
    vim.keymap.set('n', '<leader>bo', bufferline.close_others, { desc = 'Delete Others' })
    vim.keymap.set('n', '<leader>ba', '<cmd>bufdo bd<cr>', { desc = 'Delete All' })
    vim.keymap.set('n', '<leader>bl', '<cmd>BufferLineCloseLeft<cr>', { desc = 'Delete Left Buffers' })
    vim.keymap.set('n', '<leader>br', '<cmd>BufferLineCloseRight<cr>', { desc = 'Delete Right Buffers' })
  end,
}
