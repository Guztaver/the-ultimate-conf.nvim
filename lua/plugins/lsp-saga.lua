return {
    'nvimdev/lspsaga.nvim',
    config = function()
        require('lspsaga').setup({
            lightbulb = {
                enable = false,
                enable_in_insert = false,
                sign = false,
                sign_priority = 40,
                virtual_text = false,
            },
            code_action = {
                num_shortcut = true,
                show_server_name = false,
                extend_gitsigns = true,
                keys = {
                    quit = "q",
                    exec = "<CR>",
                },
            },
            ui = {
                winblend = 10,
                border = 'rounded',
                colors = {
                    normal_bg = '#002b36'
                }
            },
        })
    end,
}
