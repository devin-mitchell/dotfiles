local nvim_lsp = require("lspconfig")
local util = require("lspconfig/util")

local formattingGroup = vim.api.nvim_create_augroup("lspFormatting", {})

local on_attach = function(client, buffer_number)
	if client.name == "tsserver" then
		client.server_capabilities.documentFormattingProvider = false
	end

	local options = { buffer = buffer_number }

	vim.api.nvim_clear_autocmds({ group = formattingGroup, buffer = buffer_number })
	vim.api.nvim_create_autocmd("BufWritePre", {
		buffer = buffer_number,
		group = formattingGroup,
		callback = function()
			vim.lsp.buf.format()
		end,
	})

	vim.keymap.set("n", "<CR>", vim.lsp.buf.definition, options)
	vim.keymap.set("n", "<leader>ls", vim.lsp.buf.signature_help, options)
	vim.keymap.set("n", "<leader>lh", vim.lsp.buf.hover, options)
	vim.keymap.set("n", "<leader>ld", function()
		vim.diagnostic.open_float()
	end)

	print(vim.inspect(client.server_capabilities))
end

nvim_lsp.tsserver.setup({
	on_attach = on_attach,
})

nvim_lsp.pyright.setup({
	on_attach = on_attach,
})

require("null-ls").setup({
	on_attach = on_attach,
	sources = {
		require("null-ls").builtins.formatting.prettier,
		require("null-ls").builtins.diagnostics.eslint,
		require("null-ls").builtins.formatting.stylua,
	},
})

nvim_lsp.elixirls.setup({
	on_attach = on_attach,
	cmd = { "/Users/devinmitchell/.local/share/elixir-ls/rel/language_server.sh" },
})

nvim_lsp.gopls.setup({
	on_attach = on_attach,
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod" },
	root_dir = util.root_pattern("go.work", "go.mod", ".git"),
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
})
