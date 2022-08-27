require [[keys/util]]

vim.g.mapleader = ' '

-- nvimtree
nm('<F5>', '<cmd>NvimTreeToggle<CR>')

-- LSP
nm('K', '<cmd>lua vim.lsp.buf.hover()<CR>') -- object hover
nm('gf', '<cmd>lia vim.lsp.buf.formatting()<CR>') -- format object
nm('ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
nm('gR', '<cmd>lua vim.lsp.buf.rename()<CR>')

-- symbols panel
nm('<F6>', '<cmd>SymbolsOutline<CR>')

-- telescope
nm('<leader>l', '<cmd>Telescope find_files<CR>') -- search for files in working directory
nm('<leader>f', '<cmd>Telescope live_grep<CR>') -- search string in working directory
nm('<leader>s', '<cmd>Telescope grep_string<CR>') -- search for string under cursor
nm('<leader>b', '<cmd>Telescope buffers<CR>') -- buffers
nm('<leader>m', '<cmd>Telescope man_pages<CR>')
nm('<leader>d', '<cmd>Telescope diagnostics<CR>')
nm('<leader>cr', '<cmd>Telescope lsp_references<CR>')
nm('<leader>cd', '<cmd>Telescope lsp_definitions<CR>')
nm('<leader>ci', '<cmd>Telescope lsp_implementations<CR>')
nm('<leader>gc', '<cmd>Telescope git_commits<CR>')
nm('<leader>gb', '<cmd>Telescope git_branches<CR>')
nm('<leader>gs', '<cmd>Telescope git_status<CR>')

-- problems menu
nm('<leader>x','<cmd>TroubleToggle<CR>')
