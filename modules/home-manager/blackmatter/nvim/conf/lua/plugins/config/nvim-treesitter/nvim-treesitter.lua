local M = {}
function M.setup()
	local parsers_path = "~/.local/share/nvim/site/pack/parsers/start/parsers/tree-sitter"
	vim.opt.runtimepath:append(parsers_path)

	-- TODO: orgmode when turned on currently generates many errors
	-- https://github.com/nvim-orgmode/orgmode
	-- require("orgmode").setup_ts_grammar()

	require("nvim-treesitter.configs").setup {
		parser_install_dir = parsers_path,
		ensure_installed = "all";
		auto_install = true,
		enable = true,
		highlight = {
			enable = true,
			disable = { "nix" };
			additional_vim_regex_highlighting = { "org" },
		},
		incremental_selection = {
			enable = true,
			keymaps = {
				init_selection = "gnn", -- set to `false` to disable one of the mappings
				node_incremental = "grn",
				scope_incremental = "grc",
				node_decremental = "grm",
			},
		},
		indent = {
			enable = true;
		};
		-- enable vim-matchup integration
		matchup = { enable = true, },
		-- nvim-treesitter-textobjects
		textobjects = {
			lsp_interop = {
				enable = true,
				peek_definition_code = {
					["df"] = "@function.outer",
					["dF"] = "@class.outer",
				},
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					["]m"] = "@function.outer",
					["]]"] = "@class.outer",
				},
				goto_next_end = {
					["]M"] = "@function.outer",
					["]["] = "@class.outer",
				},
				goto_previous_start = {
					["[m"] = "@function.outer",
					["[["] = "@class.outer",
				},
				goto_previous_end = {
					["[M"] = "@function.outer",
					["[]"] = "@class.outer",
				},
			},
			swap = {
				enable = true,
				swap_next = {
					["<leader>rx"] = "@parameter.inner",
				},
				swap_previous = {
					["<leader>rX"] = "@parameter.inner",
				},
			},
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["ac"] = "@class.outer",
					["ic"] = "@class.inner",
				}
			}
		},
	}
	-- TODO: folding is a bit buggy troubleshoot later
	-- vim.cmd [[ set foldmethod=expr ]]
	-- vim.cmd [[ set foldexpr=nvim_treesitter#foldexpr() ]]
end

return M
