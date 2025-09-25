return {
  {
    'Pocco81/auto-save.nvim',
    config = function()
      local autosave = require 'auto-save'
      autosave.setup {
        execution_message = {
          message = function()
            return ''
          end,
          cleaning_interval = 0,
        },
      }
      vim.keymap.set('n', '<leader>a', autosave.toggle, { desc = 'Toggle [A]utosave' })
    end,
  },
}
