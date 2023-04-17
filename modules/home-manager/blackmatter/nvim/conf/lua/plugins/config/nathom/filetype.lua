local M = {}
function M.setup()
	vim.g.did_load_filetypes = 1
	require("filetype").setup({
		overrides = {
			literal = {
				direnvrc = "sh";
				Berksfile = "ruby";
				Capfile = "ruby";
				Vagrantfile = "ruby";
				Clonefile = "ruby";
			},
		},
	})
end

return M
