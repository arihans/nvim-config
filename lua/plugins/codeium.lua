-----------------------------------------------------------
-- Codeium AI completion configuration (Windsurf.nvim)
-----------------------------------------------------------

-- Plugin: windsurf.nvim (Codeium)
-- url: https://github.com/Exafunction/windsurf.nvim

local status_ok, windsurf = pcall(require, 'windsurf')
if not status_ok then
    return
end

windsurf.setup({
    -- Enable Codeium
    enabled = true,
    
    -- Keymaps configuration
    keymaps = {
        -- Accept suggestion
        accept = "<Tab>",
        
        -- Cycle through suggestions
        next = "<C-j>",
        prev = "<C-k>",
        
        -- Clear suggestion
        clear = "<C-x>",
        
        -- Trigger suggestion manually
        trigger = "<M-a>",
    },
    
    -- UI configuration
    ui = {
        -- Show suggestion in a floating window
        floating = true,
        
        -- Border style for floating window
        border = "rounded",
        
        -- Highlight the suggestion
        highlight = "Pmenu",
        
        -- Show suggestion after typing this many characters
        trigger_chars = 2,
    },
    
    -- Completion settings
    completion = {
        -- Maximum number of suggestions to show
        max_suggestions = 10,
        
        -- Timeout for API calls (in milliseconds)
        timeout = 5000,
        
        -- Enable/disable specific features
        features = {
            -- Enable function completion
            functions = true,
            
            -- Enable variable completion
            variables = true,
            
            -- Enable import completion
            imports = true,
            
            -- Enable snippet completion
            snippets = true,
        },
    },
    
    -- Language-specific settings
    languages = {
        -- JavaScript/TypeScript
        javascript = {
            enabled = true,
            trigger_chars = 1,
        },
        typescript = {
            enabled = true,
            trigger_chars = 1,
        },
        
        -- Python
        python = {
            enabled = true,
            trigger_chars = 2,
        },
        
        -- Lua
        lua = {
            enabled = true,
            trigger_chars = 2,
        },
        
        -- Go
        go = {
            enabled = true,
            trigger_chars = 2,
        },
        
        -- Rust
        rust = {
            enabled = true,
            trigger_chars = 2,
        },
        
        -- C/C++
        c = {
            enabled = true,
            trigger_chars = 2,
        },
        cpp = {
            enabled = true,
            trigger_chars = 2,
        },
    },
})
