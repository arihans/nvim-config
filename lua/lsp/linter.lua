-----------------------------------------------------------
-- An asynchronous linter plugin complementary to the built-in LSP support.
-----------------------------------------------------------

-- See: https://github.com/mfussenegger/nvim-lint

local lint_status_ok, lint = pcall(require, 'lint')
if not lint_status_ok then
    return
end

lint.linters_by_ft = {
    javascript = { 'eslint_d' },
}
