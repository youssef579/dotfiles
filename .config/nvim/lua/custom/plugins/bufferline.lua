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
        always_show_bufferline = false,
        indicator = {
          style = 'none',
        },
        diagnostics = 'nvim_lsp',
      },
    }
  end,
}
