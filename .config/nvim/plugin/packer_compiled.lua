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
  ["SchemaStore.nvim"] = {
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/SchemaStore.nvim",
    url = "https://github.com/b0o/SchemaStore.nvim"
  },
  ["bufferline.nvim"] = {
    config = { "\27LJ\2\ng\0\1\5\0\a\0\0149\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\15\0\1\0X\2\6Ä6\1\3\0009\1\4\0019\1\5\0019\3\0\0'\4\6\0D\1\3\0K\0\1\0\t:t:r\16fnamemodify\afn\bvim\t%.md\nmatch\tnameØ\4\1\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0003\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\19name_formatter\0\1\0\22\20separator_style\nthick\25enforce_regular_tabs\2\23left_mouse_command\14buffer %d\24right_mouse_command\16bdelete! %d\27always_show_bufferline\2\18close_command\16bdelete! %d\fsort_by\aid\fnumbers\fordinal\24persist_buffer_sort\2\24show_tab_indicators\2\20show_close_icon\2\28show_buffer_close_icons\2\22show_buffer_icons\1\rtab_size\3\18\22max_prefix_length\3\15\20max_name_length\3\18\23right_trunc_marker\bÔÇ©\22left_trunc_marker\bÔÇ®\15close_icon\bÔÄç\18modified_icon\b‚óè\22buffer_close_icon\bÔôï\19indicator_icon\b‚ñé\nsetup\15bufferline\frequire\0" },
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/bufferline.nvim",
    url = "https://github.com/akinsho/bufferline.nvim"
  },
  ["cheatsheet.nvim"] = {
    config = { "\27LJ\2\nï\1\0\0\5\0\a\0\n6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0B\1\3\1K\0\1\0\1\0\1\vprefix\14<Leader>f\6d\1\3\0\0\24<cmd>Cheatsheet<CR>\15Cheatsheet\1\0\1\tname\14Telescope\rregister\14which-key\frequire\0" },
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/cheatsheet.nvim",
    url = "https://github.com/sudormrfbin/cheatsheet.nvim"
  },
  ["filetype.nvim"] = {
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/filetype.nvim",
    url = "https://github.com/nathom/filetype.nvim"
  },
  fzf = {
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  gruvbox = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\24colorscheme gruvbox\bcmd\bvim\0" },
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/gruvbox",
    url = "https://github.com/morhetz/gruvbox"
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/impatient.nvim",
    url = "https://github.com/lewis6991/impatient.nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\n◊\3\0\0\6\0\20\0\0266\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\3B\1\2\0016\1\0\0'\3\f\0B\1\2\0029\2\r\0015\4\14\0005\5\15\0=\5\16\0045\5\17\0=\5\18\0045\5\19\0B\2\3\1K\0\1\0\1\0\1\vprefix\14<Leader>c\6r\1\3\0\0\28<cmd>Lspsaga rename<CR>\vRename\6g\1\3\0\0 <cmd>Lspsaga lsp_finder<CR>\vFinder\1\0\1\tname\tCode\rregister\14which-key\23rename_action_keys\1\0\2\texec\t<CR>\tquit\n<C-c>\21code_action_keys\1\0\2\texec\t<CR>\tquit\6q\23finder_action_keys\1\0\6\vvsplit\6s\nsplit\6i\16scroll_down\n<C-f>\tquit\6q\topen\6o\14scroll_up\n<C-b>\23code_action_prompt\1\0\0\1\0\1\venable\2\18init_lsp_saga\flspsaga\frequire\0" },
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/tami5/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\nî\a\0\0\b\0(\00025\0\3\0005\1\1\0005\2\0\0=\2\2\1=\1\4\0005\1\6\0005\2\5\0=\2\2\1=\1\a\0005\1\b\0=\1\t\0006\1\n\0'\3\v\0B\1\2\0029\1\f\0015\3\19\0005\4\r\0005\5\14\0=\5\15\0045\5\16\0=\5\17\0044\5\0\0=\5\18\4=\4\20\0035\4\22\0005\5\21\0=\5\2\0045\5\23\0=\5\24\0044\5\3\0005\6\25\0>\6\1\5=\5\26\0045\5 \0005\6\27\0005\a\28\0=\a\29\0065\a\30\0=\a\31\6>\6\1\5=\5!\0045\5\"\0=\5#\0045\5$\0=\5%\4=\4\4\0035\4&\0=\4'\3B\1\2\1K\0\1\0\15extensions\1\6\0\0\rfugitive\rquickfix\bfzf\15toggleterm\20symbols-outline\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\5\0\0\0\rencoding\15fileformat\rfiletype\22diagnostics_color\1\0\4\twarn\20VirtualTextWarn\tinfo\20VirtualTextInfo\thint\20VirtualTextHint\nerror\21VirtualTextError\fsources\1\2\0\0\20nvim_diagnostic\1\2\0\0\16diagnostics\14lualine_c\1\2\1\0\rfilename\tpath\3\1\14lualine_b\1\2\0\0\vbranch\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\23section_separators\1\0\2\nright\5\tleft\5\25component_separators\1\0\2\nright\5\tleft\5\1\0\3\25always_divide_middle\2\ntheme\17gruvbox_dark\18icons_enabled\2\nsetup\flualine\frequire\14filetypes\1\6\0\0\17dapui_scopes\18dapui_watches\17dapui_stacks\22dapui_breakpoints\rdap-repl\22inactive_sections\1\0\0\1\2\0\0\rfilename\rsections\1\0\0\14lualine_a\1\0\0\1\3\0\0\tmode\rfilename\0" },
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["null-ls.nvim"] = {
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/null-ls.nvim",
    url = "https://github.com/jose-elias-alvarez/null-ls.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\n™\4\0\0\n\0\18\0\0276\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\0036\4\6\0009\4\a\4'\6\b\0'\a\t\0'\b\n\0B\4\4\2=\4\v\0035\4\f\0005\5\r\0=\5\14\0046\5\6\0009\5\a\5'\a\15\0'\b\t\0'\t\n\0B\5\4\2=\5\16\4=\4\17\3B\1\2\1K\0\1\0\14fast_wrap\fpattern\25 [%'%\"%)%>%]%)%}%,] \nchars\1\6\0\0\6{\6[\6(\6\"\6'\1\0\a\14highlight\vSearch\tkeys\31qwertyuiopzxcvbnmasdfghjkl\19highlight_grey\fComment\fend_key\6$\voffset\3\0\bmap\n<A-e>\16check_comma\2\22ignored_next_char\5\b%s+\21 [%w%%%'%[%\"%.] \tgsub\vstring\21disable_filetype\1\0\t\30enable_check_bracket_line\2\22enable_afterquote\2\21enable_moveright\2\27disable_in_visualblock\1\21disable_in_macro\1\fmap_c_w\1\fmap_c_h\1\vmap_bs\2\rcheck_ts\1\1\2\0\0\20TelescopePrompt\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0" },
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-cursorline"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/opt/nvim-cursorline",
    url = "https://github.com/yamatsum/nvim-cursorline"
  },
  ["nvim-lsp-installer"] = {
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/nvim-lsp-installer",
    url = "https://github.com/williamboman/nvim-lsp-installer"
  },
  ["nvim-lsp-ts-utils"] = {
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/nvim-lsp-ts-utils",
    url = "https://github.com/jose-elias-alvarez/nvim-lsp-ts-utils"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\2\n^\0\0\4\0\a\0\f6\0\0\0009\0\1\0)\1\2\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0\18\2\0\0009\0\5\0'\3\6\0B\0\3\1K\0\1\0\6c\vappend\14shortmess\bopt\14cmdheight\6o\bvim\0" },
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-scrollview"] = {
    config = { "\27LJ\2\nH\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0) highlight link ScrollView WildMenu \bcmd\bvim\0" },
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/nvim-scrollview",
    url = "https://github.com/dstein64/nvim-scrollview"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\nç\2\0\0\4\0\15\0\0236\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0)\1\20\0=\1\6\0006\0\a\0'\2\b\0B\0\2\0029\0\t\0005\2\n\0005\3\v\0=\3\f\0025\3\r\0=\3\14\2B\0\2\1K\0\1\0\fautotag\1\0\1\venable\2\14highlight\1\0\1\venable\1\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\14foldlevel\31nvim_treesitter#foldexpr()\rfoldexpr\texpr\15foldmethod\6o\bvim\0" },
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/nvim-treesitter-context",
    url = "https://github.com/romgrk/nvim-treesitter-context"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\nN\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\vdefult\2\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/kyazdani42/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/popup.nvim",
    url = "https://github.com/nvim-lua/popup.nvim"
  },
  ["telescope-live-grep-raw.nvim"] = {
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/telescope-live-grep-raw.nvim",
    url = "https://github.com/nvim-telescope/telescope-live-grep-raw.nvim"
  },
  ["telescope.nvim"] = {
    config = { "\27LJ\2\n◊\16\0\0\b\0J\0p6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0029\0\3\0'\2\4\0B\0\2\0026\1\5\0009\1\6\1\18\3\0\0'\4\a\0B\1\3\0016\1\0\0'\3\b\0B\1\2\0029\1\t\0015\3\n\0005\4\v\0=\4\f\0035\4\r\0005\5\14\0=\5\15\0045\5\16\0=\5\f\0045\5\17\0=\5\18\4=\4\19\0035\4\20\0=\4\18\0035\4\21\0=\4\22\0035\4\23\0=\4\24\0035\4\25\0=\4\26\0035\4\27\0=\4\28\0035\4\29\0=\4\30\0035\4\31\0=\4\15\0035\4 \0=\4!\0035\4\"\0=\4#\0035\4$\0B\1\3\0016\1\0\0'\3%\0B\1\2\0029\1&\0015\3G\0005\4(\0005\5'\0=\5)\0045\5*\0=\5+\0045\5,\0=\5\4\0046\5\0\0'\a-\0B\5\2\0029\5.\5=\5/\0046\5\0\0'\a-\0B\5\2\0029\0050\5=\0051\0046\5\0\0'\a2\0B\5\2\0029\0053\0059\0054\5=\0055\0046\5\0\0'\a2\0B\5\2\0029\0056\0059\0054\5=\0057\0046\5\0\0'\a2\0B\5\2\0029\0058\0059\0054\5=\0059\0044\5\0\0=\5:\0045\5;\0=\5<\0045\5=\0=\5>\0045\5?\0=\5+\0046\5\0\0'\a2\0B\5\2\0029\5@\5=\5@\0045\5B\0005\6A\0=\6C\0055\6D\0=\6E\5=\5F\4=\4H\0034\4\0\0=\4I\3B\1\2\1K\0\1\0\15extensions\rdefaults\1\0\0\18layout_config\rvertical\1\0\1\vmirror\1\15horizontal\1\0\0\1\0\2\20prompt_position\btop\vmirror\1\27buffer_previewer_maker\1\2\0\0\rabsolute\fset_env\1\0\1\14COLORTERM\14truecolor\16borderchars\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚ï≠\b‚ïÆ\b‚ïØ\b‚ï∞\vborder\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\19generic_sorter\29get_generic_fuzzy_sorter\16file_sorter\19get_fuzzy_file\22telescope.sorters\1\b\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\17path_display\1\0\1\rtruncate\3\2\25file_ignore_patterns\1\0\n\17initial_mode\vinsert\23selection_strategy\nreset\ruse_less\2\19color_devicons\2\21sorting_strategy\14ascending\20layout_strategy\15horizontal\17entry_prefix\a  \20selection_caret\t‚û§ \18prompt_prefix\rüîéÔ∏é \rwinblend\3\0\1\4\0\0\f.git/.*\14vendor/.*\16composer/.*\nsetup\14telescope\1\0\1\vprefix\14<Leader>f\6p\1\3\0\0\\<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>\29Colorscheme with Preview\6a\1\3\0\0(<cmd>Telescope lsp_code_actions<CR>\21LSP code actions\1\3\0\0005<cmd>Telescope lsp_dynamic_workspace_symbols<CR>\26LSP workspace symbols\6r\1\3\0\0&<cmd>Telescope lsp_references<CR>\19LSP references\6o\1\3\0\0 <cmd>Telescope oldfiles<CR>\14Old files\6g\1\3\0\0!<cmd>Telescope live_grep<CR>\14Live grep\6t\1\3\0\0\"<cmd>Telescope treesitter<CR>\15Treesitter\6h\1\3\0\0!<cmd>Telescope help_tags<CR>\14Help tags\1\3\0\0\31<cmd>Telescope buffers<CR>\fBuffers\6G\6b\1\3\0\0$<cmd>Telescope git_branches<CR>\rBranches\1\3\0\0!<cmd>Telescope git_files<CR>\nFiles\6s\1\3\0\0\"<cmd>Telescope git_status<CR>\vStatus\1\0\1\tname\bGit\6f\1\3\0\0.<cmd>Telescope find_files hidden=true<CR>\nFiles\1\0\1\tname\14Telescope\rregister\14which-key\r--hidden\vinsert\ntable\22vimgrep_arguments\bget\17set_defaults\21telescope.config\frequire\0" },
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  undotree = {
    config = { "\27LJ\2\nõ\1\0\0\4\0\t\0\r6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\a\0005\3\6\0=\3\b\2B\0\2\1K\0\1\0\14<Leader>u\1\0\0\1\3\0\0\24:UndotreeToggle<CR>\21Toggle undo tree\rregister\14which-key\frequire\rundofile\6o\bvim\0" },
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/undotree",
    url = "https://github.com/mbbill/undotree"
  },
  ["vim-commentary"] = {
    config = { "\27LJ\2\nÄ\1\0\0\5\0\6\0\f6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\1\0B\1\2\0029\1\2\0015\3\4\0005\4\3\0=\4\5\3B\1\2\1K\0\1\0\14<Leader>c\1\0\0\1\3\0\0\20:Commentary<CR>\17Comment line\rregister\14which-key\frequire\0" },
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/vim-commentary",
    url = "https://github.com/tpope/vim-commentary"
  },
  ["vim-move"] = {
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/vim-move",
    url = "https://github.com/matze/vim-move"
  },
  ["vim-plugin-ruscmd"] = {
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/vim-plugin-ruscmd",
    url = "https://github.com/powerman/vim-plugin-ruscmd"
  },
  ["vim-searchindex"] = {
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/vim-searchindex",
    url = "https://github.com/google/vim-searchindex"
  },
  ["which-key.nvim"] = {
    config = { "\27LJ\2\n‚\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\fpresets\1\0\a\fmotions\2\14operators\2\6g\2\6z\2\bnav\2\fwindows\2\17text_objects\2\rspelling\1\0\2\fenabled\1\16suggestions\3\20\1\0\4\19ignore_missing\2\rtriggers\tauto\14registers\2\nmarks\2\nsetup\14which-key\frequire\0" },
    loaded = true,
    path = "/home/kadyklesha/.local/share/nvim/site/pack/packer/start/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\nN\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\vdefult\2\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n^\0\0\4\0\a\0\f6\0\0\0009\0\1\0)\1\2\0=\1\2\0006\0\0\0009\0\3\0009\0\4\0\18\2\0\0009\0\5\0'\3\6\0B\0\3\1K\0\1\0\6c\vappend\14shortmess\bopt\14cmdheight\6o\bvim\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: undotree
time([[Config for undotree]], true)
try_loadstring("\27LJ\2\nõ\1\0\0\4\0\t\0\r6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\3\0'\2\4\0B\0\2\0029\0\5\0005\2\a\0005\3\6\0=\3\b\2B\0\2\1K\0\1\0\14<Leader>u\1\0\0\1\3\0\0\24:UndotreeToggle<CR>\21Toggle undo tree\rregister\14which-key\frequire\rundofile\6o\bvim\0", "config", "undotree")
time([[Config for undotree]], false)
-- Config for: nvim-colorizer.lua
time([[Config for nvim-colorizer.lua]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14colorizer\frequire\0", "config", "nvim-colorizer.lua")
time([[Config for nvim-colorizer.lua]], false)
-- Config for: nvim-scrollview
time([[Config for nvim-scrollview]], true)
try_loadstring("\27LJ\2\nH\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0) highlight link ScrollView WildMenu \bcmd\bvim\0", "config", "nvim-scrollview")
time([[Config for nvim-scrollview]], false)
-- Config for: telescope.nvim
time([[Config for telescope.nvim]], true)
try_loadstring("\27LJ\2\n◊\16\0\0\b\0J\0p6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0029\0\3\0'\2\4\0B\0\2\0026\1\5\0009\1\6\1\18\3\0\0'\4\a\0B\1\3\0016\1\0\0'\3\b\0B\1\2\0029\1\t\0015\3\n\0005\4\v\0=\4\f\0035\4\r\0005\5\14\0=\5\15\0045\5\16\0=\5\f\0045\5\17\0=\5\18\4=\4\19\0035\4\20\0=\4\18\0035\4\21\0=\4\22\0035\4\23\0=\4\24\0035\4\25\0=\4\26\0035\4\27\0=\4\28\0035\4\29\0=\4\30\0035\4\31\0=\4\15\0035\4 \0=\4!\0035\4\"\0=\4#\0035\4$\0B\1\3\0016\1\0\0'\3%\0B\1\2\0029\1&\0015\3G\0005\4(\0005\5'\0=\5)\0045\5*\0=\5+\0045\5,\0=\5\4\0046\5\0\0'\a-\0B\5\2\0029\5.\5=\5/\0046\5\0\0'\a-\0B\5\2\0029\0050\5=\0051\0046\5\0\0'\a2\0B\5\2\0029\0053\0059\0054\5=\0055\0046\5\0\0'\a2\0B\5\2\0029\0056\0059\0054\5=\0057\0046\5\0\0'\a2\0B\5\2\0029\0058\0059\0054\5=\0059\0044\5\0\0=\5:\0045\5;\0=\5<\0045\5=\0=\5>\0045\5?\0=\5+\0046\5\0\0'\a2\0B\5\2\0029\5@\5=\5@\0045\5B\0005\6A\0=\6C\0055\6D\0=\6E\5=\5F\4=\4H\0034\4\0\0=\4I\3B\1\2\1K\0\1\0\15extensions\rdefaults\1\0\0\18layout_config\rvertical\1\0\1\vmirror\1\15horizontal\1\0\0\1\0\2\20prompt_position\btop\vmirror\1\27buffer_previewer_maker\1\2\0\0\rabsolute\fset_env\1\0\1\14COLORTERM\14truecolor\16borderchars\1\t\0\0\b‚îÄ\b‚îÇ\b‚îÄ\b‚îÇ\b‚ï≠\b‚ïÆ\b‚ïØ\b‚ï∞\vborder\21qflist_previewer\22vim_buffer_qflist\19grep_previewer\23vim_buffer_vimgrep\19file_previewer\bnew\19vim_buffer_cat\25telescope.previewers\19generic_sorter\29get_generic_fuzzy_sorter\16file_sorter\19get_fuzzy_file\22telescope.sorters\1\b\0\0\arg\18--color=never\17--no-heading\20--with-filename\18--line-number\r--column\17--smart-case\17path_display\1\0\1\rtruncate\3\2\25file_ignore_patterns\1\0\n\17initial_mode\vinsert\23selection_strategy\nreset\ruse_less\2\19color_devicons\2\21sorting_strategy\14ascending\20layout_strategy\15horizontal\17entry_prefix\a  \20selection_caret\t‚û§ \18prompt_prefix\rüîéÔ∏é \rwinblend\3\0\1\4\0\0\f.git/.*\14vendor/.*\16composer/.*\nsetup\14telescope\1\0\1\vprefix\14<Leader>f\6p\1\3\0\0\\<cmd>lua require('telescope.builtin.internal').colorscheme({enable_preview = true})<cr>\29Colorscheme with Preview\6a\1\3\0\0(<cmd>Telescope lsp_code_actions<CR>\21LSP code actions\1\3\0\0005<cmd>Telescope lsp_dynamic_workspace_symbols<CR>\26LSP workspace symbols\6r\1\3\0\0&<cmd>Telescope lsp_references<CR>\19LSP references\6o\1\3\0\0 <cmd>Telescope oldfiles<CR>\14Old files\6g\1\3\0\0!<cmd>Telescope live_grep<CR>\14Live grep\6t\1\3\0\0\"<cmd>Telescope treesitter<CR>\15Treesitter\6h\1\3\0\0!<cmd>Telescope help_tags<CR>\14Help tags\1\3\0\0\31<cmd>Telescope buffers<CR>\fBuffers\6G\6b\1\3\0\0$<cmd>Telescope git_branches<CR>\rBranches\1\3\0\0!<cmd>Telescope git_files<CR>\nFiles\6s\1\3\0\0\"<cmd>Telescope git_status<CR>\vStatus\1\0\1\tname\bGit\6f\1\3\0\0.<cmd>Telescope find_files hidden=true<CR>\nFiles\1\0\1\tname\14Telescope\rregister\14which-key\r--hidden\vinsert\ntable\22vimgrep_arguments\bget\17set_defaults\21telescope.config\frequire\0", "config", "telescope.nvim")
time([[Config for telescope.nvim]], false)
-- Config for: vim-commentary
time([[Config for vim-commentary]], true)
try_loadstring("\27LJ\2\nÄ\1\0\0\5\0\6\0\f6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\1\0B\1\2\0029\1\2\0015\3\4\0005\4\3\0=\4\5\3B\1\2\1K\0\1\0\14<Leader>c\1\0\0\1\3\0\0\20:Commentary<CR>\17Comment line\rregister\14which-key\frequire\0", "config", "vim-commentary")
time([[Config for vim-commentary]], false)
-- Config for: gruvbox
time([[Config for gruvbox]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\24colorscheme gruvbox\bcmd\bvim\0", "config", "gruvbox")
time([[Config for gruvbox]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nç\2\0\0\4\0\15\0\0236\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0)\1\20\0=\1\6\0006\0\a\0'\2\b\0B\0\2\0029\0\t\0005\2\n\0005\3\v\0=\3\f\0025\3\r\0=\3\14\2B\0\2\1K\0\1\0\fautotag\1\0\1\venable\2\14highlight\1\0\1\venable\1\1\0\1\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\14foldlevel\31nvim_treesitter#foldexpr()\rfoldexpr\texpr\15foldmethod\6o\bvim\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: which-key.nvim
time([[Config for which-key.nvim]], true)
try_loadstring("\27LJ\2\n‚\1\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\fpresets\1\0\a\fmotions\2\14operators\2\6g\2\6z\2\bnav\2\fwindows\2\17text_objects\2\rspelling\1\0\2\fenabled\1\16suggestions\3\20\1\0\4\19ignore_missing\2\rtriggers\tauto\14registers\2\nmarks\2\nsetup\14which-key\frequire\0", "config", "which-key.nvim")
time([[Config for which-key.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\n™\4\0\0\n\0\18\0\0276\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\0036\4\6\0009\4\a\4'\6\b\0'\a\t\0'\b\n\0B\4\4\2=\4\v\0035\4\f\0005\5\r\0=\5\14\0046\5\6\0009\5\a\5'\a\15\0'\b\t\0'\t\n\0B\5\4\2=\5\16\4=\4\17\3B\1\2\1K\0\1\0\14fast_wrap\fpattern\25 [%'%\"%)%>%]%)%}%,] \nchars\1\6\0\0\6{\6[\6(\6\"\6'\1\0\a\14highlight\vSearch\tkeys\31qwertyuiopzxcvbnmasdfghjkl\19highlight_grey\fComment\fend_key\6$\voffset\3\0\bmap\n<A-e>\16check_comma\2\22ignored_next_char\5\b%s+\21 [%w%%%'%[%\"%.] \tgsub\vstring\21disable_filetype\1\0\t\30enable_check_bracket_line\2\22enable_afterquote\2\21enable_moveright\2\27disable_in_visualblock\1\21disable_in_macro\1\fmap_c_w\1\fmap_c_h\1\vmap_bs\2\rcheck_ts\1\1\2\0\0\20TelescopePrompt\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\nî\a\0\0\b\0(\00025\0\3\0005\1\1\0005\2\0\0=\2\2\1=\1\4\0005\1\6\0005\2\5\0=\2\2\1=\1\a\0005\1\b\0=\1\t\0006\1\n\0'\3\v\0B\1\2\0029\1\f\0015\3\19\0005\4\r\0005\5\14\0=\5\15\0045\5\16\0=\5\17\0044\5\0\0=\5\18\4=\4\20\0035\4\22\0005\5\21\0=\5\2\0045\5\23\0=\5\24\0044\5\3\0005\6\25\0>\6\1\5=\5\26\0045\5 \0005\6\27\0005\a\28\0=\a\29\0065\a\30\0=\a\31\6>\6\1\5=\5!\0045\5\"\0=\5#\0045\5$\0=\5%\4=\4\4\0035\4&\0=\4'\3B\1\2\1K\0\1\0\15extensions\1\6\0\0\rfugitive\rquickfix\bfzf\15toggleterm\20symbols-outline\14lualine_z\1\2\0\0\rlocation\14lualine_y\1\2\0\0\rprogress\14lualine_x\1\5\0\0\0\rencoding\15fileformat\rfiletype\22diagnostics_color\1\0\4\twarn\20VirtualTextWarn\tinfo\20VirtualTextInfo\thint\20VirtualTextHint\nerror\21VirtualTextError\fsources\1\2\0\0\20nvim_diagnostic\1\2\0\0\16diagnostics\14lualine_c\1\2\1\0\rfilename\tpath\3\1\14lualine_b\1\2\0\0\vbranch\1\0\0\1\2\0\0\tmode\foptions\1\0\0\23disabled_filetypes\23section_separators\1\0\2\nright\5\tleft\5\25component_separators\1\0\2\nright\5\tleft\5\1\0\3\25always_divide_middle\2\ntheme\17gruvbox_dark\18icons_enabled\2\nsetup\flualine\frequire\14filetypes\1\6\0\0\17dapui_scopes\18dapui_watches\17dapui_stacks\22dapui_breakpoints\rdap-repl\22inactive_sections\1\0\0\1\2\0\0\rfilename\rsections\1\0\0\14lualine_a\1\0\0\1\3\0\0\tmode\rfilename\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: cheatsheet.nvim
time([[Config for cheatsheet.nvim]], true)
try_loadstring("\27LJ\2\nï\1\0\0\5\0\a\0\n6\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0035\4\6\0B\1\3\1K\0\1\0\1\0\1\vprefix\14<Leader>f\6d\1\3\0\0\24<cmd>Cheatsheet<CR>\15Cheatsheet\1\0\1\tname\14Telescope\rregister\14which-key\frequire\0", "config", "cheatsheet.nvim")
time([[Config for cheatsheet.nvim]], false)
-- Config for: bufferline.nvim
time([[Config for bufferline.nvim]], true)
try_loadstring("\27LJ\2\ng\0\1\5\0\a\0\0149\1\0\0\18\3\1\0009\1\1\1'\4\2\0B\1\3\2\15\0\1\0X\2\6Ä6\1\3\0009\1\4\0019\1\5\0019\3\0\0'\4\6\0D\1\3\0K\0\1\0\t:t:r\16fnamemodify\afn\bvim\t%.md\nmatch\tnameØ\4\1\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0003\4\4\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\foptions\1\0\0\19name_formatter\0\1\0\22\20separator_style\nthick\25enforce_regular_tabs\2\23left_mouse_command\14buffer %d\24right_mouse_command\16bdelete! %d\27always_show_bufferline\2\18close_command\16bdelete! %d\fsort_by\aid\fnumbers\fordinal\24persist_buffer_sort\2\24show_tab_indicators\2\20show_close_icon\2\28show_buffer_close_icons\2\22show_buffer_icons\1\rtab_size\3\18\22max_prefix_length\3\15\20max_name_length\3\18\23right_trunc_marker\bÔÇ©\22left_trunc_marker\bÔÇ®\15close_icon\bÔÄç\18modified_icon\b‚óè\22buffer_close_icon\bÔôï\19indicator_icon\b‚ñé\nsetup\15bufferline\frequire\0", "config", "bufferline.nvim")
time([[Config for bufferline.nvim]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\n◊\3\0\0\6\0\20\0\0266\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\4\0005\4\3\0=\4\5\0035\4\6\0=\4\a\0035\4\b\0=\4\t\0035\4\n\0=\4\v\3B\1\2\0016\1\0\0'\3\f\0B\1\2\0029\2\r\0015\4\14\0005\5\15\0=\5\16\0045\5\17\0=\5\18\0045\5\19\0B\2\3\1K\0\1\0\1\0\1\vprefix\14<Leader>c\6r\1\3\0\0\28<cmd>Lspsaga rename<CR>\vRename\6g\1\3\0\0 <cmd>Lspsaga lsp_finder<CR>\vFinder\1\0\1\tname\tCode\rregister\14which-key\23rename_action_keys\1\0\2\texec\t<CR>\tquit\n<C-c>\21code_action_keys\1\0\2\texec\t<CR>\tquit\6q\23finder_action_keys\1\0\6\vvsplit\6s\nsplit\6i\16scroll_down\n<C-f>\tquit\6q\topen\6o\14scroll_up\n<C-b>\23code_action_prompt\1\0\0\1\0\1\venable\2\18init_lsp_saga\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
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
