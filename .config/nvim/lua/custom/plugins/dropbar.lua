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
        bar = {
          enable = function(buf, win, _)
            buf = vim._resolve_bufnr(buf)
            if not vim.api.nvim_buf_is_valid(buf) or not vim.api.nvim_win_is_valid(win) then return false end

            -- Disable in floating windows, pre-existing winbars, or help buffers
            if vim.fn.win_gettype(win) ~= '' or vim.wo[win].winbar ~= '' or vim.bo[buf].ft == 'help' then return false end

            -- Disable for files larger than 1MB to prevent performance issues
            local stat = (vim.uv or vim.loop).fs_stat(vim.api.nvim_buf_get_name(buf))
            if stat and stat.size > 1024 * 1024 then return false end

            -- Enable for text files, along with the default supported sources
            return vim.bo[buf].ft == 'text'
              or vim.bo[buf].ft == 'markdown'
              or pcall(vim.treesitter.get_parser, buf)
              or not vim.tbl_isempty(vim.lsp.get_clients {
                bufnr = buf,
                method = 'textDocument/documentSymbol',
              })
          end,
        },
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
