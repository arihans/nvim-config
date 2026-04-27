-----------------------------------------------------------
-- Treesitter configuration file (nvim-treesitter main branch, Neovim 0.12+)
-----------------------------------------------------------

local status_ok, nvim_treesitter = pcall(require, "nvim-treesitter")
if not status_ok then
	return
end

if nvim_treesitter.install then
	nvim_treesitter.install({
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
		"java",
	})
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		pcall(vim.treesitter.start)
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
