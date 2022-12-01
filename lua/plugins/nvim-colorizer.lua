-----------------------------------------------------------
-- Color Highlighter configuration file
-----------------------------------------------------------

-- Plugin: nvim-colorizer
-- url: https://github.com/NvChad/nvim-colorizer.lua

local status_ok, colorizer = pcall(require, 'colorizer')
if not status_ok then
  return
end

colorizer.setup {
  filetypes = {
    'css',
    'javascript',
    html = { mode = 'foreground'; }
  },
}
