require 'nvim-treesitter.configs'.setup{
  ensure_installed = {
    'javascript',
    'typescript',
    'css',
    'tsx',
    'lua',
    'elixir',
    'sql',
    'eex',
    'heex'
  },
  highlight = {
    enable = true,
    disable = {'elixir'}
  },
  playground = {
    enable = true,
  },
  textobjects = {
    select = {
      enable = true,
      keymaps = {
        -- You can use the capture groups defined in textobjects.scm
        ["ic"] = "@comment.inner",
        ["ac"] = "@comment.outer",
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["am"] = "@class.outer",
        ["im"] = "@class.inner",
        ["ib"] = "@block.inner",
        ["ab"] = "@block.outer"
      },
      lookahead = true,
    },
    move = {
      enable = true,

      --
      set_jumps = false,
      goto_next_start = {
        ["]]"] = "@function.outer",
      },
      goto_next_end = {
        ["]["] = "@function.outer",
      },
      goto_previous_start = {
        ["[["] = "@function.outer",
      },
      goto_previous_end = {
        ["[]"] = "@function.outer",
      },
    },
  },
}
