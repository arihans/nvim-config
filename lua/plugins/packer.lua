-----------------------------------------------------------
-- Plugin manager configuration file
-----------------------------------------------------------

-- Automatically install packer
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
    packer_bootstrap = fn.system({
        'git',
        'clone',
        '--depth',
        '1',
        'https://github.com/wbthomason/packer.nvim',
        install_path
    })
    vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

-- Autocommand that reloads neovim whenever you save the packer_init.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerInstall
  augroup end
]]

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
    return
end

-- Configuration --------------------------------------------------------------
packer.init({
    compile_path = install_path .. '/plugin/packer_compiled.lua'
})

-- Install plugins ------------------------------------------------------------
return packer.startup(function(use)
    -- Add you plugins here:
    use 'wbthomason/packer.nvim' -- packer can manage itself

    -- File explorer
    use 'kyazdani42/nvim-tree.lua'

    -- Indent line
    use 'lukas-reineke/indent-blankline.nvim'

    -- Autopair
    use {
        'windwp/nvim-autopairs',
        config = function()
            require('nvim-autopairs').setup {}
        end
    }

    -- Icons
    use 'kyazdani42/nvim-web-devicons'

    -- Tag viewer
    use 'preservim/tagbar'

    -- Treesitter interface
    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            require('nvim-treesitter.install').update({ with_sync = true })
        end
    }

    -- Looks ----------------------------
    -- use 'xiyaowong/nvim-transparent'

    -- Color schemes --------------------
    use 'Mofiqul/dracula.nvim'
    use 'navarasu/onedark.nvim'
    use 'tanvirtin/monokai.nvim'
    use { 'rose-pine/neovim', as = 'rose-pine' }
    use 'marko-cerovac/material.nvim'
    use 'Mofiqul/adwaita.nvim'
    -------------------------------------

    -- LSP ------------------------------
    use 'neovim/nvim-lspconfig'

    -- LSP installer
    use 'williamboman/mason.nvim'
    -------------------------------------

    -- Autocomplete
    use {
        'hrsh7th/nvim-cmp',
        requires = {
            'L3MON4D3/LuaSnip',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-path',
            'hrsh7th/cmp-buffer',
            'saadparwaiz1/cmp_luasnip',
        },
    }

    -- Language Support ---------------
    -- kdl
    use 'imsnif/kdl.vim'
    -------------------------------------

    -- Fuzzy Finder
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.0',
        requires = {
            'nvim-lua/plenary.nvim'
        }
    }

    -- Statusline
    use {
        'feline-nvim/feline.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
    }

    -- Bufferline
    use {
        'akinsho/bufferline.nvim',
        tag = "v2.*",
        requires = { 'kyazdani42/nvim-web-devicons' },
    }

    -- Surround
    use {
        'kylechui/nvim-surround',
        tag = '*',
        config = function()
            require('nvim-surround').setup()
        end
    }

    -- Cooment
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    -- Undo Tree
    use 'mbbill/undotree'

    -- Color Highlighter
    use 'NvChad/nvim-colorizer.lua'

    -- git labels
    use {
        'lewis6991/gitsigns.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('gitsigns').setup {}
        end
    }

    -- Dashboard (start screen)
    use {
        'goolord/alpha-nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)
