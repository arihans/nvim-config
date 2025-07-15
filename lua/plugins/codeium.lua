-----------------------------------------------------------
-- Codeium configuratio file
-----------------------------------------------------------

-- Plugin: codeium
-- url: https://github.com/Exafunction/codeium.vim/tree/main

local status_ok = pcall(require, 'codeium')
if not status_ok then
    return
end

vim.g.codeium_disable_bindings = 1
vim.g.codeium_enabled = false
