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

local M = {
	"BurntSushi/ripgrep",
	"echasnovski/mini.animate",
	"echasnovski/mini.surround",
	"morhetz/gruvbox",
	"neovim/nvim-lspconfig",
	"stevearc/conform.nvim",
	"williamboman/mason-lspconfig.nvim",
	"williamboman/mason.nvim",
	"nvim-treesitter/nvim-treesitter-textobjects",
	"folke/todo-comments.nvim",
	"andweeb/presence.nvim",
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	{ "nvim-treesitter/nvim-treesitter",          build = ":TSUpdate" },
	{ "nvim-telescope/telescope.nvim",            tag = "0.1.6",      dependencies = { "nvim-lua/plenary.nvim", "sharkdp/fd" } },
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" }
	},
	{ "akinsho/bufferline.nvim", requires = "nvim-tree/nvim-web-devicons" },
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

require("lazy").setup(M)
