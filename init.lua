-- Package Manger
require("plugins/lazy")
require("plugins/mason")

-- Core
require("core/options")
require("core/autocmds")
require("core/keymaps")
require("core/utils")

-- LSP
require("lsp/init")

-- Plugins
require("plugins/lualine")
require("plugins/nvim-tree")
require("plugins/bufferline")
require("plugins/nvim-telescope")
require("plugins/indent-blankline")
require("plugins/nvim-treesitter")
require("plugins/nvim-colorizer")
require("plugins/alpha-nvim")
require("plugins/comment-nvim")
require("plugins/aerial")
require("plugins/marks-nvim")
require("plugins/undotree")
require("plugins/nvim-cmp")
-- require('plugins/codeium') -- DISABLED: Using Avante instead
require("plugins/avante") -- Load Avante for AI completions and code chat
require("plugins/csvview")
require("plugins/rainbow-csv")
