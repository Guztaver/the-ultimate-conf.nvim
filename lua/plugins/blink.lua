return {
	"saghen/blink.cmp",
	version = "1.*",
	opts = {
		completion = { documentation = { auto_show = true } },
		sources = {
			default = { 'lsp', 'path', 'snippets', 'buffer' },
		},
		opts_extend = { "sources.default" }
	},
}
