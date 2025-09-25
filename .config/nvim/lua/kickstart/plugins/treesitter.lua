return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs',
    opts = {
      ensure_installed = { 'markdown', 'cpp', 'c', 'python' },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    event = 'VeryLazy', -- load lazily
    config = function()
      require('treesitter-context').setup {
        enable = true, -- enable this plugin (can be disabled for large files later)
        max_lines = 3, -- maximum number of lines for the context window
        min_window_height = 0, -- minimum editor window height to enable context
        line_numbers = true,
        multiline_threshold = 20, -- max number of lines to collapse for context
        trim_scope = 'outer', -- which context lines to discard if max_lines is exceeded
        mode = 'cursor', -- "cursor" or "topline"
        separator = nil, -- you can set a line like "─" or "▃"
        zindex = 20, -- overlay priority
      }
    end,
  },
}
-- vim: ts=2 sts=2 sw=2 et
