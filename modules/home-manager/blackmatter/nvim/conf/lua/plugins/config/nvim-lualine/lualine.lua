local M = {}
function M.setup()
	require("lualine").setup({
		options = {
			theme = "nord",
			icons_enabled = true,
		},
	})
end

return M
