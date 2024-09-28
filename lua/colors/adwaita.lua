-----------------------------------------------------------
-- Adwaita theme configuration file
-----------------------------------------------------------

-- Default : https://github.com/Mofiqul/adwaita.nvim#-usage

vim.g.adwaita_darker = false -- for darker version
vim.g.adwaita_disable_cursorline = true -- to disable cursorline
vim.o.background = _G.dark
vim.cmd([[colorscheme adwaita]])


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
