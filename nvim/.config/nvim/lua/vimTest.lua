local map = vim.keymap.set

vim.g['test#strategy'] = {
  nearest = 'neovim',
  suite = 'neovim',
  file = 'neovim'
}

map('n', '<leader>tt', '<CMD>TestFile<CR>')
map('n', '<leader>tT', '<CMD>TestFile -strategy=kitty<CR>')
map('n', '<leader>tn', '<CMD>TestNearest<CR>')
map('n', '<leader>tN', '<CMD>TestNearest -strategy=kitty<CR>')
map('n', '<leader>t.', '<CMD>TestLast<CR>')
map('n', '<leader>tv', '<CMD>TestVisit<CR>zz')
map('n', '<leader>ts', '<CMD>TestSuite<CR>')
map('n', '<leader>tS', '<CMD>TestSuite -strategy=kitty<CR>')

