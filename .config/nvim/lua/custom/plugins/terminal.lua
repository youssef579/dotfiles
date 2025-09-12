return {
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        size = 8,
        open_mapping = [[<c-t>]],
        direction = 'horizontal',
        autochdir = true,
        shade_terminals = false,
      }
    end,
  },
}
