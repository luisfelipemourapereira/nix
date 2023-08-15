local M = {}

function M.setup(opts)
	local lsputils = require("lsp.utils")

	-- override yaml-language-server
	local yaml_language_server_opts = lsputils.merge(
		{},
		opts
	)

	-- enable yaml-language-server
	require("lspconfig").yaml_language_server.setup(yaml_lanugage_server_opts)
end

return M
