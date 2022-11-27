local nvim_lsp = require('lspconfig')

local formattingGroup = vim.api.nvim_create_augroup('lspFormatting', {}) 

local on_attach = function(client, buffer_number)
  -- -- if (client.name == 'tsserver') then
  --   client.resolved_capabilities.document_formatting = false
  -- end

  local options = {buffer = buffer_number}

  vim.api.nvim_clear_autocmds({group = formattingGroup, buffer = buffer_number})
  vim.api.nvim_create_autocmd('BufWritePre', { 
    buffer = bufnr, 
    group = formattingGroup, 
    callback = function() vim.lsp.buf.format({
      filter = function(client) return client.name ~= 'tsserver' end 
    }) end
  })

  vim.keymap.set('n', '<CR>', vim.lsp.buf.definition, options)
  vim.keymap.set('n', '<leader>ls', vim.lsp.buf.signature_help, options)
  vim.keymap.set('n', '<leader>lh', vim.lsp.buf.hover, options)
  vim.keymap.set('n', '<leader>ld', function() vim.diagnostic.open_float() end)
 
  print(vim.inspect(client.server_capabilities))
end

nvim_lsp.tsserver.setup({
  on_attach = on_attach,
})

require("null-ls").setup({
  sources = {
      require("null-ls").builtins.formatting.prettier,
      require("null-ls").builtins.diagnostics.eslint, 
      require("null-ls").builtins.formatting.stylua
  },

})

nvim_lsp.elixirls.setup{
    on_attach = on_attach,
    cmd = { "/Users/devinmitchell/.local/share/elixir-ls/rel/language_server.sh" }
}


