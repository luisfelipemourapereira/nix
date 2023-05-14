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
		nls.builtins.code_actions.gitsigns,
		nls.builtins.code_actions.eslint_d,
		nls.builtins.code_actions.gitrebase,
		nls.builtins.code_actions.refactoring,
	}
	nls.setup({ sources = nlssources })
end

return M
