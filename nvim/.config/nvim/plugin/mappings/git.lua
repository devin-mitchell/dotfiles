local map = vim.keymap.set
local default_options = {noremap = true}

map('n', '<leader>gs', ':G<cr>', default_options)
map('n', '<leader>gb', ':Git blame<cr>', default_options)
map('n', '<leader>gl', ':Gclog<cr>', default_options)
map('n', '<leader>gh', ':0Gclog<cr>', default_options)
map('n', '<leader>gd', ':Gvdiffsplit<cr>', default_options)
map('n', '<leader>gO', '<CMD>Git difftool --name-only<CR>')
map('n', '<leader>go', '<CMD>Git difftool<CR>')
