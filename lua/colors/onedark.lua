-----------------------------------------------------------
-- OneDark theme configuration file
-----------------------------------------------------------

-- Default : https://github.com/navarasu/onedark.nvim#default-configuration

local status_ok, onedark = pcall(require, 'onedark')
if not status_ok then
    return
end

local colorscheme_variant_list = { 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer', 'light' }

if vim.tbl_contains(colorscheme_variant_list, vim.g.colorscheme_variant) then
    style = vim.g.colorscheme_variant
else
    style = 'dark'
end

onedark.setup {
    style = style
}
onedark.load()


-----------------------------------------------------------
-- Statusline color schemes

local st = {}

-- Theme: OneDark (dark)
-- Colors: https://github.com/navarasu/onedark.nvim/blob/master/lua/onedark/palette.lua
st.dark = {
    bg = '#191c29',
    fg = '#b2bbcc',
    pink = '#c678dd',
    green = '#98c379',
    cyan = '#56b6c2',
    yellow = '#e5c07b',
    orange = '#d19a66',
    red = '#e86671',
}

return { statusline = st }
