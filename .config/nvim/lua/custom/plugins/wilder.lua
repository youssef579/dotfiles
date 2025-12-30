return {
  {
    'gelguy/wilder.nvim',
    dependencies = {
      { 'romgrk/fzy-lua-native' },
    },
    config = function()
      local wilder = require 'wilder'
      wilder.setup {
        modes = { ':', '/', '?' },
        next_key = '<C-n>',
        previous_key = '<C-p>',
        accept_key = '<C-y>',
        reject_key = '<C-e>',
      }
      wilder.set_option(
        'renderer',
        wilder.popupmenu_renderer {
          highlighter = {
            wilder.lua_pcre2_highlighter(), -- requires `luarocks install pcre2`
            wilder.lua_fzy_highlighter(), -- requires fzy-lua-native vim plugin found
          },
          highlights = {
            accent = wilder.make_hl('WilderAccent', 'Pmenu', { { a = 1 }, { a = 1 }, { foreground = '#83c092' } }),
          },
        }
      )
    end,
  },
}
