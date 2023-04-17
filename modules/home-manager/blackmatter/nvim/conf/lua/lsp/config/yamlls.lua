local M = {}

function M.setup(opts)
	local lsputils = require("lsp.utils")

	-- override bashls
	local yamlls_opts = lsputils.merge(
		{},
		opts
	)

	-- enable bashls
	require("lspconfig").bashls.setup(yamlls_opts)
end

return M
