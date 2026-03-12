local keymap = require("keymap.init")

keymap.add({
	desc = "Open NvimTree (Normal Mode)",
	command = ":NvimTreeClose<CR>",
	keys = { "n", "<Tab>r" },
})

keymap.add({
	desc = "Focus NvimTree",
	command = ":NvimTreeFocus<CR>",
	keys = { "n", "<Tab>e" },
})

keymap.add({
	desc = "Open NvimTree (Insert Mode)",
	command = ":NvimTreeToggle<CR>",
	keys = { "n", "<Tab>e" },
})

keymap.add({
	desc = "LSP Hover",
	command = ":LspUI hover<CR>",
	keys = { "n", "Ff" },
})

keymap.add({
	desc = "LSP Code Actions",
	command = ":LspUI code_action<CR>",
	keys = { "n", "Fa" },
})

keymap.add({
	desc = "LSP Hierarchy",
	command = ":LspUI call_hierarchy<CR>",
	keys = { "n", "Fh" },
})

keymap.add({
	desc = "LSP Diagnostic",
	command = ":LspUI diagnostic<CR>",
	keys = { "n", "Fd" },
})

keymap.add({
	desc = "LSP Rename",
	command = ":LspUI rename<CR>",
	keys = { "n", "R" },
})

keymap.add({
	desc = "LSP Reference",
	command = ":LspUI reference<CR>",
	keys = { "n", "Fr" },
})
