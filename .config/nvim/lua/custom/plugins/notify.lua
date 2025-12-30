return {
  {
    'rcarriga/nvim-notify',
    config = function()
      vim.notify = require 'notify'
      vim.notify.setup { max_width = 45, render = 'wrapped-default' }
    end,
  },
}
