local M = {}

function M.setup(opts)
	local lsputils = require("lsp.utils")

	-- override gopls
	local gopls_opts = lsputils.merge(
		{},
		opts
	)

	-- enable gopls
	require("lspconfig").bashls.setup(gopls_opts)
end

return M
