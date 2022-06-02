vim.cmd([[packadd packer.nvim]])

local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)

  -- packer itself
  use 'wbthomason/packer.nvim'

  -- color scheme
  use {'morhetz/gruvbox', config = function()
      vim.cmd('colorscheme gruvbox')
    end, }

  -- bottom info line
  use { 'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = false },
    config = function()
      require('lualine').setup{
        options = {
          theme = 'gruvbox',
          section_separators = { left = '', right = '' },
          component_separators = { left = '', right = '' }
        }
      }
    end, }

  -- top buffer line
  use { 'akinsho/bufferline.nvim', 
    requires = { 'kyazdani42/nvim-web-devicons', opt = false },
    config = function()
      require('bufferline').setup()
    end, }

  -- files
  use { 'kyazdani42/nvim-tree.lua', 
    requires = { 'kyazdani42/nvim-web-devicons', opt = false },
    config = function()
      require('nvim-tree').setup()
    end, }

  -- colorize hex colors (#153709)
  use {	"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup()
		end, }

  -- number of occurrences in the search
  use("google/vim-searchindex")

  -- indentlines
  use { "lukas-reineke/indent-blankline.nvim", 
    config = function()
      vim.cmd [[highlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombine]]
      vim.cmd [[highlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombine]]
      vim.opt.list = true
      vim.opt.listchars:append("space:⋅")

      require("indent_blankline").setup {
        space_char_blankline = " ",
        char_highlight_list = {
          "IndentBlanklineIndent1",
          "IndentBlanklineIndent2",
          "IndentBlanklineIndent3",
          "IndentBlanklineIndent4",
          "IndentBlanklineIndent5",
          "IndentBlanklineIndent6",
        },
      }
    end, }

  -- keymappings hint
  use { 'folke/which-key.nvim',
    config = function()
      require('which-key').setup()
    end, }

	use { "yamatsum/nvim-cursorline",
		event = "BufWinEnter",
		disable = false,
    config = function ()
      require('nvim-cursorline').setup {
        cursorline = {
          enable = true,
          timeout = 700,
          number = false,
        },
        cursorword = {
          enable = true,
          min_length = 1,
          hl = { underline = true },
        }
      }
    end, }


  -- lsp
  -- lspconfig
  use { 'neovim/nvim-lspconfig',
    config = function()
      require('which-key').register({
        name = "Code",
        g = {
          name = "Diagnosis",
          o = { vim.diagnostic.open_float, "Open float" },
          q = { vim.diagnostic.setloclist, "setloclist" },
          w = { vim.diagnostic.goto_prev, "Go to previous" },
          e = { vim.diagnostic.goto_next, "Go to next" },    
        },
        D = { vim.lsp.buf.declarations, "Declarations" },
        d = { vim.lsp.buf.definitions, "Definitions" },
        K = { vim.lsp.buf.hover, "Hover" },
        i = { vim.lsp.buf.implementations, "Implementations" },
        t = { vim.lsp.buf.type_definitions, "Type definitions" },
        R = { vim.lsp.buf.rename, "Rename" },
        c = { vim.lsp.buf.code_action, "Code action" },
        r = { vim.lsp.buf.references, "References" },
        f = { vim.lsp.buf.format, "Format" },
      }, { prefix = "<leader>c" })
    end, }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
