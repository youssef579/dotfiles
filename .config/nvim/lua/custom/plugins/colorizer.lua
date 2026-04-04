return {
  {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup {
        'html',
        'css',
        'sass',
        'javascript',
        'typescript',
        'javascriptreact',
        'typescriptreact',
      }
    end,
  },
}
