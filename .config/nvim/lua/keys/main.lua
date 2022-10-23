require [[keys/util]]

-- more comfortable switching between windows
nm('<C-h>', '<C-w>h')
nm('<C-j>', '<C-w>j')
nm('<C-k>', '<C-w>k')
nm('<C-l>', '<C-w>l')

-- don't cut on delete
nm('d', '"_d')
vm('d', '"_d')

-- cycle through buffers
nm('<Tab>', '<cmd>BufferLineCycleNext<CR>')
nm('<S-Tab>', '<cmd>BufferLineCyclePrev<CR>')

-- exit from terminal on Shift-Esc
tm('<S-Esc>', '<C-\\><C-n>')

-- delete buffer on d[elete]b[uffer]
nm('db', '<cmd>bd<CR>')

-- hjkl in insert mode
im('<C-h>', '<Left>')
im('<C-j>', '<Down>')
im('<C-k>', '<Up>')
im('<C-l>', '<Right>')
