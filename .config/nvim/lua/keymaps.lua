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
vim.keymap.set({ 'n', 'i' }, '<C-s>', '<cmd>w<cr>', { desc = '[S]ave' })

-- Run
vim.keymap.set('n', '<leader>r', '<cmd>w<cr><cmd>!./build.fish<cr>', { desc = '[R]un porject', silent = true })

-- Copy entire file to clipboard
vim.keymap.set('n', '<leader>ya', ':%y+<CR>', { desc = '[Y]ank all', silent = true })

-- ShortCut for Wrapping
vim.keymap.set({ 'n', 'i', 'v' }, '<A-z>', function()
  vim.wo.wrap = not vim.wo.wrap
  print('Word Wrap: ' .. (vim.wo.wrap and 'ON' or 'OFF'))
end, { desc = 'Toggle Word Wrap' })

-- Buffer manipulation
vim.keymap.set('n', '<leader>k', '<cmd>bnext<cr>', { desc = 'Next buffer', silent = true })
vim.keymap.set('n', '<leader>j', '<cmd>bprevious<cr>', { desc = 'Previous buffer', silent = true })
vim.keymap.set('n', '<leader>d', '<cmd>bd<cr>', { desc = 'Delete buffer', silent = true })
vim.keymap.set('n', '<leader>ba', '<cmd>%bd<cr>', { desc = 'Delete all Buffers', silent = true })

-- For centering when Scrolling
vim.keymap.set('n', '<C-d>', '<C-d>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<C-u>', '<C-u>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<C-f>', '<C-f>zz', { noremap = true, silent = true })
vim.keymap.set('n', '<C-b>', '<C-b>zz', { noremap = true, silent = true })
-- vim: ts=2 sts=2 sw=2 et
