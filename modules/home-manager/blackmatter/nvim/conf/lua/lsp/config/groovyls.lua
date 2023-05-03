local M = {}

function M.setup(opts)
	local lsputils = require("lsp.utils")

	-- override groovyls
	local groovyls_opts = lsputils.merge(
		{},
		opts
	)

	-- enable groovyls
	require("lspconfig").groovyls.setup(groovyls_opts)
end

return M
