-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Ensure lazy.nvim is installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

local lazy_status_ok, lazy = pcall(require, 'lazy')
if not lazy_status_ok then
    return
end

lazy.setup({
    -- File explorer
    { 'kyazdani42/nvim-tree.lua' },

    -- Indent line
    { 'lukas-reineke/indent-blankline.nvim' },

    -- Autopair
    {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup {}
        end
    },

    -- Icons
    { 'kyazdani42/nvim-web-devicons' },

    -- Treesitter interface
    {
        'nvim-treesitter/nvim-treesitter',
        build = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end
    },

    -- Color schemes --------------------
    { 'Mofiqul/dracula.nvim' },
    { 'navarasu/onedark.nvim' },
    { 'tanvirtin/monokai.nvim' },
    { 'rose-pine/neovim',            as = 'rose-pine' },
    { 'marko-cerovac/material.nvim' },
    { 'Mofiqul/adwaita.nvim' },

    -- LSP ------------------------------
    { 'neovim/nvim-lspconfig' },

    -- LSP installer
    { 'williamboman/mason.nvim' },
    -------------------------------------

    -- Autocomplete
    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'saadparwaiz1/cmp_luasnip',
        },
    },

    -- Language Support ---------------
    -- kdl
    { 'imsnif/kdl.vim' },

    -- Fuzzy Finder
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Symbols tree view
    { 'simrat39/symbols-outline.nvim' },

    -- Statusline
    {
        'feline-nvim/feline.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' },
    },

    -- Bufferline
    {
        'akinsho/bufferline.nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' },
    },

    -- Surround
    {
        'kylechui/nvim-surround',
        config = function()
            require('nvim-surround').setup()
        end
    },

    -- Cooment
    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },

    -- Better Cooment
    {
        'folke/todo-comments.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        config = function()
            require('todo-comments').setup {}
        end
    },

    -- Undo Tree
    { 'mbbill/undotree' },

    -- Color Highlighter
    { 'NvChad/nvim-colorizer.lua' },

    -- Git labels
    {
        'lewis6991/gitsigns.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('gitsigns').setup {}
        end
    },

    -- Marks
    { 'chentoast/marks.nvim' },

    -- Dashboard (start screen)
    {
        'goolord/alpha-nvim',
        dependencies = { 'kyazdani42/nvim-web-devicons' },
    },

    -- Codeium Coding Assistant
    { 'Exafunction/codeium.vim' },
}, {
    install = {
        missing = true,                                                                        -- Install missing plugins on startup
        colorscheme = { "dracula", "onedark", "monokai", "rose-pine", "material", "adwaita" }, -- Set color schemes
    },
    ui = {
        -- border = "rounded", -- Set border style for UI components
    },
})

-- Automatically reload Neovim whenever you save the init.lua file
vim.api.nvim_create_autocmd("BufWritePost", {
    pattern = "init.lua",
    command = "source <afile> | Lazy sync",
})
