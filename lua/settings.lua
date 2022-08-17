local g = vim.g
local o = vim.o

o.termguicolors = true

o.timeoutlen = 500
o.updatetime = 200

o.scrolloff = 8

-- UI
o.number = true
o.numberwidth = 2
o.signcolumn = 'yes'
o.cursorline = true

o.expandtab = true
o.smarttab = true
o.cindent = true
o.autoindent = true
o.tabstop = 4
o.shiftwidth = 4
o.list = true
o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'

vim.cmd('colorscheme base16-dracula')

-- clipboard
o.clipboard = 'unnamedplus'

-- backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false

o.history = 100

-- splits
o.splitright = true
o.splitbelow = true

vim.opt.mouse = 'a'

g.mapleader = ' '
g.maplocalleader = ' '

-- Highlight the region on yank
vim.api.nvim_create_autocmd('TextYankPost', {
    group = num_au,
    callback = function()
        vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
    end,
})


