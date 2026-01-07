return {
  'akinsho/bufferline.nvim',
  version = '*',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    local bufferline = require 'bufferline'
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
  end,
}
