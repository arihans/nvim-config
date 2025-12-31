-----------------------------------------------------------
-- Codeium AI completion configuration (Windsurf.nvim)
-----------------------------------------------------------

-- Plugin: windsurf.nvim
-- url: https://github.com/Exafunction/windsurf.nvim

local status_ok, codeium = pcall(require, 'codeium')
if not status_ok then
    return
end

-- Simple setup - the plugin automatically registers with nvim-cmp
-- and provides virtual text completion
codeium.setup({
    -- Enable Codeium
    enabled = true,
    
    -- The plugin automatically integrates with nvim-cmp
    -- and provides a source called "codeium"
    
    -- Virtual text configuration for inline suggestions
    virtual_text = {
        enabled = true,
        filetypes = {},
        default_filetype_enabled = true,
        manual = false,
        idle_delay = 75,
        virtual_text_priority = 65535,
        map_keys = true,
        accept_fallback = nil,
        key_bindings = {
            accept = "<Tab>",
            accept_word = false,
            accept_line = false,
            clear = "<C-x>",
            next = "<C-j>",
            prev = "<C-k>",
        },
    },
    
    -- Enable cmp source for nvim-cmp integration
    enable_cmp_source = true,
    
    -- Enable chat functionality
    enable_chat = true,
    
    -- Enable local search
    enable_local_search = true,
    
    -- Enable index service
    enable_index_service = true,
    
    -- Search and file watching limits
    search_max_workspace_file_count = 5000,
    file_watch_max_dir_count = 50000,
    
    -- Workspace root detection
    workspace_root = {
        use_lsp = true,
        find_root = nil,
        paths = {
            ".bzr",
            ".git",
            ".hg",
            ".svn",
            "_FOSSIL_",
        },
    },
    
    -- Language server configuration
    language_server_download_url = "https://github.com",
    
    -- API configuration
    api = {
        host = "server.codeium.com",
        port = "443",
        path = "/",
        portal_url = "codeium.com",
    },
    
    -- Tools configuration
    tools = {},
    
    -- Wrapper configuration
    wrapper = nil,
    
    -- Enterprise mode
    enterprise_mode = nil,
    
    -- Proxy detection
    detect_proxy = nil,
    
    -- Quiet mode
    quiet = false,
    
    -- Server health check configuration
    server = {
        -- Enable automatic server restart on failure
        auto_restart = true,
        -- Health check interval in seconds
        health_check_interval = 30,
        -- Maximum retry attempts
        max_retries = 3,
        -- Retry delay in seconds
        retry_delay = 5,
    },
    
    -- Authentication configuration
    auth = {
        -- Enable automatic authentication
        auto_auth = true,
        -- Authentication timeout in seconds
        timeout = 30,
    },
})
