-----------------------------------------------------------
-- Monokai theme configuration file
-----------------------------------------------------------

-- Default : https://github.com/tanvirtin/monokai.nvim#customization

local status_ok, monokai = pcall(require, 'monokai')
if not status_ok then
  return
end

local colorscheme_variant = vim.g.colorscheme_variant
local colorscheme_variant_list = {'pro', 'soda', 'ristretto'}

if vim.tbl_contains(colorscheme_variant_list, vim.g.colorscheme_variant) then
  palette = monokai[colorscheme_variant]
else
  palette = monokai.classic
end

-- Example : require('monokai').setup { palette = require('monokai').pro }
monokai.setup {
  palette = palette
}


-----------------------------------------------------------
-- Statusline color schemes

local st = {}

-- Theme: Monokai (classic)
-- Colors: https://github.com/tanvirtin/monokai.nvim/blob/master/lua/monokai.lua
st.monokai = {
  bg = '#202328', --default: #272a30
  fg = '#f8f8f0',
  pink = '#f92672',
  green = '#a6e22e',
  cyan = '#66d9ef',
  yellow = '#e6db74',
  orange = '#fd971f',
  red = '#e95678',
}

return {statusline = st}
