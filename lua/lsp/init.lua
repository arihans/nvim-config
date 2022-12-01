-----------------------------------------------------------
-- Neovim LSP configuration file
-----------------------------------------------------------

-- Plugin: nvim-lspconfig
-- url: https://github.com/neovim/nvim-lspconfig

-- For configuration see the Wiki: https://github.com/neovim/nvim-lspconfig/wiki

local lsp_status_ok, lspconfig = pcall(require, 'lspconfig')
if not lsp_status_ok then
    return
end

-------------------------------------
-- LSP SERVERS
-------------------------------------
-- Available packages: https://github.com/williamboman/mason.nvim/blob/main/PACKAGES.md

_G.LSP_servers = {
    bashls = {},
    pyright = {
        python = {
            analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true
            }
        }
    },
    clangd = {},
    html = {},
    cssls = {},
    tsserver = {},
    yamlls = {},
    sumneko_lua = {
        settings = {
            Lua = {
                runtime = {
                    -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                    version = 'LuaJIT',
                },
                diagnostics = {
                    -- Get the language server to recognize the `vim` global
                    globals = { 'vim' },
                },
                workspace = {
                    -- Make the server aware of Neovim runtime files
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                -- Do not send telemetry data containing a randomized but unique identifier
                telemetry = {
                    enable = false,
                },
            },
        }
    }
}

-- Reload ---------------------------
vim.cmd [[
  augroup lsp_config
    autocmd!
    autocmd BufWritePost *lsp/init.lua source <afile>
  augroup end
]]

-- Install LSP ----------------------
Utils.update_LSP_servers()

-- Diagnostic options ---------------
require('lsp.diagnostics')

-- nvim-cmp -------------------------
-- Additional capabilities supported by nvim-cmp
require('lsp.nvim-cmp')

-- After the language server attaches to the current buffer
local on_attach = function(client, bufnr)

    -- Highlighting references
    if client.server_capabilities.document_highlight then
        vim.api.nvim_exec([[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]]   , false)
    end

    -- local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    -- Enable completion triggered by <c-x><c-o>
    -- buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings ---------------------
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end

    local opts = { noremap = true, silent = true }

    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>lt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>le', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>lq', '<cmd>lua vim.diagnostic.setloclist()<CR>', opts)
    buf_set_keymap('n', '<space>lf', '<cmd>lua vim.lsp.buf.format {async = true}<CR>', opts)

    -- Dirty patch
    -- Only efffects YAML files
    if client.name == "yamlls" then
        client.server_capabilities.document_formatting = true
    end

end


-- Server setup ----------------------
for lsp, extra in pairs(LSP_servers) do
    lspconfig[lsp].setup {
        on_attach = on_attach,
        capabilities = capabilities,
        flags = {
            -- default in neovim 0.7+
            debounce_text_changes = 150,
        },
        unpack(extra)
    }
end
