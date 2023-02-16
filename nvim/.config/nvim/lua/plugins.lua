-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- search

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

return require("packer").startup(function()
	-- Packer can manage itself
	use("wbthomason/packer.nvim")

	use({
		"vim-test/vim-test",
		config = function()
			require("vimTest")
		end,
	})

	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/plenary.nvim" } },
		config = function()
			require("fuzzySearch")
		end,
	})

	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyazdani42/nvim-web-devicons", -- optional, for file icons
		},
		config = function()
			require("nvim-tree").setup()
		end,
		tag = "nightly", -- optional, updated every week. (see issue #1193)
	})

	use({
		"yamatsum/nvim-nonicons",
		after = { "nvim-tree.lua" },
		requires = { "kyazdani42/nvim-web-devicons" },
	})

	use({
		"neovim/nvim-lspconfig",
		requires = { "jose-elias-alvarez/null-ls.nvim" },
		config = function()
			require("lsp")
		end,
	})

	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("git")
		end,
		-- tag = 'release' -- To use the latest release
	})

	use({
		"NTBBloodbath/galaxyline.nvim",
		branch = "main",
		config = function()
			require("galaxyline.themes.eviline")
		end,
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})

	-- ELIXIR
	use({
		"elixir-editors/vim-elixir",
	})

	use({
		"mhinz/vim-mix-format",
	})

	use({
		"numToStr/FTerm.nvim",
	})

	use({
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end,
	})

	use({
		"folke/which-key.nvim",
		config = function()
			require("which-key").setup({
				-- your configuration comes here
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use({
		"tpope/vim-fugitive",
		requires = { "tpope/vim-rhubarb" },
	})

	use({
		"hrsh7th/nvim-cmp",
		config = function()
			require("autoComplete")
		end,
		requires = {
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lua",
		},
	})

	use("tpope/vim-commentary")

	use("tpope/vim-endwise")

	use("vyperlang/vim-vyper")

	use({
		"glacambre/firenvim",
		run = function()
			vim.fn["firenvim#install"](0)
		end,
	})

	use({
		"nvim-treesitter/nvim-treesitter",
		requires = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"nvim-treesitter/playground",
		},
		config = function()
			require("tree-sitter")
		end,
	})

	-- GOLANG
	use("fatih/vim-go") -- https://github.com/fatih/vim-go

	-- THEMES

	use({
		"Yazeed1s/oh-lucy.nvim",
		config = function()
			--	vim.cmd([[colorscheme oh-lucy-evening]])
		end,
	})

	use({
		"rafamadriz/neon",
		config = function()
			vim.g.neon_style = "doom"
			-- vim.cmd([[colorscheme neon]])
		end,
	})

	use({
		"Yazeed1s/minimal.nvim",
		config = function()
			-- vim.cmd([[colorscheme minimal]])
		end,
	})

	use({
		"navarasu/onedark.nvim",
		config = function()
			require("onedark").setup({
				style = "warmer",
			})
			vim.cmd([[colorscheme onedark]])
		end,
	})

	use({
		"rockerBOO/boo-colorscheme-nvim",
		config = function()
			-- vim.cmd([[colorscheme boo]])
		end,
	})

	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			vim.g.catppuccin_flavour = "mocha"
			--       vim.cmd([[colorscheme catppuccin]])
		end,
	})

	use({
		"folke/tokyonight.nvim",
		config = function()
			require("tokyonight").setup({
				style = "night",
			})
			--   vim.cmd[[colorscheme tokyonight]]
		end,
	})

	use({
		"challenger-deep-theme/vim",
		as = "challenger_deep",
		config = function()
			-- vim.cmd[[colorscheme challenger_deep]]
		end,
	})
end)
