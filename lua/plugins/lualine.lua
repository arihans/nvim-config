-----------------------------------------------------------
-- Statusline configuration file
-----------------------------------------------------------

-- Plugin: lualine.nvim
-- url: https://github.com/nvim-lualine/lualine.nvim

local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
    return
end

-- Set colorscheme (from colors/colorscheme_name.statusline.colorscheme_variant)
local colors
local colorscheme_variant

if vim.g.colorscheme and vim.g.colorscheme_variant then
    local color_config = require('colors/' .. vim.g.colorscheme)['statusline']
    
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

-- Custom theme based on your color scheme
local custom_theme = {
    normal = {
        a = { fg = colors.bg, bg = colors.cyan, gui = 'bold' },
        b = { fg = colors.fg, bg = colors.bg },
        c = { fg = colors.fg, bg = colors.bg },
    },
    insert = {
        a = { fg = colors.bg, bg = colors.green, gui = 'bold' },
        b = { fg = colors.fg, bg = colors.bg },
        c = { fg = colors.fg, bg = colors.bg },
    },
    visual = {
        a = { fg = colors.bg, bg = colors.yellow, gui = 'bold' },
        b = { fg = colors.fg, bg = colors.bg },
        c = { fg = colors.fg, bg = colors.bg },
    },
    replace = {
        a = { fg = colors.bg, bg = colors.red, gui = 'bold' },
        b = { fg = colors.fg, bg = colors.bg },
        c = { fg = colors.fg, bg = colors.bg },
    },
    command = {
        a = { fg = colors.bg, bg = colors.pink, gui = 'bold' },
        b = { fg = colors.fg, bg = colors.bg },
        c = { fg = colors.fg, bg = colors.bg },
    },
    inactive = {
        a = { fg = colors.fg, bg = colors.bg },
        b = { fg = colors.fg, bg = colors.bg },
        c = { fg = colors.fg, bg = colors.bg },
    },
}

-- Custom components
local function file_info()
    local file = vim.fn.expand('%:t')
    if file == '' then
        return '[No Name]'
    end
    return file
end

local function file_type_with_icon()
    local filetype = vim.bo.filetype:lower()
    local extension = vim.fn.expand('%:e')
    local icon = require('nvim-web-devicons').get_icon(extension)
    if icon == nil then
        icon = ' '
    end
    return icon .. ' ' .. filetype
end

local function file_format_with_icon()
    local format = vim.bo.fileformat:lower()
    local icon
    if format == 'unix' then
        icon = '  '
    elseif format == 'mac' then
        icon = '  '
    else
        icon = '  '
    end
    return icon .. format
end

lualine.setup {
    options = {
        theme = custom_theme,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = { 'NvimTree', 'packer', 'help' },
            winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        }
    },
    sections = {
        lualine_a = { 'mode' },
        lualine_b = {
            {
                'filename',
                file_status = true,
                newfile_status = false,
                path = 1, -- 0: Just the filename, 1: Relative path, 2: Absolute path
                symbols = {
                    modified = '',
                    readonly = '',
                    unnamed = '[No Name]',
                    newfile = '[New]',
                }
            },
            {
                'branch',
                icon = '',
                color = { fg = colors.pink },
            },
            {
                'diff',
                symbols = { added = '  ', modified = '  ', removed = '  ' },
                diff_color = {
                    added = { fg = colors.green },
                    modified = { fg = colors.orange },
                    removed = { fg = colors.red },
                },
            },
        },
        lualine_c = {},
        lualine_x = {
            {
                'diagnostics',
                sources = { 'nvim_diagnostic' },
                symbols = { error = ' ', warn = ' ', info = ' ', hint = ' ' },
                diagnostics_color = {
                    error = { fg = colors.red },
                    warn = { fg = colors.yellow },
                    info = { fg = colors.green },
                    hint = { fg = colors.cyan },
                },
            },
            {
                'lsp_progress',
                color = { fg = colors.pink },
                separator = ' ',
                timer = { progress_enddelay = 500, spinner = 80 },
            },
        },
        lualine_y = {
            {
                file_type_with_icon,
                color = { fg = colors.fg },
            },
            {
                file_format_with_icon,
                color = { fg = colors.fg },
            },
            {
                'location',
                color = { fg = colors.fg },
            },
        },
        lualine_z = {
            {
                'progress',
                color = { fg = colors.cyan },
            },
        }
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = { 'nvim-tree', 'quickfix', 'fugitive' }
} 