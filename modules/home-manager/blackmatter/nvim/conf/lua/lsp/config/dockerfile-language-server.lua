local M = {}

function M.setup(opts)
	local lsputils = require("lsp.utils")

	-- override dockerfile-language-server
	local dockerfile_language_server_opts = lsputils.merge(
		{},
		opts
	)

	-- enable dockerfile-language-server
	require("lspconfig").dockerfile_language_server.setup(
		dockerfile_language_server_opts
	)
end

return M
