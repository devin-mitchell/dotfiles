local telescope = require 'telescope.builtin'

vim.keymap.set('n', '<leader><leader>', telescope.find_files)
vim.keymap.set('n', '<leader><bs>', telescope.buffers)
vim.keymap.set('n', '<leader>s', telescope.live_grep)

require('telescope').setup{
    defaults = {
      layout_config = {
        prompt_position = 'top',
      },
      prompt_prefix = ' :',
      sorting_strategy = 'ascending',
    },
    pickers = {
      find_files = {
        find_command = {'rg', '--files', '--hidden', '-g', '!.git'},
        layout_config = {
          height = 0.70
        }
      },
      buffers = {
        show_all_buffers = true
      },
      git_status = {
        git_icons = {
          added = " ",
          changed = " ",
          copied = " ",
          deleted = " ",
          renamed = "➡",
          unmerged = " ",
          untracked = " ",
        },
      }
  }
}
