-- [[
-- general overrides for the vim configuration.  This is loaded after any plugins
-- and therefore will customize their behavior.
-- ]]

-- custom neovim interpreter paths
vim.g.python3_host_prog = '/usr/local/bin/python'
-- TODO: trying out direct python
-- os.getenv('HOME') .. '/.config/interpreters/neovim/python/bin/python'


-- common editor settings
vim.g.mapleader = ','
vim.opt.hlsearch = true

-- line number settings
vim.opt.relativenumber = true
-- end: line number settings

-- customize file finding
vim.opt.path:remove '/usr/include'
vim.opt.path:append '**'
vim.cmd [[set path=.,,,$PWD/**]]
vim.opt.wildignorecase = true
vim.opt.wildignore:append '**/node_modules/*'
vim.opt.wildignore:append '**/.git/*'
vim.opt.wildignore:append '**/build/*'

-- highlight on yank
vim.cmd [[
  augroup YankHighlight
  autocmd!
  autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- remember cursor position
vim.cmd [[
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif
]]

-- Time in milliseconds to wait for a mapped sequence to complete.
vim.opt.timeoutlen = 300
