-----------------------------------------------------------
-- CSV viewer configuration file
-----------------------------------------------------------

-- Plugin: csvview.nvim
-- URL: https://github.com/hat0uma/csvview.nvim

local status_ok, csvview = pcall(require, "csvview")
if not status_ok then
	return
end

csvview.setup({
	view = {
		display_mode = "border",
	},
})

-- Enable for the current buffer if it was already opened before the plugin loaded
vim.api.nvim_create_autocmd("FileType", {
	pattern = { "csv", "tsv" },
	callback = function()
		csvview.enable()
	end,
})

if vim.tbl_contains({ "csv", "tsv" }, vim.bo.filetype) then
	csvview.enable()
end
