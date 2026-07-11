return {
  'pocco81/auto-save.nvim',
  config = function()
    require('auto-save').setup {
      enabled = true,
    }
    vim.api.nvim_set_keymap("n", "<leader>n", ":ASToggle<CR>", {})
  end,
}
