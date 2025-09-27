return {
  {
    'echasnovski/mini.nvim',
    config = function()
      require('mini.surround').setup()
      require('mini.trailspace').setup()
      require('mini.pairs').setup()
      require('mini.git').setup()
      require('mini.move').setup()
      require('mini.notify').setup {
        lsp_progress = {
          enable = false,
        },
        window = {
          winblend = 0,
        },
      }

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

      -- Buffer tabs
      require('mini.tabline').setup {
        show_icons = vim.g.have_nerd_font,
      }

      vim.api.nvim_create_autocmd('BufEnter', {
        callback = vim.schedule_wrap(function()
          local n_listed_bufs = 0
          for _, buf_id in ipairs(vim.api.nvim_list_bufs()) do
            if vim.fn.buflisted(buf_id) == 1 then
              n_listed_bufs = n_listed_bufs + 1
            end
          end

          vim.o.showtabline = n_listed_bufs > 1 and 2 or 0
        end),
        desc = 'Update tabline based on the number of listed buffers',
      })

      vim.api.nvim_set_hl(0, 'MiniTablineCurrent', { bg = '#a7c080', fg = '#141b1e' })
      vim.api.nvim_set_hl(0, 'MiniTablineHidden', { bg = '#2b3339', fg = '#7a8478' })
      vim.api.nvim_set_hl(0, 'MiniTablineModifiedCurrent', { bg = '#a7c080', fg = '#141b1e', bold = true })
      vim.api.nvim_set_hl(0, 'MiniTablineModifiedHidden', { bg = '#2b3339', fg = '#7a8478', bold = true })

      -- Dashboard
      local starter = require 'mini.starter'
      starter.setup {
        items = {
          starter.sections.sessions(5, true),
          starter.sections.recent_files(5, true),
          starter.sections.recent_files(5, false),
          starter.sections.builtin_actions(),
        },
        content_hooks = {
          starter.gen_hook.adding_bullet '  ',
          starter.gen_hook.indexing('all', { 'Builtin actions' }),
          starter.gen_hook.aligning('center', 'center'),
        },
        footer = '',
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
