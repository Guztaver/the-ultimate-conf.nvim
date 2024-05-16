local function map(mode, key, action)
	vim.api.nvim_set_keymap(mode, key, action, { noremap = true, silent = true })
end

map('n', '<Tab>l', ':lazy<cr>')
map('n', '<Tab>\'', ':%s/\'/"/g<CR>')
map('n', '<Tab>e', ':Oil<CR>')

--#region Tab control
map('n', '<Tab>qh', ':bprevious<CR>')
map('n', '<Tab>ql', ':bnext<CR>')
map('n', '<Tab>qo', ':bnext<CR>')
map('n', '<Tab>qp', ':bnext<CR>')
map('n', '<Tab>qs', ':tab split<CR>')
map('n', '<Tab>qd', ':tab close<CR>')
map('n', '<Tab>qh', ':tab bprevious<CR>')
map('n', '<Tab>ql', ':tab bnext<CR>')
map('n', '<Tab>qk', ':tab bnext<CR>')

--#endregion
-- #region LSP related
map('n', 'gf', ':lua vim.lsp.buf.definition()<CR>')
map('n', '<Tab>ot', ':TroubleToggle<CR>')
map('n', '<Tab>or', ':lua vim.lsp.buf.rename()<CR>')
map('n', '<Tab>oh', ':lua vim.lsp.buf.hover()<CR>')
map('n', '<Tab>oh', ':lua vim.lsp.buf.hover()<CR>')
map('n', '<Tab>oh', ':lua vim.lsp.buf.code_action()<CR>')
map('n', '<Tab>od', ':lua vim.diagnostic.open_float()<CR>')
map('n', '<Tab>op', ':lua vim.lsp.buf.document_symbol()<CR>')
-- #endregion

-- #region Telescope
map('n', '<Tab>tt', ':Telescope <CR>')
-- #endregion
