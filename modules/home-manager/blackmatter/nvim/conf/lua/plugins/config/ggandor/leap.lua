local M = {}
function M.setup()
	local success, leap = pcall(require, 'leap')
	if success then
		leap.set_default_keymaps()
		vim.cmd [[autocmd ColorScheme * lua require('leap').init_highlight(true)]]
	end
end

return M
