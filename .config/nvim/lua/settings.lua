local opt = vim.opt
local g = vim.g

--[[Numbers]]--
	-- show line numbers
	opt.number = true

	-- use relative numbers
	opt.relativenumber = true

--[[Search]]--
	-- when search "test", "Test" would be found
	opt.ignorecase = true

	-- when search "Test", only "Test" would be found
	opt.smartcase = true

	opt.showmatch = true


--[[Panels]]--
	-- verticals splits are on right side
	opt.splitright = true

	-- horizontal splits are below
	opt.splitbelow = true

--[[Tabs]]--
	opt.expandtab = false

	-- spaces on "<",">"
	opt.shiftwidth = 4
	opt.tabstop = 4

	opt.smartindent = true

--[[Misc]]--
	-- system clipboard
	opt.clipboard = 'unnamedplus'

	opt.fixeol = false

	-- native autocomplete
	opt.completeopt = 'menu,noselect'

	-- don't autocomment new line
	vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]]

	-- truecolor
	opt.termguicolors = true

	opt.lazyredraw = true

	-- enable mouse
	opt.mouse = "a"
