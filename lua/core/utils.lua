-----------------------------------------------------------
-- Define utility functions
-----------------------------------------------------------

_G.Utils = {}

-- Open visually selected URL -------------------------------------------------
Utils.openURL = function()
    local curpos = vim.api.nvim_win_get_cursor(0)
    local lmark = vim.api.nvim_buf_get_mark(0, '<')
    local rmark = vim.api.nvim_buf_get_mark(0, '>')
    vim.api.nvim_win_set_cursor(0, curpos)
    local url = vim.api.nvim_buf_get_text(0, lmark[1] - 1, lmark[2], rmark[1] - 1, rmark[2] + 1, {})[1]

    -- Open packer github links
    if vim.fn.expand('%'):match("^.+/(.+)$") == 'packer.lua' then
        url = url:match([["([^"]+)]]) or url:match([['([^']+)]])
        url = 'www.github.com/' .. url
    else
        _, _, url = url:find('%w*[////]?[:]?[.]?(%w+[.].*)')
    end

    print('🗘 Opening ' .. url .. ' in Firefox')
    vim.cmd('silent !firefox --new-tab ' .. '"' .. url .. '"')
end


-- Reloads config without restarting vim --------------------------------------
Utils.reloadConfig = function()
    for name, _ in pairs(package.loaded) do
        if name:match('/') then
            package.loaded[name] = nil
        end
    end

    if pcall(dofile, vim.fn.stdpath('config') .. '/init.lua') then
        print('✓ Config Reloaded')
    else
        print('✗ Failed to relad config')
    end
end


-- Installs LSPs --------------------------------------------------------------
Utils.update_LSP_servers = function()
    print('🗘 Updating LSP servers...')
    local registry = require 'mason-registry'
    for server, _ in pairs(LSP_servers) do
        local pkg = mason_lspconfig_to_package[server]
        if pkg then
            if not registry.is_installed(pkg) then
                print("[mason.nvim] installing " .. pkg)
                vim.cmd('MasonInstall ' .. pkg)
            end
        else
            print('[mason.nvim] Server ' .. pkg .. ' is not a valid entry')
        end
    end
    for _, pkg in ipairs(registry.get_installed_packages()) do
        local server = mason_package_to_lspconfig[pkg.name]
        if LSP_servers[server] == nil then
            print("[mason.nvim] uninstalling " .. pkg)
            vim.cmd('MasonUninstall ' .. pkg)
        end
    end
end
