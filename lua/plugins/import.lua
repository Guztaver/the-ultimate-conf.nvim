return {
	'piersolenski/import.nvim',
	dependencies = {
		'ibhagwan/fzf-lua',
	},
	opts = {
		picker = "telescope",
	},
	keys = {
		{
			"<leader>i",
			function()
				require("import").pick()
			end,
			desc = "Import",
		},
	},
}
