-----------------------------------------------------------
-- Telescope configuration file
-----------------------------------------------------------

-- Plugin: nvim-telescope
-- url: https://github.com/nvim-telescope/telescope.nvim

local status_ok, telescope = pcall(require, 'telescope')
if not status_ok then
    return
end

local actions = require("telescope.actions")

telescope.setup {
    defaults = {
        mappings = {
            i = {
                ["<C-l>"] = actions.smart_send_to_qflist + actions.open_qflist  -- Open quickfix list
            }
        }
    },
    extensions = {
        fzf = {
            fuzzy = true,                   -- false will only do exact matching
            override_generic_sorter = true, -- override the generic sorter
            override_file_sorter = true,    -- override the file sorter
            case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
        }
    }
}
