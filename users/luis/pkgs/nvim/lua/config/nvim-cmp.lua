local M = {}

function M.setup()
	vim.cmd [[set completeopt=menu,menuone,noselect]]
	local cmp = require('cmp')

	-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
	-- cmp.setup.cmdline('/', {
	-- 	sources = {
	-- 		{ name = 'buffer' }
	-- 	}
	-- })

	-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
	-- cmp.setup.cmdline(':', {
	-- 	sources = cmp.config.sources(
	-- 		{
	-- 			{ name = 'path' }
	-- 		},
	-- 		{
	-- 			{ name = 'cmdline' }
	-- 		}
	-- 	)
 --  })

	cmp.setup(
		{
			-- snippet = {
			-- 	expand = function(args)
			-- 		require('luasnip').lsp_expand(args.body)
			-- 	end,
			-- },
			mapping = {
				['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
				['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
				['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
				['<C-y>'] = cmp.config.disable,
				['<C-e>'] = cmp.mapping({ i = cmp.mapping.abort(), c = cmp.mapping.close(), }),
				['<CR>'] = cmp.mapping.confirm({select = true}),
			},
			sources = cmp.config.sources(
				{
					{ name = 'nvim_lsp' },
					{ name = 'luasnip' },
					{ name = 'buffer' },
				}
			)
		}
	)
end

return M
