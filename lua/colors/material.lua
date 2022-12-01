-----------------------------------------------------------
-- Material theme configuration file
-----------------------------------------------------------

-- Default : https://github.com/marko-cerovac/material.nvim

local status_ok, material = pcall(require, 'material')
if not status_ok then
    return
end

material.setup({
    plugins = {
        "dashboard",
        "nvim-cmp",
        "nvim-tree",
        "nvim-web-devicons",
        "telescope"
    }
})
vim.cmd 'colorscheme material'


-----------------------------------------------------------
-- Statusline color schemes

local st = {}

-- Theme: Material
-- Colors: https://github.com/Mofiqul/dracula.nvim/blob/main/lua/dracula/palette.lua
st.material = {
    bg     = "#212121",
    fg     = "#B0BEC5",
    red    = "#F07178",
    green  = "#C3E88D",
    yellow = "#FFCB6B",
    blue   = "#82AAFF",
    cyan   = "#89DDFF",
    purple = "#C792EA",
    orange = "#F78C6C",
    pink   = "#FF9CAC",
}

return { statusline = st }
