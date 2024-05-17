local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	"BurntSushi/ripgrep",
	"L3MON4D3/LuaSnip",
	"andweeb/presence.nvim",
	"folke/todo-comments.nvim",
	"morhetz/gruvbox",
	"neovim/nvim-lspconfig",
	"nvim-treesitter/nvim-treesitter-textobjects",
	"stevearc/conform.nvim",
	"stevearc/oil.nvim",
	"williamboman/mason-lspconfig.nvim",
	"williamboman/mason.nvim",
	{ 'echasnovski/mini.nvim',           version = '*' },
	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
		lazy = false,
	},
	{
		"hrsh7th/nvim-cmp",
		dependencies = { "onsails/lspkind.nvim", "hrsh7th/cmp-nvim-lsp", "hrsh7th/cmp-buffer", "hrsh7th/cmp-path", "hrsh7th/cmp-cmdline", "hrsh7th/nvim-cmp", "L3MON4D3/LuaSnip", "saadparwaiz1/cmp_luasnip" },

	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
	{ "nvim-telescope/telescope.nvim",   tag = "0.1.6",      dependencies = { "nvim-lua/plenary.nvim", "sharkdp/fd" } },
	-- { "akinsho/bufferline.nvim",         requires = "nvim-tree/nvim-web-devicons" },
	{
		'nvim-lualine/lualine.nvim',
		dependencies = { 'nvim-tree/nvim-web-devicons' }
	},
	{
		"stevearc/dressing.nvim",
		opts = {},
	},
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
		},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		}
	},
	{
		"folke/persistence.nvim",
		event = "BufReadPre",
	}

}

require("lazy").setup(plugins)
