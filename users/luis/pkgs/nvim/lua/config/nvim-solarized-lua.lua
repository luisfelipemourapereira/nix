local M = {}

function M.setup()
	vim.cmd('syntax on')
	-- vim.g.nvcode_termcolors = 265
	-- default: 1
	-- vim.g.solarized_italics = 1
	-- default: normal
	-- possible: low | normal | high
	-- vim.g.solarized_visibility = 'normal'
	-- default: normal
	-- possible: low | normal | high
	-- vim.g.solarized_diffmode = 'normal'
	-- default: 0
	-- vim.g.solarized_termtrans = 0
	-- default: normal
	-- possible: low | flat | normal
	-- vim.g.solarized_statusline = 'normal'
	-- enable theme
	-- possible: light | dark
	-- vim.cmd('set background=dark')
	-- vim.cmd('set t_Co=16')
	-- vim.cmd('syntax enable')
	-- possible: solarized | solarized-high | solarized-flat | solarized-low
	-- vim.cmd('colorscheme solarized')
	-- vim.g.solarized_termcolors = 256
end

return M
