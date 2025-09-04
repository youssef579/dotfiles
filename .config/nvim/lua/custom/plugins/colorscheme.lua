return {
  {
    'sainnhe/everforest',
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.everforest_background = 'hard'
      vim.g.everforest_disable_italic_comment = 1
      vim.g.everforest_transparent_background = 2
      vim.g.everforest_ui_contrast = 'high'
      vim.g.everforest_show_eob = 0
      vim.g.everforest_float_style = 'none'
      vim.g.everforest_current_word = 'grey background'

      vim.cmd.colorscheme 'everforest'
    end,
  },
}
