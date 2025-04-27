local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	{
		"ellisonleao/gruvbox.nvim",
		config = function()
			vim.cmd.colorscheme("gruvbox")
			require("core.theme")
		end,
		lazy = false,
	},
	{
		"nvim-telescope/telescope.nvim",
		config = function()
			require("plugins.telescope")
		end,
		cmd = "Telescope",
	},
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("plugins.nvim-treesitter")
		end,
		dependencies = {
			"windwp/nvim-ts-autotag",
			{
				"nvim-treesitter/nvim-treesitter-context",
				config = function()
					require("plugins.treesitter-context")
				end,
			},
		},
		event = "BufEnter",
	},
	{
		"kyazdani42/nvim-tree.lua",
		config = function()
			require("plugins.nvim-tree")
		end,
	},
	{
		"windwp/nvim-autopairs",
		config = function()
			require("plugins.nvim-autopairs")
		end,
		event = "InsertEnter",
	},
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("plugins.lualine")
		end,
	},
	{
		"williamboman/mason.nvim",
		config = function()
			require("plugins.mason")
			require("plugins.lspconfig")
		end,
		dependencies = {
			{
				"williamboman/mason-lspconfig.nvim",
				config = function()
					require("plugins.mason-lspconfig")
				end,
			},
			{
				"neovim/nvim-lspconfig",
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		config = function()
			require("plugins.mason-tool-installer")
		end,
	},
	{
		"hrsh7th/nvim-cmp",
		config = function()
			require("plugins.nvim-cmp")
		end,
		event = { "InsertEnter", "CmdlineEnter" },
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"saadparwaiz1/cmp_luasnip",
			"hrsh7th/cmp-nvim-lsp-signature-help",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-emoji",
			"hrsh7th/cmp-cmdline",
			{
				"L3MON4D3/LuaSnip",
				config = function()
					require("plugins.luasnip")
				end,
				event = "InsertEnter",
				dependencies = { "rafamadriz/friendly-snippets" },
			},
		},
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("plugins.comment")
		end,
		event = "LspAttach",
	},
	{
		"onsails/lspkind.nvim",
	},
	{
		"akinsho/toggleterm.nvim",
		config = function()
			require("plugins.toggleterm")
		end,
		cmd = "ToggleTerm",
	},
	{
		"kyazdani42/nvim-web-devicons",
		config = function()
			require("plugins.nvim-web-devicons")
		end,
	},
	{
		"mhartington/formatter.nvim",
		config = function()
			require("plugins.formatter")
		end,
		cmd = "Format",
	},
	{
		"kylechui/nvim-surround",
		config = function()
			require("plugins.nvim-surround")
		end,
	},
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("plugins.gitsigns")
		end,
	},
	{
		"aurum77/live-server.nvim",
		config = function()
			require("plugins.live-server")
		end,
		cmd = {
			"LiveServer",
			"LiveServerStart",
			"LiveServerStop",
			"LiveServerInstall",
		},
		build = function()
			require("live_server.util").install()
		end,
	},
	{
		"norcalli/nvim-colorizer.lua",
		ft = { "css", "html", "javascript", "javascriptreact", "typescript", "typescriptreact" },
	},
	{
		"ThePrimeagen/vim-be-good",
		cmd = "VimBeGood",
	},
	{
		"folke/trouble.nvim",
		config = function()
			require("plugins.trouble")
		end,
		event = "LspAttach",
	},
	{
		"stevearc/dressing.nvim",
		config = function()
			require("plugins.dressing")
		end,
		event = "VeryLazy",
	},
	{
		"chrishrb/gx.nvim",
		config = function()
			require("plugins.gx")
		end,
	},
	{
		"folke/neodev.nvim",
		config = function()
			require("plugins.neodev")
		end,
		ft = "lua",
	},
	{
		"Wansmer/symbol-usage.nvim",
		event = "BufReadPre", -- need run before LspAttach if you use nvim 0.9. On 0.10 use 'LspAttach'
		config = function()
			require("plugins.symbol_usage")
		end,
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		config = function()
			require("plugins.ibl")
		end,
		main = "ibl",
	},
	{
		"NeogitOrg/neogit",
		tag = "v1.0.0",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"sindrets/diffview.nvim",
			"nvim-telescope/telescope.nvim",
		},
		config = true,
	},
	{
		"luckasRanarison/tailwind-tools.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
}, {
	install = {
		colorscheme = { "gruvbox" },
	},
	ui = {
		border = "single",
	},
})
