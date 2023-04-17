local M = {}

function M.setup(opts)
	local lsputils = require("lsp.utils")

	-- override tsserver
	local tsserver_opts = lsputils.merge(
		{},
		opts
	)

	-- enable bashls
	require("lspconfig").tsserver.setup(tsserver_opts)
end

return M
