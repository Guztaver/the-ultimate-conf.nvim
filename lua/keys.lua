local wk = require("which-key");
local function map(mode, key, action)
	vim.api.nvim_set_keymap(mode, key, action, { noremap = true, silent = true })
end

wk.register({ q = { name = "Tabs", }, }, { prefix = "<tab>" })
wk.register({ o = { name = "LSP", }, }, { prefix = "<tab>" })
wk.register({ t = { name = "Telescope", }, }, { prefix = "<tab>" })

map('n', '<Tab>l', ':Lazy<cr>')
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
--#region LSP related
map('n', 'gf', ':lua vim.lsp.buf.definition()<CR>')
map('n', '<Tab>ot', ':TroubleToggle<CR>')
map('n', '<Tab>oa', ':Telescope diagnostic<CR>')
map('n', '<Tab>or', ':lua vim.lsp.buf.rename()<CR>')
map('n', '<Tab>oh', ':lua vim.lsp.buf.hover()<CR>')
map('n', '<Tab>oh', ':lua vim.lsp.buf.code_action()<CR>')
map('n', '<Tab>od', ':lua vim.diagnostic.open_float()<CR>')
map('n', '<Tab>op', ':lua vim.lsp.buf.document_symbol()<CR>')
-- #endregion

--#region Telescope
map('n', '<Tab>tr', ':Telescope resume<CR>')
map('n', '<Tab>tc', ':Telescope <CR>')
map('n', '<Tab>tr', ':Telescope bufs<CR>')
map('n', '<Tab>t?', ':Telescope keymaps<CR>')
map('n', '<Tab>td', ':TodoTelescope<CR>')

-- #endregion
