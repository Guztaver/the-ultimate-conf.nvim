local function map(mode, key, action, description)
	vim.api.nvim_set_keymap(mode, key, action, { noremap = true, silent = true, desc = description })
end

-- Tab control
map('n', '<Tab>l', ':Lazy<cr>', 'Lazy')
map('n', '<Tab>\'', ':%s/\'/"/g<CR>', 'Replace single quotes with double')
map('n', '<Tab>e', ':Oil<CR>', 'Oil')

map('n', '<Tab>qh', ':bprevious<CR>', 'Buffer previous')
map('n', '<Tab>ql', ':bnext<CR>', 'Buffer next')
map('n', '<Tab>qo', ':bnext<CR>', 'Buffer next')
map('n', '<Tab>qp', ':bnext<CR>', 'Buffer next')
map('n', '<Tab>qs', ':tab split<CR>', 'Tab split')
map('n', '<Tab>qd', ':tab close<CR>', 'Tab close')
map('n', '<Tab>qh', ':tab bprevious<CR>', 'Tab previous')
map('n', '<Tab>ql', ':tab bnext<CR>', 'Tab next')
map('n', '<Tab>qk', ':tab bnext<CR>', 'Tab next')

-- LSP related
map('n', 'gf', ':lua vim.lsp.buf.definition()<CR>', 'Go to definition')
map('n', '<Tab>ot', ':TroubleToggle<CR>', 'Trouble Toggle')
map('n', '<Tab>oa', ':Telescope diagnostic<CR>', 'Telescope diagnostic')
map('n', '<Tab>or', ':lua vim.lsp.buf.rename()<CR>', 'LSP rename')
map('n', '<Tab>oh', ':lua vim.lsp.buf.hover()<CR>', 'LSP hover')
map('n', '<Tab>oh', ':lua vim.lsp.buf.code_action()<CR>', 'LSP code action')
map('n', '<Tab>od', ':lua vim.diagnostic.open_float()<CR>', 'Diagnostic float')
map('n', '<Tab>op', ':lua vim.lsp.buf.document_symbol()<CR>', 'Document symbols')

-- Telescope
map('n', '<Tab>tc', ':Telescope <CR>', 'Telescope')
map('n', '<Tab>tr', ':Telescope resume<CR>', 'Telescope resume')
map('n', '<Tab>tbf', ':Telescope current_buffer_fuzzy_find<CR>', 'Telescope current buffer fuzzy finding')
map('n', '<Tab>tr', ':Telescope bufs<CR>', 'Telescope buffers')
map('n', '<Tab>t?', ':Telescope keymaps<CR>', 'Telescope keymaps')
map('n', '<Tab>td', ':TodoTelescope<CR>', 'Todo Telescope')

-- Other mappings
map('v', 'rn', ':vim.lsp.buf.rename()<CR>', 'LSP rename')
map('v', 'sr', ':sort()<CR>', 'Sort selected')
