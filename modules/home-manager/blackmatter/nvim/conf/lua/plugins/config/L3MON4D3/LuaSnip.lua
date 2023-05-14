local M = {}
function M.setup()
	local success, luasnip = pcall(require, 'luasnip')
	if success then
		luasnip.config.set_config {
			history = false,
			updateevents = 'TextChanged,TextChangedI',
		}
		-- do not use .load() it will be incredibly slow
		require("luasnip/loaders/from_vscode").lazy_load()
	end
end

return M
