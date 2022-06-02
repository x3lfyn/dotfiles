local map = vim.api.nvim_set_keymap

local default_opts = { noremap = true, silent = true }

-- pain!!!
map('', '<up>', ':echoe "Use k"<CR>', { noremap = true, silent = false })
map('', '<down>', ':echoe "Use j"<CR>', { noremap = true, silent = false })
map('', '<left>', ':echoe "Use h"<CR>', { noremap = true, silent = false })
map('', '<right>', ':echoe "Use l"<CR>', { noremap = true, silent = false })

-- files tree
map('', '<F5>', ':NvimTreeToggle<CR>', default_opts)


-- switch between buffers
map('n', '<Tab>', ':BufferLineCycleNext<CR>', default_opts)
map('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', default_opts)

-- navigate between windows
map('n', '<C-h>', '<C-w>h', default_opts)
map('n', '<C-j>', '<C-w>j', default_opts)
map('n', '<C-k>', '<C-w>k', default_opts)
map('n', '<C-l>', '<C-w>l', default_opts)


-- exit from insert by jj
map('i', 'jj', '<Esc>', { noremap = true })

-- navigating in insert mode
map('i', '<C-h>', '<Left>', {})
map('i', '<C-j>', '<Down>', {})
map('i', '<C-k>', '<Up>', {})
map('i', '<C-l>', '<Right>', {})
