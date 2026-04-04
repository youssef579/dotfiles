return {
  {
    'mfussenegger/nvim-lint',
    config = function()
      local lint = require 'lint'
      lint.linters_by_ft = {
        javascript = { 'eslint', 'eslint_d' },
        typescript = { 'eslint', 'eslint_d' },
        javascriptreact = { 'eslint', 'eslint_d' },
        typescriptreact = { 'eslint', 'eslint_d' },
      }

      vim.api.nvim_create_autocmd({ 'BufWritePost' }, {
        callback = function() require('lint').try_lint() end,
      })
    end,
  },
}
