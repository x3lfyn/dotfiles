require('nvim-treesitter.configs').setup {
	ensure_installed = { "lua", "python", "javascript", "typescript", "bash" },

	sync_install = true,

	highlight = {
		enable = true
	},
	indent = {
		enable = true
	}
}
