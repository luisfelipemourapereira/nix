local M = {}

function M.setup()
	require("lualine").setup({
		options = {
			theme = "nord",
			icons_enabled = false,
		},
	})
end

return M
