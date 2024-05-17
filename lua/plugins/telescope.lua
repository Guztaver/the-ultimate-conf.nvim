require('telescope').setup({
	defaults = {
		generic_sorter = require('mini.fuzzy').get_telescope_sorter
	}
})
