vim.opt.termguicolors = true
vim.cmd('set rnu')
vim.o.timeout = true
vim.o.timeoutlen = 300

for _, file in ipairs(vim.fn.readdir(vim.fn.stdpath('config') .. '/lua/plugins', [[v:val =~ '\.lua$']])) do
	require('plugins.' .. file:gsub('%.lua$', ''))
end
require("keys")
vim.cmd('colorscheme gruvbox')
