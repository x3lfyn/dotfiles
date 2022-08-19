require [[keys/util]]

vim.g.mapleader = ' '

-- nvimtree
nm('<F5>', '<cmd>NvimTreeToggle<CR>')

-- LSP
nm('K', '<cmd>lua vim.lsp.buf.hover()<CR>') -- object hover
nm('gf', '<cmd>lia vim.lsp.buf.formatting()<CR>') -- format object
nm('ga', '<cmd>lua vim.lsp.buf.code_action()<CR>')
nm('gR', '<cmd>lua vim.lsp.buf.rename()<CR>')
