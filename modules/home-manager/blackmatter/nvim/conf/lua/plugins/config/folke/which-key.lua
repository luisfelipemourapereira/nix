local M = {}
function M.setup()
	local wk = require('which-key')

	local conf = {
		triggers = "auto",
		window = {
			border = "single",
			position = "bottom",
		}
	}

	local opts = {
		mode = "n",
		prefix = "<leader>",
		buffer = nil,
		silent = true,
		noremap = true,
		nowait = false,
	}

	local leader_mappings = {
		["t"] = { "<cmd>Telescope find_files<CR>", "Find" },
		["w"] = { "<cmd>update!<CR>", "Save" },
		["q"] = { "<cmd>q!<CR>", "Quit" },

		b = {
			name = "Buffer",
			c = "Buffer",
		},
	}

	local non_leader_opts = {
		mode = "n",
		silent = true,
		noremap = true
	}

	local non_leader_mappings = {
		["ff"] = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format" },
	}

	wk.setup(conf)
	wk.register(leader_mappings, opts)
	wk.register(non_leader_mappings, non_leader_opts)
end

return M
