local M = {}

-- Check if there are non-whitespace characters before the cursor
local function has_words_before()
	if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then
		return false
	end
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

-- Check if 'kyazdani42/nvim-web-devicons' plugin is installed
local function is_codicons_installed()
	local ok, _ = pcall(require, 'nvim-web-devicons')
	return ok
end

-- Set up lspkind configuration based on the provided kind_config ("text" or "codicons")
local function set_lspkind_config(kind_config)
	local symbol_map = {}
	local lspkind = require('lspkind')

	if kind_config == "text" then
		symbol_map = {
			Text = "[-]",
			Method = "[M]",
			Function = "[ƒ]",
			Constructor = "[C]",
			Field = "[.]",
			Variable = "[V]",
			Class = "[#]",
			Interface = "[I]",
			Module = "[M]",
			Property = "[P]",
			Unit = "[U]",
			Value = "[v]",
			Enum = "[E]",
			Keyword = "[K]",
			Snippet = "[S]",
			Color = "[C]",
			File = "[F]",
			Reference = "[R]",
			Folder = "[D]",
			EnumMember = "[e]",
			Constant = "[C]",
			Struct = "[S]",
			Event = "[@]",
			Operator = "[O]",
			TypeParameter = "[T]"
		}
	elseif kind_config == "codicons" and is_codicons_installed then
		symbol_map = require('lspkind').presets.default
	else
		error("Invalid kind_config value, it must be 'text' or 'codicons'")
	end

	lspkind.init({ symbol_map = symbol_map })

	local cmp = require("cmp")
	cmp.setup(
		{
			formatting = {
				format = lspkind.cmp_format({
					-- mode = 'symbol',
					-- maxwidth = 50,
					-- ellipsis_char = '...',
					before = function(entry, vim_item)
						-- TODO: work in progress to give better completion information
						-- vim_item.kind = symbol_map[vim_item.kind]
						-- vim_item.menu = string.format("%s %s", vim_item.menu, vim_item.kind)

						-- show source of completion items
						-- showing source is useful for many things but especially
						-- testing out functionality of new language servers
						local source = entry.source.name

						-- EXAMPLE: in case we only want to show source
						-- on certain sources this incantation should work
						-- if source == 'nvim_lsp' then
						-- 	source = entry.source.client.name
						-- end

						vim_item.menu = string.format(
							"%s (%s)",
							vim_item.menu or "",
							source
						)

						return vim_item
					end
				}),
			},
			-- TODO: consider adding when doing snips
			snippet = {
				expand = function(args)
					require('luasnip').lsp_expand(args.body)
				end,
			},
			mapping = {
				["<Tab>"] = vim.schedule_wrap(function(fallback)
					if cmp.visible() and has_words_before() then
						cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
					else
						fallback()
					end
				end),
				['<C-y>'] = cmp.config.disable,
				['<CR>'] = cmp.mapping.confirm({ select = true }),
				['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
				['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
				['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
				['<C-n>'] = cmp.mapping(cmp.mapping.select_next_item(), { 'i', 'c' }),
				['<C-p>'] = cmp.mapping(cmp.mapping.select_prev_item(), { 'i', 'c' }),
				['<C-e>'] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close(), }),
			},
			sources = cmp.config.sources(
				{
					{ name = 'nvim_lsp' },
					{ name = 'copilot' },
					-- TODO: currently has bugs
					-- { name = 'codeium' },
					{ name = 'treesitter' },
					-- TODO: consider adding when doing snips
					{ name = 'luasnip' },
					{ name = 'buffer' },
					{ name = 'path' },
					-- TODO: has a bug with *, add later
					{ name = 'cmdline' },
				}
			)
		}
	)
end

function M.setup()
	vim.cmd [[ set completeopt=menu,menuone,noselect ]]
	local map = require("utils.map")

	-- TODO: devicons seem to be detected but still show weird little boxes
	-- local default_kind_config = is_codicons_installed() and "codicons" or "text"
	-- set_lspkind_config(default_kind_config)
	--
	-- setting text directly since codicons configuration is still broken
	set_lspkind_config("text")

	-- with only the mappings above when you press c-n on insert with nothing inserted
	-- it brings up the ins-completion native from neovim while you want to do cmp.complete()
	-- instead as if you did C-Space
	map('i', '<c-n>', "<cmd>lua require('cmp').complete()<CR>", {
		noremap = false, expr = false
	})
end

return M
