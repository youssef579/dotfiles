-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})

-- Save file
vim.keymap.set({ 'n', 'i' }, '<C-s>', '<cmd>w<cr>', { desc = 'Save file' })

-- Copy entire file to clipboard
vim.keymap.set('n', '<C-c>', ':%y+<CR>', { desc = 'Copy whole file' })

-- ShortCut for Wrapping
vim.keymap.set({ 'n', 'i', 'v' }, '<A-z>', function()
  vim.wo.wrap = not vim.wo.wrap
  print('Word Wrap: ' .. (vim.wo.wrap and 'ON' or 'OFF'))
end, { desc = 'Toggle Word Wrap' })

-- For moving without leaving insert mode
vim.keymap.set('i', '<C-l>', function()
  return vim.fn.pumvisible() == 1 and '<C-e>' or '<Right>'
end, { expr = true })
vim.keymap.set('i', '<C-h>', function()
  return vim.fn.pumvisible() == 1 and '<C-e>' or '<Left>'
end, { expr = true })

-- Buffer navigation
vim.keymap.set('n', '<leader>k', ':bnext<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>j', ':bprevious<CR>', { desc = 'Previous buffer' })

-- Buffer deletion
vim.keymap.set('n', '<leader>q', ':bd<CR>', { desc = 'Quit Buffer' })
-- vim: ts=2 sts=2 sw=2 et
