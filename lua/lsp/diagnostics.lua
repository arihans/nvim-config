-----------------------------------------------------------
-- Diagnostic options
-----------------------------------------------------------

-- See: `:help vim.diagnostic.config`

vim.diagnostic.config({
    update_in_insert = true,
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
})

-- Show line diagnostics automatically in hover window
-- vim.cmd([[
--   autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false })
-- ]])

-- Show icons
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
  local hl = "DiagnosticSign" .. type
  vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end
