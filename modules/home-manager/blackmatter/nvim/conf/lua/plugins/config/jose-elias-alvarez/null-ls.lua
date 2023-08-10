local M = {}

function M.setup()
	local nls = require("null-ls")

	local nlssources = {
		nls.builtins.formatting.black,
		nls.builtins.formatting.prettier,
		-- nls.builtins.formatting.rubocop,
		nls.builtins.code_actions.gitsigns,
		nls.builtins.code_actions.eslint_d,
		nls.builtins.code_actions.gitrebase,
		nls.builtins.code_actions.refactoring,
		nls.builtins.formatting.terraform_fmt.with({
			filetypes = { "terraform", "tf", "hcl" },
		}),
		-- nls.builtins.diagnostics.shellcheck.with({
		-- 	extra_args = { "--format=json" },
		-- 	diagnostics_format = "#{message}",
		-- }),
		nls.builtins.formatting.shfmt.with({
			extra_args = { "-i", "2", "-sr" },
		}),
	}

	nls.setup({ sources = nlssources })
end

return M
