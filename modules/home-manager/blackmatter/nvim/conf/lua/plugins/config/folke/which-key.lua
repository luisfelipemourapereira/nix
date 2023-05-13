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

	local leader_opts = {
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

	local dap_mappings = {
		d = {
			name = "Debug",
			R = { "<cmd>lua require'dap'.run_to_cursor()<cr>", "Run to Cursor" },
			E = { "<cmd>lua require'dap'.eval(vim.fn.input '[Expression] > ')<cr>", "Evaluate Input" },
			C = { "<cmd>lua require'dap'.set_breakpoint(vim.fn.input '[Condition] > ')<cr>", "Conditional Breakpoint" },
			U = { "<cmd>lua require'dapui'.toggle()<cr>", "Toggle UI" },
			b = { "<cmd>lua require'dap'.step_back()<cr>", "Step Back" },
			c = { "<cmd>lua require'dap'.continue()<cr>", "Continue" },
			d = { "<cmd>lua require'dap'.disconnect()<cr>", "Disconnect" },
			e = { "<cmd>lua require'dapui'.eval()<cr>", "Evaluate" },
			g = { "<cmd>lua require'dap'.session()<cr>", "Get Session" },
			h = { "<cmd>lua require'dap.ui.widgets'.hover()<cr>", "Hover Variables" },
			S = { "<cmd>lua require'dap.ui.widgets'.scopes()<cr>", "Scopes" },
			i = { "<cmd>lua require'dap'.step_into()<cr>", "Step Into" },
			o = { "<cmd>lua require'dap'.step_over()<cr>", "Step Over" },
			p = { "<cmd>lua require'dap'.pause.toggle()<cr>", "Pause" },
			q = { "<cmd>lua require'dap'.close()<cr>", "Quit" },
			r = { "<cmd>lua require'dap'.repl.toggle()<cr>", "Toggle Repl" },
			s = { "<cmd>lua require'dap'.continue()<cr>", "Start" },
			t = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "Toggle Breakpoint" },
			x = { "<cmd>lua require'dap'.terminate()<cr>", "Terminate" },
			u = { "<cmd>lua require'dap'.step_out()<cr>", "Step Out" },
		},
	}

	-- TODO: consider removing with enough neotest experience
	-- local ulttest_testing_mappings = {
	-- 	name = "Test",
	-- 	S = { "<cmd>UltestSummary<cr>", "Summary" },
	-- 	a = { "<cmd>Ultest<cr>", "All" },
	-- 	d = { "<cmd>UltestDebug<cr>", "Debug" },
	-- 	f = { "<cmd>TestFile<cr>", "File" },
	-- 	l = { "<cmd>TestLast<cr>", "Last" },
	-- 	n = { "<cmd>TestNearest<cr>", "Nearest" },
	-- 	o = { "<cmd>UltestOutput<cr>", "Output" },
	-- 	s = { "<cmd>TestSuite<cr>", "Suite" },
	-- 	v = { "<cmd>TestVisit<cr>", "Visit" },
	-- }

	local neotest_testing_mappings = {
		n = {
			name = "Neotest",
			a = { "<cmd>lua require('neotest').run.attach()<cr>", "Attach" },
			f = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", "Run File" },
			F = { "<cmd>lua require('neotest').run.run({vim.fn.expand('%'), strategy = 'dap'})<cr>", "Debug File" },
			l = { "<cmd>lua require('neotest').run.run_last()<cr>", "Run Last" },
			L = { "<cmd>lua require('neotest').run.run_last({ strategy = 'dap' })<cr>", "Debug Last" },
			n = { "<cmd>lua require('neotest').run.run()<cr>", "Run Nearest" },
			N = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", "Debug Nearest" },
			o = { "<cmd>lua require('neotest').output.open({ enter = true })<cr>", "Output" },
			S = { "<cmd>lua require('neotest').run.stop()<cr>", "Stop" },
			s = { "<cmd>lua require('neotest').summary.toggle()<cr>", "Summary" },
		},
	}

	local overseer_mappings = {
		o = {
			name = "Overseer",
			C = { "<cmd>OverseerClose<cr>", "OverseerClose" },
			a = { "<cmd>OverseerTaskAction<cr>", "OverseerTaskAction" },
			b = { "<cmd>OverseerBuild<cr>", "OverseerBuild" },
			c = { "<cmd>OverseerRunCmd<cr>", "OverseerRunCmd" },
			d = { "<cmd>OverseerDeleteBundle<cr>", "OverseerDeleteBundle" },
			l = { "<cmd>OverseerLoadBundle<cr>", "OverseerLoadBundle" },
			o = { "<cmd>OverseerOpen!<cr>", "OverseerOpen" },
			q = { "<cmd>OverseerQuickAction<cr>", "OverseerQuickAction" },
			r = { "<cmd>OverseerRun<cr>", "OverseerRun" },
			s = { "<cmd>OverseerSaveBundle<cr>", "OverseerSaveBundle" },
			t = { "<cmd>OverseerToggle!<cr>", "OverseerToggle" },
		},
	}

	local testing_mappings = neotest_testing_mappings

	local non_leader_mappings = {
		["ff"] = { "<cmd>lua vim.lsp.buf.format()<CR>", "Format" },
	}

	-- finish setting up
	wk.setup(conf)

	-- hang overseer off leader
	wk.register(overseer_mappings, leader_opts)

	-- hang testing off leader
	wk.register(testing_mappings, leader_opts)

	-- hang dap off leader
	wk.register(dap_mappings, leader_opts)

	-- default leader keybindings
	wk.register(leader_mappings, leader_opts)

	-- default leader keybindings
	wk.register(non_leader_mappings, non_leader_opts)
end

return M
