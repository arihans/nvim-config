-----------------------------------------------------------
-- OneDark-Mono theme configuration file
-----------------------------------------------------------

-- Original : https://github.com/navarasu/onedark.nvim#default-configuration
-- Modifier theme : https://github.com/witalihirsch/Mono-gtk-theme

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
    style = style,
    transparent = true,
    highlights = {
        VertSplit = { fg = '#373737' },
        ColorColumn = { bg = '#282828' },
    }
}
onedark.load()


-----------------------------------------------------------
-- Statusline color schemes

local sl = {}

sl.dark = {
    bg = '#252525',
    fg = '#ffffff',
    pink = '#ff69b4',
    green = '#b5e98a',
    cyan = '#83b6ec',
    yellow = '#f8e359',
    orange = '#ffa95a',
    red = '#c92c3c',
}

-----------------------------------------------------------
-- Bufferline color schemes

local bl = {}

bl.dark = {
    bg = '#252525',
    bg_sel = '#3b3b3b',
    fg = '#ffffff',
    pink = '#ff69b4',
    green = '#b5e98a',
    cyan = '#83b6ec',
    yellow = '#f8e359',
    orange = '#ffa95a',
    red = '#c92c3c',
}

return { statusline = sl, bufferline = bl }
