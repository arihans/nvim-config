-----------------------------------------------------------
-- Treesitter configuration file (nvim-treesitter main branch, Neovim 0.12+)
-----------------------------------------------------------

local status_ok, _ = pcall(require, "nvim-treesitter")
if not status_ok then
	return
end

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function()
		pcall(vim.treesitter.start)
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
