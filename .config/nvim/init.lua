local cmd = vim.cmd
local exec = vim.api.nvim_exec
local g = vim.g
local opt = vim.opt
local o = vim.o

o.timeoutlen = 0
o.ttimeoutlen = 0

g.mapleader = " "

o.relativenumber = true
o.cursorline = true
o.number = true
o.numberwidth = 2
o.ignorecase = true
o.smartcase = true
o.wrap = true
o.mouse = "a"
o.scrolloff = 5
o.sidescrolloff = 8
o.hidden = true
o.writebackup = false
o.undofile = true
o.splitright = true
o.splitbelow = true

o.autoindent = true
o.smartindent = true

o.colorcolumn = "+1,120"
o.updatetime = 100
o.clipboard = "unnamedplus" -- shared clipboard with the system
o.tabstop = 2
o.shiftwidth = 2
o.expandtab = true
o.softtabstop = 2

o.termguicolors = true

opt.lazyredraw = true

-- bootstrap packer.nvim
local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end


require("plugins")(packer_bootstrap)

