-----------------------------------------------------------
-- Avante configuration file
-----------------------------------------------------------

-- Plugin: avante.nvim
-- url: https://github.com/yetone/avante.nvim

local status_ok, avante = pcall(require, 'avante')
if not status_ok then
    return
end

avante.setup({
    -- Set providers
    provider = "claude",
    auto_suggestions_provider = "claude",
    cursor_applying_provider = nil, -- Uses provider setting by default

    -- Claude configuration
    claude = {
        endpoint = "https://api.anthropic.com",
        model = "claude-3-sonnet-20240229",
        temperature = 0,
        max_tokens = 4096,
    },

    -- OpenAI configuration
    openai = {
        endpoint = "https://api.openai.com/v1",
        model = "gpt-4",
        temperature = 0,
        max_tokens = 4096,
    },

    -- Experimental dual boost mode
    dual_boost = {
        enabled = false,
        first_provider = "openai",
        second_provider = "claude",
        prompt = "Based on the two reference outputs below, generate a response that incorporates elements from both but reflects your own judgment and unique perspective. Do not provide any explanation, just give the response directly. Reference Output 1: [{{provider1_output}}], Reference Output 2: [{{provider2_output}}]",
        timeout = 60000,
    },

    -- Core behavior settings
    behaviour = {
        auto_suggestions = false,
        auto_set_highlight_group = true,
        auto_set_keymaps = true,
        auto_apply_diff_after_generation = false,
        support_paste_from_clipboard = false,
        minimize_diff = true,
        enable_token_counting = true,
        enable_cursor_planning_mode = true,
    },

    -- Keymaps configuration
    mappings = {
        diff = {
            ours = "co",
            theirs = "ct",
            all_theirs = "ca",
            both = "cb",
            cursor = "cc",
            next = "]x",
            prev = "[x",
        },
        suggestion = {
            accept = "<Tab>",
            next = "<C-n>",
            prev = "<C-p>",
            dismiss = "<Esc>",
        },
        jump = {
            next = "]]",
            prev = "[[",
        },
        submit = {
            normal = "<CR>",
            insert = "<C-s>",
        },
        sidebar = {
            apply_all = "A",
            apply_cursor = "a",
            switch_windows = "<Tab>",
            reverse_switch_windows = "<S-Tab>",
        },
    },

    -- UI hints
    hints = { enabled = true },

    -- Window configuration
    windows = {
        position = "right",
        wrap = true,
        width = 30,
        sidebar_header = {
            enabled = true,
            align = "center",
            rounded = true,
        },
        input = {
            prefix = "> ",
            height = 8,
        },
        edit = {
            border = "rounded",
            start_insert = true,
        },
        ask = {
            floating = false,
            start_insert = true,
            border = "rounded",
            focus_on_apply = "ours",
        },
    },

    -- Highlight groups
    highlights = {
        diff = {
            current = "DiffText",
            incoming = "DiffAdd",
        },
    },

    -- Diff settings
    diff = {
        autojump = true,
        list_opener = "copen",
        override_timeoutlen = 500,
    },

    -- Suggestion behavior
    suggestion = {
        debounce = 600,
        throttle = 600,
    },
}) 