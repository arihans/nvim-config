-----------------------------------------------------------
-- Rose-Pine theme configuration file
-----------------------------------------------------------

-- Default : https://github.com/rose-pine/neovim#options

local status_ok, rose_pine = pcall(require, 'rose-pine')
if not status_ok then
  return
end

local colorscheme_variant_list = {'main', 'moon'}

if vim.tbl_contains(colorscheme_variant_list, vim.g.colorscheme_variant) then
  dark_variant = vim.g.colorscheme_variant
else
  dark_variant = 'main'
end

rose_pine.setup({
  dark_variant = dark_variant
})
vim.cmd('colorscheme rose-pine')


-----------------------------------------------------------
-- Statusline color schemes

local st = {}

-- Theme: Rosé Pine (main)
-- Colors: https://github.com/rose-pine/neovim/blob/main/lua/rose-pine/palette.lua
-- color names are adapted to the formats above
st.main = {
  bg = '#111019', --default: #191724
  fg = '#e0def4',
  pink = '#eb5f92',
  green = '#9ccfd8',
  cyan = '#31748f',
  yellow = '#f6c177',
  orange = '#2a2837',
  red = '#ebbcba',
}

return {statusline = st}
