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

    print('⏳⌛️ Opening ' .. url .. ' in Firefox')
    vim.cmd('silent !firefox --new-tab ' .. '"' .. url .. '"')
end


-- Reloads config without restarting vim --------------------------------------
Utils.reloadConfig = function()
    for name, _ in pairs(package.loaded) do
        if name:match('/') then
            package.loaded[name] = nil
        end
    end

    local success, error = pcall(dofile, vim.fn.stdpath('config') .. '/init.lua')

    if success then
        print('✓ Config Reloaded')
    else
        print('✗ Failed to reload config')
        print('ERROR :\n', error)
    end
end


-- Update Mason Packages ------------------------------------------------------
Utils.updateMasonPackages = function()
    print('⏳⌛️ Updating Mason packages...')
    local registry = require 'mason-registry'

    -- Function to install a package if not already installed
    local function installIfNotInstalled(pkg)
        if not registry.is_installed(pkg) then
            print("[mason.nvim] installing " .. pkg)
            vim.cmd('MasonInstall ' .. pkg)
        end
    end

    -- Initialize tables for LSP servers, linters, DAP clients, and formatters
    local LSP_servers = {}
    local linters = {}
    local dap_clients = {}
    local formatters = {}

    -- Populate LSP_servers
    for server, _ in pairs(_G.LSP_servers) do
        local pkg = mason_lspconfig_to_package[server]
        if pkg then
            table.insert(LSP_servers, pkg)
        end
    end

    -- Populate linters
    local lint = require('lint')
    for ft, linters_list in pairs(lint.linters_by_ft) do
        for _, linter in ipairs(linters_list) do
            table.insert(linters, linter)
        end
    end

    -- Install LSP servers
    for _, server in ipairs(LSP_servers) do
        installIfNotInstalled(server)
    end

    -- Install linters
    for _, linter in ipairs(linters) do
        installIfNotInstalled(linter)
    end

    -- Install DAP clients
    for _, dap_client in ipairs(dap_clients) do
        installIfNotInstalled(dap_client)
    end

    -- Install formatters
    for _, formatter in ipairs(formatters) do
        installIfNotInstalled(formatter)
    end

    -- Uninstall any installed packages not listed above
    for _, pkg in ipairs(registry.get_installed_packages()) do
        local is_listed = false

        for _, list in ipairs({ LSP_servers, linters, dap_clients, formatters }) do
            if vim.tbl_contains(list, pkg.name) then
                is_listed = true
                break
            end
        end

        if not is_listed then
            print("[mason.nvim] uninstalling " .. pkg.name)
            vim.cmd('MasonUninstall ' .. pkg.name)
        end
    end

    print('✅ Mason packages updated.')
end


-- Toggle Quickfix List -------------------------------------------------------
Utils.toggleQuickFix = function()
    local wininfo = vim.fn.getwininfo()
    local isQuickFixOpen = false

    for _, info in ipairs(wininfo) do
        if info.quickfix == 1 then
            isQuickFixOpen = true
            break
        end
    end

    if not isQuickFixOpen then
        vim.cmd("copen")
    else
        vim.cmd("cclose")
    end
end