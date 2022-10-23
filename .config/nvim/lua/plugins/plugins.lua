local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.cmd [[packadd packer.nvim]]
end

vim.cmd([[packadd packer.nvim]])

return require('packer').startup(function(use)

	-- packer itself
	use 'wbthomason/packer.nvim'

	-- color scheme
	use {
		'sainnhe/gruvbox-material',
		config = function ()
			require [[plugins/configs/gruvbox]]
		end
	}

	-- file tree
	use {
		'kyazdani42/nvim-tree.lua',
		requires = {
			'kyazdani42/nvim-web-devicons', opt = false
		},
		config = function ()
			require('nvim-tree').setup()
		end
	}

	-- number of occurrences in search
	use 'google/vim-searchindex'

	-- top bufferline
	use {
		'akinsho/bufferline.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons', opt = false
		},
		config = function()
			require [[plugins/configs/bufferline]]
		end
	}

	-- botton line
	use {
		'nvim-lualine/lualine.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons', opt = false
		},
		config = function()
			require [[plugins/configs/lualine]]
		end
	}

	-- lsp
	use 'neovim/nvim-lspconfig'


	-- lsp progress indicator
	use {
		'j-hui/fidget.nvim',
		config = function()
			require [[plugins/configs/fidget]]
		end
	}

	-- lsp problems menu
	use {
		'folke/trouble.nvim',
		requires = {
			'kyazdani42/nvim-web-devicons', opt = false
		},
		config = function()
			require [[plugins/configs/trouble]]
		end
	}

	-- lsp navigator
	use {
		'ray-x/navigator.lua',
		requires = {
			{ 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
			{ 'neovim/nvim-lspconfig' },
		},
		config = function()
			require [[plugins/configs/navigator]]
		end
	}

	-- lsp server installer
	use {
		'williamboman/nvim-lsp-installer',
		config = function()
			require [[plugins/configs/lsp-installer]]
		end
	}

	-- autocomplete
	use {
		'hrsh7th/nvim-cmp',
		requires = {
			'L3MON4D3/LuaSnip',
			'saadparwaiz1/cmp_luasnip',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-path',
			'hrsh7th/cmp-emoji',
			'hrsh7th/cmp-nvim-lsp-signature-help',
			'hrsh7th/cmp-nvim-lua'
		},
		config = function()
			require [[plugins/configs/cmp]]
		end
	}

	-- autocomplete icons
	use {
		'onsails/lspkind-nvim',
		config = function()
			require [[plugins/configs/lspkind]]
		end
	}

	-- status line which shows current code context
	use {
		"SmiteshP/nvim-navic",
		requires = "neovim/nvim-lspconfig"
	}

	-- syntax highlighting
	use {
		'nvim-treesitter/nvim-treesitter',
		config = function()
			require [[plugins/configs/tree-sitter]]
		end
	}

	-- comments
	use {
		'numToStr/Comment.nvim',
		config = function ()
			require [[plugins/configs/comment]]
		end
	}

	-- autopairs
	use {
		'windwp/nvim-autopairs',
		config = function ()
			require [[plugins/configs/autopairs]]
		end
	}

	-- code symbols panel
	use {
		'simrat39/symbols-outline.nvim',
		config = function ()
			require [[plugins/configs/symbols]]
		end
	}

	-- telescope
	use {
		'nvim-telescope/telescope.nvim',
		requires = {
			'nvim-lua/plenary.nvim'
		},
		config = function ()
			require('telescope').setup()
		end
	}

	if packer_bootstrap then
		require('packer').sync()
	end
end)
