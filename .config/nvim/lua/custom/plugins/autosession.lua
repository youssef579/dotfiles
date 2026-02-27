return {
  'rmagatti/auto-session',
  lazy = false,
  keys = {
    { '<leader>wr', '<cmd>AutoSession search<CR>', desc = 'Session search' },
    { '<leader>wd', '<cmd>AutoSession deletePicker<CR>', desc = 'Session delete' },
  },
  ---enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { '~/', '~/Projects', '~/Downloads', '/' },
  },
  config = function()
    require('auto-session').setup {
      auto_restore_last_session = true,
      auto_create = false,
      auto_delete_empty_sessions = false,
    }
  end,
}
