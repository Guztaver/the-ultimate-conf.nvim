local wk = require("which-key")
wk.setup({
	presets = {
		q = true,
	},
	key_labels = {
		["<Space>"] = "Space",
		["<Tab>"] = "Tab",
		["<CR>"] = "Enter",
	},
})

wk.register({
	["<tab>s"] = {
		g = {
			name = "tabs",
		},
	}
})
