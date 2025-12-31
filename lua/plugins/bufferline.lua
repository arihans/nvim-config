-----------------------------------------------------------
-- BufferLine configuration file
-----------------------------------------------------------

-- Plugin: bufferline.nvim
-- url: https://github.com/akinsho/bufferline.nvim

-- Default : https://github.com/akinsho/bufferline.nvim#configuration

local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
    return
end

-- Set colorscheme (from colors/colorscheme_name.statusline.colorscheme_variant)
local colors
local colorscheme_variant

if vim.g.colorscheme and vim.g.colorscheme_variant then
    local color_config = require('colors/' .. vim.g.colorscheme)['bufferline']
    
    if color_config[vim.g.colorscheme_variant] == nil then
        colorscheme_variant = next(color_config)
    else
        colorscheme_variant = vim.g.colorscheme_variant
    end
    
    colors = color_config[colorscheme_variant]
else
    -- Fallback colors if colorscheme is not set
    colors = {
        bg = '#1e1e1e',
        fg = '#d4d4d4',
        cyan = '#4ec9b0',
        green = '#608b4e',
        yellow = '#dcdcaa',
        red = '#f44747',
        orange = '#ff8c00',
        pink = '#c586c0',
    }
end

bufferline.setup({
    options = {
        indicator = {
            icon = ''
        },
        show_buffer_close_icons = false,
        show_close_icon = false,
        diagnostics = 'nvim_lsp',
        diagnostics_indicator = function()
            return ' '
        end,
        offsets = {
            {
                filetype = 'NvimTree',
                text = "",
                separator = true
            }
        },
        always_show_bufferline = true
    },

    highlights = {
        fill = { bg = colors.bg, },
        background = { bg = colors.bg, },
        tab = { bg = colors.bg },
        -- tab_selected = { bg = colors.bg },
        tab_close = { bg = colors.bg },
        close_button = { bg = colors.bg },
        close_button_visible = { bg = colors.bg },
        -- close_button_selected = { bg = colors.bg_sel },
        buffer_visible = { bg = colors.bg },
        buffer_selected = { fg = colors.fg, bg = colors.bg_sel, italic = false },
        numbers = { bg = colors.bg },
        numbers_visible = { bg = colors.bg },
        numbers_selected = { bg = colors.bg_sel },
        diagnostic = { bg = colors.bg },
        diagnostic_visible = { bg = colors.bg },
        diagnostic_selected = { bg = colors.bg_sel },
        hint = { bg = colors.bg },
        hint_visible = { bg = colors.bg },
        hint_selected = { bg = colors.bg_sel },
        hint_diagnostic = { bg = colors.bg },
        hint_diagnostic_visible = { bg = colors.bg },
        hint_diagnostic_selected = { bg = colors.bg_sel },
        info = { bg = colors.bg },
        info_visible = { bg = colors.bg },
        info_selected = { bg = colors.bg_sel },
        info_diagnostic = { bg = colors.bg },
        info_diagnostic_visible = { bg = colors.bg },
        info_diagnostic_selected = { bg = colors.bg_sel },
        warning = { bg = colors.bg },
        warning_visible = { bg = colors.bg },
        warning_selected = { bg = colors.bg_sel },
        warning_diagnostic = { bg = colors.bg },
        warning_diagnostic_visible = { bg = colors.bg },
        warning_diagnostic_selected = { bg = colors.bg_sel },
        error = { bg = colors.bg },
        error_visible = { bg = colors.bg },
        error_selected = { bg = colors.bg_sel },
        error_diagnostic = { bg = colors.bg },
        error_diagnostic_visible = { bg = colors.bg },
        error_diagnostic_selected = { bg = colors.bg_sel },
        modified = { bg = colors.bg },
        modified_visible = { bg = colors.bg },
        modified_selected = { bg = colors.bg_sel },
        duplicate_selected = { bg = colors.bg_sel },
        duplicate_visible = { bg = colors.bg },
        duplicate = { bg = colors.bg },
        separator_selected = { fg = colors.bg_sel, bg = colors.bg },
        separator_visible = { fg = colors.bg, bg = colors.bg },
        separator = { fg = colors.bg, bg = colors.bg },
        -- indicator_selected = { bg = colors.bg },
        pick_selected = { bg = colors.bg_sel },
        pick_visible = { bg = colors.bg },
        pick = { bg = colors.bg },
        offset_separator = { bg = colors.bg },
    };
})
