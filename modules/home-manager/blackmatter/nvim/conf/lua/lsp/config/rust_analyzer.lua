local M = {}

function M.setup(opts)
	local lsputils = require("lsp.utils")

	-- override bashls
	local rust_analyzer_opts = lsputils.merge(
		{},
		opts
	)

	-- enable rust_analyzer
	require("lspconfig").rust_analyzer.setup(rust_analyzer_opts)
end

return M
