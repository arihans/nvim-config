-----------------------------------------------------------
-- Treesitter configuration file
----------------------------------------------------------

-- Plugin: nvim-treesitter
-- url: https://github.com/nvim-treesitter/nvim-treesitter

local status_ok, nvim_treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
  return
end

-- See: https://github.com/nvim-treesitter/nvim-treesitter#quickstart
nvim_treesitter.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    'bash', 'c', 'css', 'html', 'javascript', 'json', 'lua', 'python',
    'vim', 'yaml', 'markdown', 'markdown_inline',
  },
  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,
  -- Autoinstall parsers when entering buffer
  auto_install = true,
  highlight = {
    -- `false` will disable the whole extension
    enable = true,
    -- Use language from treesitter for highlighting
    use_languagetree = true,
    -- Additional vim syntax highlighting (can be disabled when treesitter highlighting is enabled)
    additional_vim_regex_highlighting = false,
  },
  indent = {
    enable = true,
  },
  -- Disable problematic parsers that have ABI issues
  ignore_install = { "cpp" },
}
