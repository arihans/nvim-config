-----------------------------------------------------------
-- Aerial configuration file (replaces symbols-outline)
-----------------------------------------------------------

-- Plugin: aerial.nvim
-- url: https://github.com/stevearc/aerial.nvim

local status_ok, aerial = pcall(require, 'aerial')
if not status_ok then
    return
end

aerial.setup({
    -- Priority list of preferred backends for aerial.
    backends = { "treesitter", "lsp", "markdown", "man" },

    layout = {
        -- These control the width of the aerial window.
        -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        max_width = { 40, 0.2 },
        width = nil,
        min_width = 10,

        -- key-value pairs of window-local options for aerial window (e.g. winhl)
        win_opts = {},

        -- Determines the default direction to open the aerial window. The 'prefer'
        -- options will open the window in the other direction *if* there is a
        -- different buffer in the way of the preferred direction
        default_direction = "prefer_right",

        -- Determines where the aerial window will be opened
        placement = "window",
    },

    -- Determines how the aerial window decides which buffer to display symbols for
    attach_mode = "window",

    -- List of enum values that configure when to auto-close the aerial window
    close_automatic_events = {},

    -- Keymaps in aerial window
    keymaps = {
        ["?"] = "actions.show_help",
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.jump",
        ["<2-LeftMouse>"] = "actions.jump",
        ["<C-v>"] = "actions.jump_vsplit",
        ["<C-s>"] = "actions.jump_split",
        ["p"] = "actions.scroll",
        ["<C-j>"] = "actions.down_and_scroll",
        ["<C-k>"] = "actions.up_and_scroll",
        ["{"] = "actions.prev",
        ["}"] = "actions.next",
        ["[["] = "actions.prev_up",
        ["]]"] = "actions.next_up",
        ["q"] = "actions.close",
        ["o"] = "actions.tree_toggle",
        ["za"] = "actions.tree_toggle",
        ["O"] = "actions.tree_toggle_recursive",
        ["zA"] = "actions.tree_toggle_recursive",
        ["l"] = "actions.tree_open",
        ["zo"] = "actions.tree_open",
        ["L"] = "actions.tree_open_recursive",
        ["zO"] = "actions.tree_open_recursive",
        ["h"] = "actions.tree_close",
        ["zc"] = "actions.tree_close",
        ["H"] = "actions.tree_close_recursive",
        ["zC"] = "actions.tree_close_recursive",
        ["zr"] = "actions.tree_increase_fold_level",
        ["zR"] = "actions.tree_open_all",
        ["zm"] = "actions.tree_decrease_fold_level",
        ["zM"] = "actions.tree_close_all",
        ["zx"] = "actions.tree_sync_folds",
        ["zX"] = "actions.tree_sync_folds",
    },

    -- When jumping to a symbol, highlight the line for this many ms.
    highlight_on_hover = false,

    -- Highlight the closest symbol if the cursor is not exactly on one.
    highlight_closest = true,

    -- Highlight the symbol in the source buffer when cursor is in the aerial win
    highlight_on_jump = 300,

    -- Jump to symbol in source window when the cursor moves
    autojump = false,

    -- Define symbol icons
    icons = {
        File = "",
        Module = "",
        Namespace = "",
        Package = "",
        Class = "𝓒",
        Method = "ƒ",
        Property = "",
        Field = "",
        Constructor = "",
        Enum = "ℰ",
        Interface = "ﰮ",
        Function = "",
        Variable = "",
        Constant = "",
        String = "𝓐",
        Number = "#",
        Boolean = "⊨",
        Array = "",
        Object = "⦿",
        Key = "🔐",
        Null = "NULL",
        EnumMember = "",
        Struct = "𝓢",
        Event = "🗲",
        Operator = "+",
        TypeParameter = "𝙏",
        Component = "",
        Fragment = "",
    },

    -- Control which windows aerial will attach to
    filter_kind = {
        "Class",
        "Constructor",
        "Enum",
        "Function",
        "Interface",
        "Module",
        "Method",
        "Struct",
    },

    -- Determines line highlighting mode when multiple splits are showing the same buffer
    guides = {
        -- When the child item has a sibling below it
        mid_item = "├─",
        -- When the child item is the last in the list
        last_item = "└─",
        -- When there are nested child guides to the right
        nested_top = "│ ",
        -- Raw indentation
        whitespace = "  ",
    },

    -- Options for opening aerial in a floating win
    float = {
        -- Controls border appearance. Passed to nvim_open_win
        border = "rounded",

        -- Determines location of floating window
        relative = "cursor",

        -- These control the height of the floating window.
        -- They can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
        max_height = 0.9,
        height = nil,
        min_height = { 8, 0.1 },

        override = function(conf, source_winid)
            -- This is the config that will be passed to nvim_open_win.
            -- Change values here to customize the layout
            return conf
        end,
    },

    lsp = {
        -- Fetch document symbols when LSP diagnostics update.
        diagnostics_trigger_update = true,

        -- Set to false to not update the symbols when there are LSP errors
        update_when_errors = true,

        -- How long to wait (in ms) after a buffer change before updating
        update_delay = 300,
    },

    treesitter = {
        -- How long to wait (in ms) after a buffer change before updating
        update_delay = 300,
    },

    markdown = {
        -- How long to wait (in ms) after a buffer change before updating
        update_delay = 300,
    },

    man = {
        -- How long to wait (in ms) after a buffer change before updating
        update_delay = 300,
    },
}) 