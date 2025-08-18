return {
    'AndreM222/copilot-lualine',
    config = function()
        local lualine = require("lualine")
        local diagnostics_message = require("components.diagnostics_message")
        lualine.setup({
            options = {
                icons_enabled = true,
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' },
                disabled_filetypes = {},
                always_divide_middle = true
            },
            sections = {
                lualine_a = { 'mode' },
                lualine_b = { 'branch', 'diff',
                    {
                        'diagnostics',
                        sources = { "nvim_diagnostic" },
                        symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' }
                    }
                },
                lualine_c = {
                    'filename',
                    {
                        diagnostics_message,
                        colors = {
                            error = "#BF616A",
                            warning = "#EBCB8B",
                            info = "#A3BE8C",
                            hint = "#88C0D0",
                        },
                    },
                },
                lualine_x = { 'copilot', 'encoding', 'fileformat', 'filetype' }, -- I added copilot here
                lualine_y = { 'progress' },
                lualine_z = { 'location' }
            },
            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { 'filename' },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            extensions = {}
        })
    end
}
