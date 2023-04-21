local M = {}
function M.setup()
	local nls = require("null-ls")
	local nlssources = {
		nls.builtins.formatting.black,
		nls.builtins.formatting.shfmt,
		nls.builtins.formatting.prettier,
		nls.builtins.formatting.terraform_fmt.with({
			filetypes = { 'terraform', 'tf', 'hcl' },
		}),
	}
	nls.setup({ sources = nlssources })
end

return M
