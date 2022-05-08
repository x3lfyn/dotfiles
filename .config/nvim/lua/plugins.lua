vim.cmd([[packadd packer.nvim]])

vim.cmd([[
  augroup RecompilePlugins
    autocmd! BufWritePost plugins.lua let g:plugins_recompile=1 | source <afile> | PackerCompile
  augroup END
]])

map = vim.api.nvim_set_keymap
default_opts = { noremap = true, silent = true }

local function setup_packer(packer_bootstrap)
	require("packer").startup(function(use)

		use("wbthomason/packer.nvim")
		use("lewis6991/impatient.nvim")
    use("nathom/filetype.nvim")
    use({
      "morhetz/gruvbox",
      config = function()
        vim.cmd("colorscheme gruvbox")
      end
    })
    use("google/vim-searchindex")
    use({
      "kyazdani42/nvim-web-devicons",
      config = function()
        require("nvim-web-devicons").setup({
          defult = true
        })
      end
    })
    use({
			"windwp/nvim-autopairs",
			config = function()
				local autopairs = require("nvim-autopairs")
				autopairs.setup({
					disable_filetype = { "TelescopePrompt" },
					disable_in_macro = false, -- disable when recording or executing a macro
					disable_in_visualblock = false, -- disable when insert after visual block mode
					ignored_next_char = string.gsub([[ [%w%%%'%[%"%.] ]], "%s+", ""),
					enable_moveright = true,
					enable_afterquote = true, -- add bracket pairs after quote
					enable_check_bracket_line = true, --- check bracket in same line
					check_ts = false,
					map_bs = true, -- map the <BS> key
					map_c_h = false, -- Map the <C-h> key to delete a pair
					map_c_w = false, -- map <c-w> to delete a pair if possible
					fast_wrap = {
						-- Before        Input                    After
						--------------------------------------------------
						-- (|foobar      <M-e> then press $        (|foobar)
						-- (|)(foobar)   <M-e> then press q       (|(foobar))
						map = "<A-e>",
						chars = { "{", "[", "(", '"', "'" },
						pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
						offset = 0, -- Offset from pattern match
						end_key = "$",
						keys = "qwertyuiopzxcvbnmasdfghjkl",
						check_comma = true,
						highlight = "Search",
						highlight_grey = "Comment",
					},
				})
			end,
		})
    use({
			"nvim-lualine/lualine.nvim",
			requires = { "kyazdani42/nvim-web-devicons", opt = true },
			config = function()
				local dap_extension = {
					sections = {
						lualine_a = { "mode", "filename" },
					},
					inactive_sections = {
						lualine_a = { "filename" },
					},
					filetypes = {
						"dapui_scopes",
						"dapui_watches",
						"dapui_stacks",
						"dapui_breakpoints",
						"dap-repl",
					},
				}

				require("lualine").setup({
					options = {
						icons_enabled = true,
						theme = "gruvbox_dark",
						component_separators = { left = "", right = "" },
						section_separators = { left = "", right = "" },
						disabled_filetypes = {},
						always_divide_middle = true,
					},
					sections = {
						lualine_a = { "mode" },
						lualine_b = { "branch" },
						lualine_c = {
							{
								"filename",
								path = 1, -- NOTE: show relative file path
							},
						},
						lualine_x = {
							{
								"diagnostics",
								sources = { "nvim_diagnostic" },
								diagnostics_color = {
									error = "VirtualTextError",
									warn = "VirtualTextWarn",
									info = "VirtualTextInfo",
									hint = "VirtualTextHint",
								},
							},
							"encoding",
							"fileformat",
							"filetype",
						},
						lualine_y = { "progress" },
						lualine_z = { "location" },
					},
					extensions = { "fugitive", "quickfix", "fzf", "toggleterm", "symbols-outline" },
				})
			end,
		})
    use({
			"norcalli/nvim-colorizer.lua",
			config = function()
				require("colorizer").setup()
			end,
		})
		use({
			"folke/which-key.nvim",
			config = function()
				require("which-key").setup({
					-- your configuration comes here
					-- or leave it empty to use the default settings
					-- refer to the configuration section below
					marks = true, -- shows a list of your marks on ' and `
					registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
					spelling = {
						enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
						suggestions = 20, -- how many suggestions should be shown in the list?
					},
					presets = {
						operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
						motions = true, -- adds help for motions
						text_objects = true, -- help for text objects triggered after entering an operator
						windows = true, -- default bindings on <c-w>
						nav = true, -- misc bindings to work with windows
						z = true, -- bindings for folds, spelling and others prefixed with z
						g = true, -- bindings for prefixed with g
					},
					triggers = "auto", -- automatically setup triggers
					-- triggers = { "<leader>" }, -- or specify a list manually
					ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
				})
			end,
		})
		use({
			"tpope/vim-commentary",
			config = function()
				local ws = require("which-key")
        require("which-key").register({["<Leader>c"] = { ":Commentary<CR>", "Comment line" }})
			end,
		})
		use({
			"junegunn/fzf",
			run = function()
				vim.fn["fzf#install"]()
				vim.cmd([[
        let $FZF_DEFAULT_COMMAND="rg --files --no-ignore --hidden --follow --g '!{.git,node_modules}'"
        ]])
			end,
		})
		use({ 
			"yamatsum/nvim-cursorline",
			opt = true,
			event = "BufWinEnter",
			disable = false,
		})
		use({
			"mbbill/undotree",
			config = function()
				vim.o.undofile = true
				require("which-key").register({ ["<Leader>u"] = { ":UndotreeToggle<CR>", "Toggle undo tree" } })
			end,
		})
    use({
			"akinsho/bufferline.nvim",
			config = function()
				require("bufferline").setup({
					options = {
						numbers = "ordinal",
						close_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
						right_mouse_command = "bdelete! %d", -- can be a string | function, see "Mouse actions"
						left_mouse_command = "buffer %d", -- can be a string | function, see "Mouse actions"
						middle_mouse_command = nil, -- can be a string | function, see "Mouse actions"
						-- NOTE: this plugin is designed with this icon in mind,
						-- and so changing this is NOT recommended, this is intended
						-- as an escape hatch for people who cannot bear it for whatever reason
						indicator_icon = "▎",
						buffer_close_icon = "",
						modified_icon = "●",
						close_icon = "",
						left_trunc_marker = "",
						right_trunc_marker = "",
						--- name_formatter can be used to change the buffer's label in the bufferline.
						--- Please note some names can/will break the
						--- bufferline so use this at your discretion knowing that it has
						--- some limitations that will *NOT* be fixed.
						name_formatter = function(buf) -- buf contains a "name", "path" and "bufnr"
							-- remove extension from markdown files for example
							if buf.name:match("%.md") then
								return vim.fn.fnamemodify(buf.name, ":t:r")
							end
						end,
						max_name_length = 18,
						max_prefix_length = 15, -- prefix used when a buffer is de-duplicated
						tab_size = 18,
						-- diagnostics = "nvim_lsp",
						-- diagnostics_update_in_insert = false,
						show_buffer_icons = false, -- disable filetype icons for buffers
						show_buffer_close_icons = true,
						show_close_icon = true,
						show_tab_indicators = true,
						persist_buffer_sort = true, -- whether or not custom sorted buffers should persist
						-- can also be a table containing 2 custom separators
						-- [focused and unfocused]. eg: { '|', '|' }
						-- "slant" | "thick" | "thin"
						separator_style = "thick",
						enforce_regular_tabs = true,
						always_show_bufferline = true,
						sort_by = "id",
					},
				})
			end,
			requires = "kyazdani42/nvim-web-devicons",
		})
    use("matze/vim-move")
    use({
			"neovim/nvim-lspconfig",
			config = function()
				vim.o.cmdheight = 2
				vim.opt.shortmess:append("c")
				-- require("lsp")
			end,
			requires = {
				"jose-elias-alvarez/nvim-lsp-ts-utils",
				"jose-elias-alvarez/null-ls.nvim",
				"b0o/SchemaStore.nvim",
				"williamboman/nvim-lsp-installer", -- :LspInstall lang
			},
		})

		use({
			"tami5/lspsaga.nvim",
			config = function()
				local saga = require("lspsaga")
				saga.init_lsp_saga({
					code_action_prompt = { enable = true },
					finder_action_keys = {
						open = "o",
						vsplit = "s",
						split = "i",
						quit = "q",
						scroll_down = "<C-f>",
						scroll_up = "<C-b>", -- quit can be a table
					},
					code_action_keys = {
						quit = "q",
						exec = "<CR>",
					},
					rename_action_keys = {
						quit = "<C-c>",
						exec = "<CR>", -- quit can be a table
					},
				})

				local ws = require("which-key")

				ws.register({
					name = "Code",
					g = { "<cmd>Lspsaga lsp_finder<CR>", "Finder" },
					r = { "<cmd>Lspsaga rename<CR>", "Rename" },
				}, {
					prefix = "<Leader>c",
				})
			end,
		})

    local lsp_installer = require("nvim-lsp-installer")

    lsp_installer.on_server_ready(function(server)
      local opts = {}

      server:setup(opts)
    end)

    use("powerman/vim-plugin-ruscmd")

    use({
			"sudormrfbin/cheatsheet.nvim",
			config = function()
				local ws = require("which-key")
				ws.register({
					name = "Telescope",
					d = { "<cmd>Cheatsheet<CR>", "Cheatsheet" },
				}, {
					prefix = "<Leader>f",
				})
			end,
		})

    use({
			"nvim-telescope/telescope.nvim",
			requires = {
				"nvim-lua/popup.nvim",
				"nvim-lua/plenary.nvim",
				"nvim-telescope/telescope-live-grep-raw.nvim",
			},
			config = function()
				local vimgrep_args_hidden_files = require("telescope.config").set_defaults().get("vimgrep_arguments")
				table.insert(vimgrep_args_hidden_files, "--hidden")

				require("which-key").register({
					name = "Telescope",
					f = { "<cmd>Telescope find_files hidden=true<CR>", "Files" },
					G = {
						name = "Git",
						s = { "<cmd>Telescope git_status<CR>", "Status" },
						f = { "<cmd>Telescope git_files<CR>", "Files" },
						b = { "<cmd>Telescope git_branches<CR>", "Branches" },
					},
					b = { "<cmd>Telescope buffers<CR>", "Buffers" },
					h = { "<cmd>Telescope help_tags<CR>", "Help tags" },
					t = { "<cmd>Telescope treesitter<CR>", "Treesitter" },
					g = { "<cmd>Telescope live_grep<CR>", "Live grep" },
					o = { "<cmd>Telescope oldfiles<CR>", "Old files" },
					r = { "<cmd>Telescope lsp_references<CR>", "LSP references" },
					s = { "<cmd>Telescope lsp_dynamic_workspace_symbols<CR>", "LSP workspace symbols" },
					a = { "<cmd>Telescope lsp_code_actions<CR>", "LSP code actions" },
					p = {
						"<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>",
						"Colorscheme with Preview",
					},
				}, {
					prefix = "<Leader>f",
				})

				require("telescope").setup({
					defaults = {
						file_ignore_patterns = { ".git/.*", "vendor/.*", "composer/.*" },
						path_display = { ["truncate"] = 2 },
						vimgrep_arguments = {
							"rg",
							"--color=never",
							"--no-heading",
							"--with-filename",
							"--line-number",
							"--column",
							"--smart-case",
						},

						file_sorter = require("telescope.sorters").get_fuzzy_file,
						generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
						file_previewer = require("telescope.previewers").vim_buffer_cat.new,
						grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
						qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

						prompt_prefix = "🔎︎ ",
						selection_caret = "➤ ",
						entry_prefix = "  ",
						winblend = 0,
						border = {},
						borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
						color_devicons = true,
						use_less = true,
						set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
						path_display = { "absolute" }, -- How file paths are displayed ()

						-- Developer configurations: Not meant for general override
						buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
						initial_mode = "insert",
						selection_strategy = "reset",
						sorting_strategy = "ascending",
						layout_strategy = "horizontal",
						layout_config = {
							horizontal = {
								mirror = false,
								prompt_position = "top",
							},
							vertical = {
								mirror = false,
							},
						},
					},
					extensions = {},
				})
			end,
		})

    use({
			"dstein64/nvim-scrollview",
			config = function()
				vim.cmd([[ highlight link ScrollView WildMenu ]])
			end,
		})

		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			requires = {
				-- "nvim-treesitter/nvim-treesitter-textobjects",
				"romgrk/nvim-treesitter-context", -- show function context on top of buffer, very nice
				-- "RRethy/nvim-treesitter-textsubjects",
				-- "p00f/nvim-ts-rainbow",
				"windwp/nvim-ts-autotag",
			},
			config = function()
				vim.o.foldmethod = "expr"
				vim.o.foldexpr = "nvim_treesitter#foldexpr()"
				vim.o.foldlevel = 20

				require("nvim-treesitter.configs").setup({
					ensure_installed = "all",
					highlight = {
						enable = false,
					},
					autotag = {
						enable = true,
					},
					-- textsubjects = {
					-- 	enable = true,
					-- 	keymaps = {
					-- 		["."] = "textsubjects-smart",
					-- 		[";"] = "textsubjects-container-outer",
					-- 	},
					-- },
					-- textobjects = {
					-- 	swap = {
					-- 		enable = true,
					-- 		swap_next = {
					-- 			["]a"] = "@parameter.inner",
					-- 		},
					-- 		swap_previous = {
					-- 			["[a"] = "@parameter.inner",
					-- 		},
					-- 	},
					-- 	select = {
					-- 		enable = true,
					-- 		keymaps = {
					-- 			["af"] = "@function.outer",
					-- 			["if"] = "@function.inner",
					-- 			["ac"] = "@call.outer",
					-- 			["ic"] = "@call.inner",
					-- 		},
					-- 	},
					-- },
					-- rainbow = {
					-- 	enable = false,
					-- 	extended_mode = true,
					-- },
				})
			end,
		})


		if packer_bootstrap then
			require("packer").sync()
		end
	end)
end

if vim.g.plugins_recompile == 1 then
	setup_packer(false)
end

return setup_packer
