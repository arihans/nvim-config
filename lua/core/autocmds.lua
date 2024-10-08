-----------------------------------------------------------
-- Autocommand functions
-----------------------------------------------------------

-- Define autocommands with Lua APIs
-- See: h:api-autocmd, h:augroup

local augroup = vim.api.nvim_create_augroup -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd -- Create autocommand

-- Set ColorScheme
augroup('ReloadConfig', { clear = true })
autocmd('BufWritePost', {
    group = 'ReloadConfig',
    pattern = 'options.lua',
    callback = function()
        if pcall(require, 'colors/' .. vim.g.colorscheme) then
            print('[🎨] Colorscheme Reloaded')
            Utils.reloadConfig()
        else
            print('[🎨] Invalid colorscheme')
        end
    end
})
autocmd('UIEnter', {
    group = 'ReloadConfig',
    callback = function()
        vim.defer_fn(function()
            if pcall(require, 'colors/' .. vim.g.colorscheme) then
                print('[🎨] Colorscheme Reloaded')
            else
                print('[🎨] Invalid colorscheme')
            end
        end, 0)
    end
})

-- Update/Install Mason packages
augroup('MasonUpdate', { clear = true })
autocmd('BufWritePost', {
    group = 'MasonUpdate',
    pattern = 'lsp/init.lua,lsp/linter.lua',
    callback = function()
        Utils.updateMasonPackages()
    end,
})
autocmd('UIEnter', {
    group = 'MasonUpdate',
    callback = function()
        Utils.updateMasonPackages()
    end,
})

-- On any file write
autocmd('BufWritePost', {
    pattern = '*',
    callback = function()
        require('lint').try_lint()
    end
})

-- Highlight on yank
augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
    group = 'YankHighlight',
    callback = function()
        vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '1000' })
    end
})

-- Remove whitespace on save
autocmd('BufWritePre', {
    pattern = '',
    command = ":%s/\\s\\+$//e"
})

-- Don't auto commenting new lines
autocmd('BufEnter', {
    pattern = '',
    command = 'set fo-=c fo-=r fo-=o'
})

-- Settings for filetypes:
-- Disable line length marker
augroup('setLineLength', { clear = true })
autocmd('Filetype', {
    group = 'setLineLength',
    pattern = { 'text', 'markdown', 'html', 'xhtml', 'javascript', 'typescript' },
    command = 'setlocal cc=0'
})

-- Set indentation to 2 spaces
-- augroup('setIndent', { clear = true })
-- autocmd('Filetype', {
--   group = 'setIndent',
--   pattern = { 'xml', 'html', 'xhtml', 'css', 'scss', 'javascript', 'typescript',
--     'yaml', 'lua'
--   },
--   command = 'setlocal shiftwidth=2 tabstop=2'
-- })

-- Terminal settings:
-- Open a Terminal on the right tab
autocmd('CmdlineEnter', {
    command = 'command! Term :botright vsplit term://$SHELL'
})

-- Enter insert mode when switching to terminal
autocmd('TermOpen', {
    command = 'setlocal listchars= nonumber norelativenumber nocursorline',
})

autocmd('TermOpen', {
    pattern = '',
    command = 'startinsert'
})

-- Close terminal buffer on process exit
autocmd('BufLeave', {
    pattern = 'term://*',
    command = 'stopinsert'
})
