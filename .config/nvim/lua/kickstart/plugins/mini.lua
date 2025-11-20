return {
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.ai').setup()
      require('mini.surround').setup()
      require('mini.trailspace').setup()
      require('mini.pairs').setup()
      require('mini.git').setup()
      require('mini.move').setup()
      require('mini.splitjoin').setup()
      require('mini.notify').setup {
        lsp_progress = { enable = false },
        window = { winblend = 0 },
      }

      -- Session manager
      local sessions = require 'mini.sessions'
      sessions.setup {
        autoread = true,
        verbose = { read = true, write = true, delete = true },
        file = '',
      }
      vim.keymap.set('n', '<leader>sm', sessions.select, { desc = 'Open [S]essions [M]' })
      vim.keymap.set('n', '<leader>sl', function()
        sessions.read(sessions.get_latest())
      end, { desc = 'Open [L]atest [S]ession' })

      -- Indentation scope
      local indentation_scope = require 'mini.indentscope'
      indentation_scope.setup {
        draw = {
          animation = indentation_scope.gen_animation.none(),
          delay = 0,
        },
      }

      -- File explorer
      local files = require 'mini.files'
      files.setup {}
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

      local miniclue = require 'mini.clue'
      miniclue.setup {
        triggers = {
          -- Leader triggers
          { mode = 'n', keys = '<Leader>' },
          { mode = 'x', keys = '<Leader>' },

          -- Built-in completion
          { mode = 'i', keys = '<C-x>' },

          -- `g` key
          { mode = 'n', keys = 'g' },
          { mode = 'x', keys = 'g' },

          -- Marks
          { mode = 'n', keys = "'" },
          { mode = 'n', keys = '`' },
          { mode = 'x', keys = "'" },
          { mode = 'x', keys = '`' },

          -- Registers
          { mode = 'n', keys = '"' },
          { mode = 'x', keys = '"' },
          { mode = 'i', keys = '<C-r>' },
          { mode = 'c', keys = '<C-r>' },

          -- Window commands
          { mode = 'n', keys = '<C-w>' },

          -- `z` key
          { mode = 'n', keys = 'z' },
          { mode = 'x', keys = 'z' },
        },

        clues = {
          -- Enhance this by adding descriptions for <Leader> mapping groups
          miniclue.gen_clues.builtin_completion(),
          miniclue.gen_clues.g(),
          miniclue.gen_clues.marks(),
          miniclue.gen_clues.registers(),
          miniclue.gen_clues.windows(),
          miniclue.gen_clues.z(),
        },
        delay = 300,
      }

      -- Status line
      local statusline = require 'mini.statusline'
      statusline.setup { use_icons = vim.g.have_nerd_font }

      ---@diagnostic disable-next-line: duplicate-set-field
      statusline.section_location = function()
        return '%l:%L% '
      end
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
