local M = {}
function M.setup()
	require("mason").setup()
	require("mason-lspconfig").setup(
		{
			ensure_installed = { "rust_analyzer" },
			automatic_installation = false
		}
	)
end

return M
