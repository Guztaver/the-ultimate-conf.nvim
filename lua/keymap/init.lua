local M = {}

---A helper function to create a new keymap.
---@param opts {desc: string, command: string|function, keys: table, options?: table} A table with keymap options.
function M.add(opts)
    local modes, keys = table.unpack(opts.keys)
    if type(modes) == 'string' then
        modes = { modes }
    end

    local default_opts = { desc = opts.desc, noremap = true, silent = true }
    local final_opts = vim.tbl_deep_extend("force", default_opts, opts.options or {})

    vim.keymap.set(modes, keys, opts.command, final_opts)
end

return M
