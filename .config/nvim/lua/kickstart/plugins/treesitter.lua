return {
  { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    main = 'nvim-treesitter.configs', -- Sets main module to use for opts
    -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
    opts = {
      ensure_installed = { 'bash', 'c', 'diff', 'html', 'lua', 'luadoc', 'markdown', 'markdown_inline', 'query', 'vim', 'vimdoc' },
      -- Autoinstall languages that are not installed
      auto_install = true,
      highlight = {
        enable = true,
        -- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
        --  If you are experiencing weird indenting issues, add the language to
        --  the list of additional_vim_regex_highlighting and disabled languages for indent.
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
    },
    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
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
