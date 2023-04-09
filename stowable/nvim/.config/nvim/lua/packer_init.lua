local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

vim.cmd([[
augroup packer_user_config
autocmd!
autocmd BufWritePost packer_init.lua source <afile> | PackerSync
augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "none" })
		end,
	},
	profile = {
		enable = true,
		threshold = 0,
	},
})

return packer.startup(function(use)
	use({
		"wbthomason/packer.nvim",
	})
	use({
		"nvim-lua/plenary.nvim",
	})
	use({
		"nvim-telescope/telescope.nvim",
	})
	use({
		"nvim-treesitter/nvim-treesitter",
	})
	use({
		"nvim-treesitter/nvim-treesitter-context",
	})
	use({
		"kyazdani42/nvim-tree.lua",
	})
	use({
		"windwp/nvim-autopairs",
	})
	use({
		"nvim-lualine/lualine.nvim",
	})
	use({
		"lukas-reineke/indent-blankline.nvim",
	})
	use({
		"neovim/nvim-lspconfig",
	})
	use({
		"williamboman/mason.nvim",
	})
	use({
		"williamboman/mason-lspconfig.nvim",
	})
	use({
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	})
	use({
		"hrsh7th/nvim-cmp",
	})
	use({
		"hrsh7th/cmp-nvim-lsp",
	})
	use({
		"hrsh7th/cmp-buffer",
	})
	use({
		"hrsh7th/cmp-path",
	})
	use({
		"saadparwaiz1/cmp_luasnip",
	})
	use({
		"hrsh7th/cmp-nvim-lsp-signature-help",
	})
	use({
		"hrsh7th/cmp-nvim-lua",
	})
	use({
		"hrsh7th/cmp-emoji",
	})
	use({
		"hrsh7th/cmp-cmdline",
	})
	use({
		"L3MON4D3/LuaSnip",
	})
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
		ft = { "markdown" },
		cmd = { "MarkdownPreview" },
	})
	use({
		"lewis6991/impatient.nvim",
	})
	use({
		"numToStr/Comment.nvim",
	})
	use({
		"NTBBloodbath/rest.nvim",
	})
	use({
		"onsails/lspkind.nvim",
	})
	use({
		"akinsho/toggleterm.nvim",
	})
	use({
		"kyazdani42/nvim-web-devicons",
	})
	use({
		"mhartington/formatter.nvim",
	})
	use({
		"kylechui/nvim-surround",
	})
	use({
		"windwp/nvim-ts-autotag",
	})
	use({
		"lewis6991/gitsigns.nvim",
	})
	use({
		"j-hui/fidget.nvim",
	})
	use({
		"aurum77/live-server.nvim",
		run = function()
			require("live_server.util").install()
		end,
	})
	-- use({
	-- 	"$HOME/code/lua/live-server.nvim",
	-- 	run = function()
	-- 		require("live_server.util").install()
	-- 	end,
	-- })
	use({
		"norcalli/nvim-colorizer.lua",
	})
	use({
		"ThePrimeagen/vim-be-good",
	})
	use({
		"uga-rosa/ccc.nvim",
	})
	use({
		"folke/trouble.nvim",
	})
	use({
		"stevearc/dressing.nvim",
	})
	use({
		"ellisonleao/gruvbox.nvim",
	})
	use({
		"chrishrb/gx.nvim",
	})
	use({
		"$HOME/code/lua/dotnet.nvim",
	})
	use({
		"folke/neodev.nvim",
	})

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
