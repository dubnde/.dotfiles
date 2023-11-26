return {
	{
		'folke/which-key.nvim',
		config = function()
			local wk = require 'which-key'
			wk.setup()
			wk.register {
				['<leader>'] = {
					f = { name = 'File' },
					b = { name = 'Buffer' },
					c = { name = 'Code' },
					d = { name = 'Delete/Close' },
					e = { name = 'Explorer' },
					q = { name = 'Quit' },
					s = { name = 'Search' },
					l = { name = '+LSP' },
					m = { name = '+Mason' },
					u = { name = 'UI' },
					g = { name = 'Git' },
				},
			}
		end,
	},
}
