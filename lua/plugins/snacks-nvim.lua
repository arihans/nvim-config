-----------------------------------------------------------
-- Snacks configuration file
-----------------------------------------------------------

-- Plugin: snacks-nvim
-- url: https://github.com/folke/snacks.nvim

local status_ok, snacks = pcall(require, 'snacks')
if not status_ok then
    return
end

snacks.setup({
    -- Add your plugin options here
})

