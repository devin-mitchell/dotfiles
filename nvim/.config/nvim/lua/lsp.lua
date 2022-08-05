local nvim_lsp = require('lspconfig')

local on_attach = function(client, buffer_number)
  local options = {buffer = buffer_number}
  vim.api.nvim_create_autocmd('BufWritePre', { buffer = bufnr, callback = function() vim.lsp.buf.formatting_seq_sync() end })
  vim.keymap.set('n', '<CR>', vim.lsp.buf.definition, options)
  vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help, options)
  vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover, options)
  vim.keymap.set('n', '<leader>l=', vim.lsp.diagnostic.show_line_diagnostics, options)
end

nvim_lsp.tsserver.setup({on_attach = on_attach})
require("null-ls").setup({
  sources = {
      require("null-ls").builtins.formatting.prettier,
      require("null-ls").builtins.diagnostics.eslint, 
      require("null-ls").builtins.formatting.stylua
  },
})
