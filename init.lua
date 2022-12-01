-- Package Manger
require('plugins/packer')
require('plugins/mason')

-- Core
require('core/options')
require('core/autocmds')
require('core/keymaps')
require('core/utils')

-- LSP
require('lsp/init')

-- Plugins
require('plugins/feline')
require('plugins/nvim-tree')
require('plugins/bufferline')
require('plugins/nvim-telescope')
require('plugins/indent-blankline')
require('plugins/nvim-cmp')
require('plugins/nvim-treesitter')
require('plugins/nvim-colorizer')
require('plugins/alpha-nvim')
require('plugins/comment-nvim')
require('plugins/undotree')
