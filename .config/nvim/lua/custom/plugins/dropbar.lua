return {
  {
    'Bekaboo/dropbar.nvim',
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim',
      'nvim-mini/mini.icons',
      build = 'make',
    },
    config = function()
      require('dropbar').setup {
        sources = {
          path = {
            max_depth = 4,
          },
          treesitter = {
            max_depth = 3,
          },
          lsp = {
            max_depth = 3,
          },
          markdown = {
            max_depth = 3,
          },
        },
      }
      -- local dropbar_api = require 'dropbar.api'
      -- vim.keymap.set('n', '<Leader>;', dropbar_api.pick, { desc = 'Pick symbols in winbar' })
      -- vim.keymap.set('n', '[;', dropbar_api.goto_context_start, { desc = 'Go to start of current context' })
      -- vim.keymap.set('n', '];', dropbar_api.select_next_context, { desc = 'Select next context' })
    end,
  },
}
