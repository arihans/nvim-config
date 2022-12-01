-----------------------------------------------------------
-- Define keymaps of Neovim and installed plugins.
-----------------------------------------------------------

local function map(mode, lhs, rhs, opts)
    local options = { noremap = true, silent = false }
    if opts then
        options = vim.tbl_extend('force', options, opts)
    end
    vim.keymap.set(mode, lhs, rhs, options)
end

-- Change leader to a comma
vim.g.mapleader = ' '

-----------------------------------------------------------
-- Neovim shortcuts
-----------------------------------------------------------

-- Fuck Escape
map('i', 'jk', '<Esc>')
map('i', 'kj', '<Esc>')

-- Better buffer navigation
map('n', '<TAB>', ':bnext<CR>')
map('n', '<S-TAB>', ':bprevious<CR>')

-- Clear search highlighting
map('n', '<CR>', ':nohl<CR><CR>')
-- &
--Use ctrl-c instead of escape in normal mode
map('n', '<C-c>', ':nohl<CR><Esc>')

-- Use ctrl-c instead of escape in normal mode
-- map('n', '<C-c>', '<Esc>')

-- Custom Text Objects ---------------
-- Inner line textobj
vim.keymap.set({'x', 'o'}, 'il', ':<C-u>normal ^vg_<CR>', { silent = true })

-- Around line textobj
vim.keymap.set({'x', 'o'}, 'al', ':<C-u>normal 0vg_<CR>', { silent = true })
---------------------------------------

-- Toggle auto-indenting for code paste
map('n', '<F2>', ':set invpaste paste?<CR>')

-- Better tabbling
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Split Management ------------------
-- Change split orientation
map('n', '<leader>tk', '<C-w>t<C-w>K') -- change vertical to horizontal
map('n', '<leader>th', '<C-w>t<C-w>H') -- change horizontal to vertical

-- Move around splits using Ctrl + {h,j,k,l}
map('n', '<C-h>', '<C-w>h')
map('i', '<C-h>', '<Esc><C-w>ha')
map('n', '<C-j>', '<C-w>j')
map('i', '<C-j>', '<Esc><C-w>ja')
map('n', '<C-k>', '<C-w>k')
map('i', '<C-k>', '<Esc><C-w>ka')
map('n', '<C-l>', '<C-w>l')
map('i', '<C-l>', '<Esc><C-w>la')

-- Resize splits
map('n', '<M-h>', ':vertical resize -2<CR>')
map('n', '<M-j>', ':resize -2<CR>')
map('n', '<M-k>', ':resize +2<CR>')
map('n', '<M-l>', ':vertical resize +2<CR>')
---------------------------------------

-- Delete Buffers --------------------
-- Deletes current buffer
map('n', '<leader>w', function()
    if #vim.fn.getbufinfo({ buflisted = 1 }) > 1 and pcall(vim.cmd, 'bd') then
        print('⚠ Buffer Deleted')
    else
        print('⚠ Failed to delete buffer')
    end
end)
-- Deletes everything except current buffer
map('n', '<leader>W', ':%bd|e#|bd#<CR>')
---------------------------------------

-- Black Hole Register ----------------
-- Map d to black hole register
map({'n', 'v'}, 'd', '"_d')

-- Map c to black hole register
map({'n', 'v'}, 'c', '"_c')

-- Map s to black hole register
-- map('n', 's', '"_s')
-- map('v', 's', '"_s')
---------------------------------------

-- Replace current word/selection with last yanked text
map('n', 's', function()
    vim.fn.setreg('"', vim.fn.getreg('"'):gsub("\n", ""))
    vim.cmd('normal ""p')
end)
map('v', 's', function()
    vim.fn.setreg('*', vim.fn.getreg('*'):gsub("\n", ""))
    vim.cmd('normal "*p')
end)

-- Open url
map('n', 'gx', 'viW:<C-u> lua Utils.openURL()<CR>', { silent = true })
map('v', 'gx', ':<C-u> lua Utils.openURL()<CR>', { silent = true })

-- Set working directory to the current file
map('n', '<leader>cd', ':cd %:p:h<cr>')

-- Allow saving of files as sudo when I forgot to start vim using sudo.
-- map('c', 'w!!', vim.cmd('w !sudo tee > /dev/null %'))

-- -- Reload configuration without restart nvim
-- map('n', '<leader>r', ':<C-u> lua Utils.reloadConfig()<CR>')

-----------------------------------------------------------
-- Applications and Plugins shortcuts
-----------------------------------------------------------

-- Terminal mappings
map('n', '<C-t>', ':Term<CR>', { noremap = true }) -- open
map('t', '<Esc>', '<C-\\><C-n>') -- exit

-- NvimTree
map('n', '<C-n>', ':NvimTreeToggle<CR>') -- open/close

-- UndoTree --------------------------
map('n', '<leader>ut', ':UndotreeToggle<CR>')
-- UndoTree change layout
map('n', '<leader>ul', function() vim.g.undotree_ToggleLayout() end)
map('n', '<leader>uu', '') -- capture key
---------------------------------------

-- Tagbar
map('n', '<leader>tb', ':TagbarToggle<CR>') -- open/close

-- Telescope
map('n', '<leader>ff', '<cmd>Telescope find_files<CR>')
map('n', '<leader>fg', '<cmd>Telescope live_grep<CR>')
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>')
map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>')

-- Colorizer
map('n', '<leader>cb', '<cmd>ColorizerToggle<CR>')
