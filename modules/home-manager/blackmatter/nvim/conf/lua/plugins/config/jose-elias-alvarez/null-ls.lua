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
		nls.code_actions.gitsigns,
		nls.code_actions.eslint_d,
		nls.code_actions.gitrebase,
		nls.code_actions.refactoring,
	}
	nls.setup({ sources = nlssources })
end

return M
