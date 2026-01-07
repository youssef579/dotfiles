return {
  {
    'echasnovski/mini.nvim',
    dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
    config = function()
      require('mini.ai').setup()
      require('mini.surround').setup()
      require('mini.trailspace').setup()
      require('mini.pairs').setup()
      require('mini.git').setup()
      require('mini.splitjoin').setup()

      -- Session manager
      local sessions = require 'mini.sessions'
      sessions.setup {
        autoread = true,
        verbose = { read = true, write = true, delete = true },
        file = '',
      }
      vim.keymap.set('n', '<leader>sm', sessions.select, { desc = '[S]ession [M]anager' })

      -- File explorer
      local files = require 'mini.files'
      files.setup {
        windows = {
          preview = true,
        },
      }
      vim.keymap.set('n', '<leader>e', function()
        if not MiniFiles.close() then
          MiniFiles.open()
        end
      end, { desc = 'Open [E]xplorer' })

      -- Snippets per language
      local gen_loader = require('mini.snippets').gen_loader
      require('mini.snippets').setup {
        snippets = {
          gen_loader.from_lang(),
        },
        mappings = {
          expand = '<C-y>',
          stop = '<C-e>',
        },
      }

      -- Status line
      -- local statusline = require 'mini.statusline'
      -- statusline.setup { use_icons = vim.g.have_nerd_font }
      --
      -- ---@diagnostic disable-next-line: duplicate-set-field
      -- statusline.section_location = function()
      --   return '%l:%L% '
      -- end
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
