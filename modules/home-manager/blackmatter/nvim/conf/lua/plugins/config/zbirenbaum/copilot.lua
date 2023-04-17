local M = {}
function M.setup()
	require("copilot").setup({
		suggestion = { enabled = false },
		panel = { enabled = false },
	})
end

return M
