local M = {}
function M.setup()
	require('luasnip').config.set_config {
		history = false,
		updateevents = 'TextChanged,TextChangedI',
	}
	require("luasnip/loaders/from_vscode").lazy_load()
end

return M
