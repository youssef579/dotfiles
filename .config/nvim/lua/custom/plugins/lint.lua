return {
  'mfussenegger/nvim-lint',
  config = function()
    local lint = require 'lint'

    lint.linters_by_ft = {
      -- cpp = { 'cpplint' },
      -- c = { 'cpplint' },
    }

    vim.api.nvim_create_autocmd({ 'BufWritePost', 'BufReadPost' }, {
      callback = function()
        lint.try_lint()
      end,
    })
  end,
}
