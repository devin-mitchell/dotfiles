-- This file can be loaded by calling `lua require('plugins')` from your init.vim
-- search

-- Only required if you have packer configured as `opt`
vim.cmd([[packadd packer.nvim]])

	return require("packer").startup(function()
  	-- Packer can manage itself
  	use("wbthomason/packer.nvim")

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

  use {
    'lewis6991/gitsigns.nvim',
    config = function() require('git') end, 
    -- tag = 'release' -- To use the latest release
  }

  use({
    'NTBBloodbath/galaxyline.nvim',
    branch = 'main',
    config = function()
      require("galaxyline.themes.eviline")
    end,
    requires = { 'kyazdani42/nvim-web-devicons', opt = true },
  })

	use({
		'elixir-editors/vim-elixir'
	})

	use({
		'mhinz/vim-mix-format'
	})

	use({
		'numToStr/FTerm.nvim'
	})

   use {
    'norcalli/nvim-colorizer.lua',
    config = function()
      require('colorizer').setup()
    end
  }

  use {
    'tpope/vim-fugitive',
    requires = {'tpope/vim-rhubarb'}
  }

  use {
    'hrsh7th/nvim-cmp',
    config = function() require('autoComplete') end,
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-buffer',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-cmdline',
      'hrsh7th/cmp-nvim-lua'
    }
  }

	-- THEMES
	use({
		"catppuccin/nvim",
		as = "catppuccin",
		config = function()
			vim.g.catppuccin_flavour = "mocha"
			vim.cmd([[colorscheme catppuccin]])
		end,
	})

	use({
		"folke/tokyonight.nvim",
		config = function()
			vim.g.tokyonight_style = "night"
			-- vim.cmd[[colorscheme tokyonight]]
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
