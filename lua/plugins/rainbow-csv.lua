-----------------------------------------------------------
-- Rainbow CSV configuration file
-----------------------------------------------------------

-- Plugin: rainbow_csv.nvim
-- URL: https://github.com/cameron-wags/rainbow_csv.nvim

local status_ok, rainbow_csv = pcall(require, "rainbow_csv")
if not status_ok then
	return
end

rainbow_csv.setup()
