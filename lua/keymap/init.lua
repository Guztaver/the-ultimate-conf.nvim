local M = {}

---A helper function to create a new keymap.
---@param opts table A table with keymap options.
---@param opts.desc string The description of the keymap.
---@param opts.command string The command or function to execute.
---@param opts.keys table|string A table containing the mode(s) and the key sequence.
---@param opts.options table Optional table for vim.keymap.set.
function M.add(opts)
	local modes, keys = unpack(opts.keys)
	if type(modes) == 'string' then
		modes = { modes }
	end

	local default_opts = { desc = opts.desc, noremap = true, silent = true }
	local final_opts = vim.tbl_deep_extend("force", default_opts, opts.options or {})

	vim.keymap.set(modes, keys, opts.command, final_opts)
end

return M
