local M = {}
function M.setup()
	require('luasnip').config.set_config {
		history = false,
		updateevents = 'TextChanged,TextChangedI',
	}
	-- off for now due to impact on performance
	-- require("luasnip/loaders/from_vscode").load()
end

return M
