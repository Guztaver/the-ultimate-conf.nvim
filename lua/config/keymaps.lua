local keymap = require("keymap.init")

keymap.add({
    desc = "Open NvimTree (Normal Mode)",
    command = ":NvimTreeToggle<CR>",
    keys = { "n", "<Tab>e" },
})

keymap.add({
    desc = "Open NvimTree (Insert Mode)",
    command = ":NvimTreeToggle<CR>",
    keys = { "i", "<Tab>e" },
})
