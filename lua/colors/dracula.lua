-----------------------------------------------------------
-- Dracula theme configuration file
-----------------------------------------------------------

-- Default : https://github.com/Mofiqul/dracula.nvim#-configuration

local status_ok, dracula = pcall(require, 'dracula')
if not status_ok then
    return
end

dracula.setup({
    overrides = {
        ColorColumn = { bg = "#2D303D" },
        BufferLineFill = { bg = "#191c29" }
    }
})
vim.cmd [[colorscheme dracula]]


-----------------------------------------------------------
-- Statusline color schemes

local st = {}

-- Theme: Draculla
-- Colors: https://github.com/Mofiqul/dracula.nvim/blob/main/lua/dracula/palette.lua
st.dracula = {
    bg = "#191c29",
    fg = "#F8F8F2",
    pink = "#FF79C6",
    green = "#50fa7b",
    cyan = "#8BE9FD",
    purple = "#BD93F9",
    yellow = "#F1FA8C",
    orange = "#FFB86C",
    red = "#FF5555",
}

return { statusline = st }
