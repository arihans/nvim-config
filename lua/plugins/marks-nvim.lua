-----------------------------------------------------------
-- Marks.nvim configuration file
-----------------------------------------------------------

-- Plugin: marks.nvim
-- url: https://github.com/chentoast/marks.nvim

-- Default: https://github.com/chentoast/marks.nvim#setup

local status_ok, Marks = pcall(require, 'marks')
if not status_ok then
    return
end

Marks.setup {
    default_mappings = true,
    builtin_marks = { ".", "<", ">", "^" },
    cyclic = true,
    force_write_shada = false,
    refresh_interval = 250,
    sign_priority = { lower = 10, upper = 15, builtin = 8, bookmark = 20 },
    excluded_filetypes = {},
    bookmark_0 = {
        sign = "⚑",
        virt_text = "hello world",
        annotate = false,
    },
    mappings = {}
}
