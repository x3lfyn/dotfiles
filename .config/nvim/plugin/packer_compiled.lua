-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/kadyklesha/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/kadyklesha/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/kadyklesha/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/kadyklesha/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/kadyklesha/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  gruvbox = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\24colorscheme gruvbox\bcmd\bvim\0" },
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/gruvbox",
    url = "https://github.com/morhetz/gruvbox"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\n¬\6\0\0\4\0\19\0,6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\0016\0\0\0009\0\1\0'\2\5\0B\0\2\0016\0\0\0009\0\1\0'\2\6\0B\0\2\0016\0\0\0009\0\1\0'\2\a\0B\0\2\0016\0\0\0009\0\b\0+\1\2\0=\1\t\0006\0\0\0009\0\b\0009\0\n\0\18\2\0\0009\0\v\0'\3\f\0B\0\3\0016\0\r\0'\2\14\0B\0\2\0029\0\15\0005\2\16\0005\3\17\0=\3\18\2B\0\2\1K\0\1\0\24char_highlight_list\1\a\0\0\27IndentBlanklineIndent1\27IndentBlanklineIndent2\27IndentBlanklineIndent3\27IndentBlanklineIndent4\27IndentBlanklineIndent5\27IndentBlanklineIndent6\1\0\1\25space_char_blankline\6 \nsetup\21indent_blankline\frequire\14space:â‹…\vappend\14listchars\tlist\boptAhighlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombineAhighlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombineAhighlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombineAhighlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombineAhighlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombineAhighlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine\bcmd\bvim\0" },
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nÁ\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\foptions\1\0\0\25component_separators\1\0\2\tleft\bî‚µ\nright\bî‚·\23section_separators\1\0\2\tleft\bî‚´\nright\bî‚¶\1\0\1\ntheme\fgruvbox\nsetup\flualine\frequire\0" },
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-cursorline"] = {
    config = { "\27LJ\2\n¹\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\2B\0\2\1K\0\1\0\15cursorword\ahl\1\0\1\14underline\2\1\0\2\venable\2\15min_length\3\1\15cursorline\1\0\0\1\0\3\venable\2\vnumber\1\ftimeout\3¼\5\nsetup\20nvim-cursorline\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/opt/nvim-cursorline",
    url = "https://github.com/yamatsum/nvim-cursorline"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\nñ\6\0\0\6\0002\0a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\b\0006\5\5\0009\5\6\0059\5\a\5>\5\1\4=\4\t\0035\4\v\0006\5\5\0009\5\6\0059\5\n\5>\5\1\4=\4\f\0035\4\14\0006\5\5\0009\5\6\0059\5\r\5>\5\1\4=\4\15\0035\4\17\0006\5\5\0009\5\6\0059\5\16\5>\5\1\4=\4\18\3=\3\19\0025\3\23\0006\4\5\0009\4\20\0049\4\21\0049\4\22\4>\4\1\3=\3\24\0025\3\26\0006\4\5\0009\4\20\0049\4\21\0049\4\25\4>\4\1\3=\3\27\0025\3\29\0006\4\5\0009\4\20\0049\4\21\0049\4\28\4>\4\1\3=\3\30\0025\3 \0006\4\5\0009\4\20\0049\4\21\0049\4\31\4>\4\1\3=\3!\0025\3#\0006\4\5\0009\4\20\0049\4\21\0049\4\"\4>\4\1\3=\3$\0025\3&\0006\4\5\0009\4\20\0049\4\21\0049\4%\4>\4\1\3=\3'\0025\3)\0006\4\5\0009\4\20\0049\4\21\0049\4(\4>\4\1\3=\3*\0025\3,\0006\4\5\0009\4\20\0049\4\21\0049\4+\4>\4\1\3=\3-\0025\3/\0006\4\5\0009\4\20\0049\4\21\0049\4.\4>\4\1\3=\0030\0025\0031\0B\0\3\1K\0\1\0\1\0\1\vprefix\14<leader>c\6f\1\3\0\0\0\vFormat\vformat\6r\1\3\0\0\0\15References\15references\6c\1\3\0\0\0\16Code action\16code_action\6R\1\3\0\0\0\vRename\vrename\6t\1\3\0\0\0\21Type definitions\21type_definitions\6i\1\3\0\0\0\20Implementations\20implementations\6K\1\3\0\0\0\nHover\nhover\6d\1\3\0\0\0\16Definitions\16definitions\6D\1\3\0\0\0\17Declarations\17declarations\bbuf\blsp\6g\6e\1\3\0\0\0\15Go to next\14goto_next\6w\1\3\0\0\0\19Go to previous\14goto_prev\6q\1\3\0\0\0\15setloclist\15setloclist\6o\1\3\0\0\0\15Open float\15open_float\15diagnostic\bvim\1\0\1\tname\14Diagnosis\1\0\1\tname\tCode\rregister\14which-key\frequire\0" },
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14nvim-tree\frequire\0" },
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/kyazdani42/nvim-tree.lua"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["vim-searchindex"] = {
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/vim-searchindex",
    url = "https://github.com/google/vim-searchindex"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\nñ\6\0\0\6\0002\0a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\b\0006\5\5\0009\5\6\0059\5\a\5>\5\1\4=\4\t\0035\4\v\0006\5\5\0009\5\6\0059\5\n\5>\5\1\4=\4\f\0035\4\14\0006\5\5\0009\5\6\0059\5\r\5>\5\1\4=\4\15\0035\4\17\0006\5\5\0009\5\6\0059\5\16\5>\5\1\4=\4\18\3=\3\19\0025\3\23\0006\4\5\0009\4\20\0049\4\21\0049\4\22\4>\4\1\3=\3\24\0025\3\26\0006\4\5\0009\4\20\0049\4\21\0049\4\25\4>\4\1\3=\3\27\0025\3\29\0006\4\5\0009\4\20\0049\4\21\0049\4\28\4>\4\1\3=\3\30\0025\3 \0006\4\5\0009\4\20\0049\4\21\0049\4\31\4>\4\1\3=\3!\0025\3#\0006\4\5\0009\4\20\0049\4\21\0049\4\"\4>\4\1\3=\3$\0025\3&\0006\4\5\0009\4\20\0049\4\21\0049\4%\4>\4\1\3=\3'\0025\3)\0006\4\5\0009\4\20\0049\4\21\0049\4(\4>\4\1\3=\3*\0025\3,\0006\4\5\0009\4\20\0049\4\21\0049\4+\4>\4\1\3=\3-\0025\3/\0006\4\5\0009\4\20\0049\4\21\0049\4.\4>\4\1\3=\0030\0025\0031\0B\0\3\1K\0\1\0\1\0\1\vprefix\14<leader>c\6f\1\3\0\0\0\vFormat\vformat\6r\1\3\0\0\0\15References\15references\6c\1\3\0\0\0\16Code action\16code_action\6R\1\3\0\0\0\vRename\vrename\6t\1\3\0\0\0\21Type definitions\21type_definitions\6i\1\3\0\0\0\20Implementations\20implementations\6K\1\3\0\0\0\nHover\nhover\6d\1\3\0\0\0\16Definitions\16definitions\6D\1\3\0\0\0\17Declarations\17declarations\bbuf\blsp\6g\6e\1\3\0\0\0\15Go to next\14goto_next\6w\1\3\0\0\0\19Go to previous\14goto_prev\6q\1\3\0\0\0\15setloclist\15setloclist\6o\1\3\0\0\0\15Open float\15open_float\15diagnostic\bvim\1\0\1\tname\14Diagnosis\1\0\1\tname\tCode\rregister\14which-key\frequire\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nÁ\1\0\0\5\0\n\0\r6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\b\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0=\4\a\3=\3\t\2B\0\2\1K\0\1\0\foptions\1\0\0\25component_separators\1\0\2\tleft\bî‚µ\nright\bî‚·\23section_separators\1\0\2\tleft\bî‚´\nright\bî‚¶\1\0\1\ntheme\fgruvbox\nsetup\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: nvim-tree.lua
time([[Config for nvim-tree.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14nvim-tree\frequire\0", "config", "nvim-tree.lua")
time([[Config for nvim-tree.lua]], false)
-- Config for: gruvbox
time([[Config for gruvbox]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\24colorscheme gruvbox\bcmd\bvim\0", "config", "gruvbox")
time([[Config for gruvbox]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\n8\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\n¬\6\0\0\4\0\19\0,6\0\0\0009\0\1\0'\2\2\0B\0\2\0016\0\0\0009\0\1\0'\2\3\0B\0\2\0016\0\0\0009\0\1\0'\2\4\0B\0\2\0016\0\0\0009\0\1\0'\2\5\0B\0\2\0016\0\0\0009\0\1\0'\2\6\0B\0\2\0016\0\0\0009\0\1\0'\2\a\0B\0\2\0016\0\0\0009\0\b\0+\1\2\0=\1\t\0006\0\0\0009\0\b\0009\0\n\0\18\2\0\0009\0\v\0'\3\f\0B\0\3\0016\0\r\0'\2\14\0B\0\2\0029\0\15\0005\2\16\0005\3\17\0=\3\18\2B\0\2\1K\0\1\0\24char_highlight_list\1\a\0\0\27IndentBlanklineIndent1\27IndentBlanklineIndent2\27IndentBlanklineIndent3\27IndentBlanklineIndent4\27IndentBlanklineIndent5\27IndentBlanklineIndent6\1\0\1\25space_char_blankline\6 \nsetup\21indent_blankline\frequire\14space:â‹…\vappend\14listchars\tlist\boptAhighlight IndentBlanklineIndent6 guifg=#C678DD gui=nocombineAhighlight IndentBlanklineIndent5 guifg=#61AFEF gui=nocombineAhighlight IndentBlanklineIndent4 guifg=#56B6C2 gui=nocombineAhighlight IndentBlanklineIndent3 guifg=#98C379 gui=nocombineAhighlight IndentBlanklineIndent2 guifg=#E5C07B gui=nocombineAhighlight IndentBlanklineIndent1 guifg=#E06C75 gui=nocombine\bcmd\bvim\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au BufWinEnter * ++once lua require("packer.load")({'nvim-cursorline'}, { event = "BufWinEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
