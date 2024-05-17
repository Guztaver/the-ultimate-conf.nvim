local clue = require('mini.clue')
local comment = require('mini.comment')
local hipatterns = require('mini.hipatterns')
local jump = require('mini.jump')
local tabline = require('mini.tabline')

require('mini.fuzzy').setup()
require('mini.indentscope').setup()
require('mini.pairs').setup()
require('mini.starter').setup()

clue.setup({
	triggers = {
		{ mode = 'n', keys = '<Tab>' },
		{ mode = 'n', keys = '<Leader>' },
		{ mode = 'x', keys = '<Leader>' },
		{ mode = 'i', keys = '<C-x>' },
		{ mode = 'n', keys = 'g' },
		{ mode = 'x', keys = 'g' },
		{ mode = 'n', keys = "'" },
		{ mode = 'n', keys = '`' },
		{ mode = 'x', keys = "'" },
		{ mode = 'x', keys = '`' },
		{ mode = 'n', keys = '"' },
		{ mode = 'x', keys = '"' },
		{ mode = 'i', keys = '<C-r>' },
		{ mode = 'c', keys = '<C-r>' },
		{ mode = 'n', keys = '<C-w>' },
		{ mode = 'n', keys = 'z' },
		{ mode = 'x', keys = 'z' },
	},

	clues = {
		clue.gen_clues.builtin_completion(),
		clue.gen_clues.g(),
		clue.gen_clues.marks(),
		clue.gen_clues.registers(),
		clue.gen_clues.windows(),
		clue.gen_clues.z(),

		-- Custom clues
		{ mode = 'n', keys = '<Tab>',  desc = 'Tab mappings' },
		{ mode = 'n', keys = '<Tab>q', desc = 'Tabs' },
		{ mode = 'n', keys = '<Tab>o', desc = 'LSP' },
		{ mode = 'n', keys = '<Tab>t', desc = 'Telescope' },
	},
})

comment.setup({
	mappings = {
		comment = '<Tab>/',
		comment_line = ';;',
		comment_visual = ';;',
		textobject = 'g;',
	}
})

hipatterns.setup({
	highlighters = {
		-- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
		fixme     = { pattern = '%f[%w]()FIXME()%f[%W]', group = 'MiniHipatternsFixme' },
		hack      = { pattern = '%f[%w]()HACK()%f[%W]', group = 'MiniHipatternsHack' },
		todo      = { pattern = '%f[%w]()TODO()%f[%W]', group = 'MiniHipatternsTodo' },
		note      = { pattern = '%f[%w]()NOTE()%f[%W]', group = 'MiniHipatternsNote' },

		-- Highlight hex color strings (`#rrggbb`) using that color
		hex_color = hipatterns.gen_highlighter.hex_color(),
	},
})

jump.setup(
	{
		mappings = {
			forward = '<Tab>jf',
			backward = '<Tab>jF',
			forward_till = '<Tab>jt',
			backward_till = '<Tab>jT',
			repeat_jump = '<Tab>j;',
		},
	}
)

tabline.setup(
	{
		show_icons = true,
		set_vim_settings = true,
		tabpage_section = 'left',
	}
)
