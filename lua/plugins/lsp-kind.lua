return {
	"onsails/lspkind.nvim",
	config = function()
		require('lspkind').setup({
			mode = 'symbol_text',
			preset = 'codicons'
		})
	end
}
