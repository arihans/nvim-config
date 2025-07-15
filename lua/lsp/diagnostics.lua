-----------------------------------------------------------
-- Diagnostic options
-----------------------------------------------------------

-- See: `:help vim.diagnostic.config`

vim.diagnostic.config({
    update_in_insert = true,
    virtual_text = false,   -- Turn off inline diagnostics
    float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
    },
    -- Modern sign configuration using vim.diagnostic.config
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.HINT] = " ",
            [vim.diagnostic.severity.INFO] = " ",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
            [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
            [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
            [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
        },
    },
})

-- Show line diagnostics automatically in hover window
-- vim.cmd([[
--   autocmd CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, { focus = false })
-- ]])
