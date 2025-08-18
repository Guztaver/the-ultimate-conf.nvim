return {
    "jinzhongjia/LspUI.nvim",
    branch = "main",
    config = function()
        require("LspUI").setup({
            -- Disable lightbulb code action indicator
            code_action = {
                enable = true,
                command_enable = true,
                icon = "",
                keybind = {
                    exec = "<CR>",
                    prev = "k",
                    next = "j",
                    quit = "q",
                },
            },
            hover = {
                enable = true,
                command_enable = true,
                keybind = {
                    prev = "k",
                    next = "j",
                    quit = "q",
                },
            },
            rename = {
                enable = true,
                command_enable = true,
                auto_select = true,
                keybind = {
                    change = "<CR>",
                    quit = "<ESC>",
                },
            },
            diagnostic = {
                enable = true,
                command_enable = true,
                keybind = {
                    exec = "<CR>",
                    prev = "k",
                    next = "j",
                    quit = "q",
                },
            },
            -- Disable lightbulb and code action signs
            lightbulb = {
                enable = false,
            },
            code_action_lightbulb = {
                enable = false,
            },
        })
    end
}
