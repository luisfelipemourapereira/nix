local M = {}
function M.setup()
	require("neodev").setup({
		library = { plugins = { "nvim-dap-ui" }, types = true },
	})
end

return M
