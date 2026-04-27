-----------------------------------------------------------
-- Treesitter configuration file
----------------------------------------------------------

-- Plugin: nvim-treesitter
-- url: https://github.com/nvim-treesitter/nvim-treesitter

local status_ok, nvim_treesitter = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

-- See: https://github.com/nvim-treesitter/nvim-treesitter#quickstart
nvim_treesitter.setup({
	-- A list of parser names, or "all"
	ensure_installed = {
		"bash",
		"c",
		"css",
		"html",
		"javascript",
		"typescript",
		"tsx",
		"json",
		"lua",
		"python",
		"vim",
		"yaml",
		"markdown",
		"markdown_inline",
	},
	-- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
	-- Autoinstall parsers when entering buffer
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = {
		enable = true,
	},
	-- Disable problematic parsers that have ABI issues
	ignore_install = { "cpp" },
})
