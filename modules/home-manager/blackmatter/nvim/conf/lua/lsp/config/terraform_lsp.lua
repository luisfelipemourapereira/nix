local M = {}

function M.setup(opts)
	local lsputils = require("lsp.utils")

	-- override terraform_lsp
	local terraform_lsp_opts = lsputils.merge(
		{},
		opts
	)

	-- enable bashls
	require("lspconfig").terraform_lsp.setup(terraform_lsp_opts)
end

return M
