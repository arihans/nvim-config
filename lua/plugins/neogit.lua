-----------------------------------------------------------
-- Neogit configuration file
-----------------------------------------------------------

-- Plugin: neogit
-- url: https://github.com/NeogitOrg/neogit

local status_ok, neogit = pcall(require, "neogit")
if not status_ok then
	return
end

neogit.setup({
	-- Configuration options
	disable_hint = false,
	disable_context_highlighting = false,
	disable_signs = false,
	prompt_force_push = true,
	disable_insert_on_commit = "auto",

	-- Integration settings
	integrations = {
		telescope = true,
		diffview = true,
	},

	-- Appearance
	graph_style = "ascii",

	-- Git settings
	git_services = {
		["github.com"] = "https://github.com/${owner}/${repository}/compare/${branch_name}?expand=1",
		["bitbucket.org"] = "https://bitbucket.org/${owner}/${repository}/pull-requests/new?source=${branch_name}&t=1",
		["gitlab.com"] = "https://gitlab.com/${owner}/${repository}/-/merge_requests/new?merge_request[source_branch]=${branch_name}",
	},

	-- Keymaps
	mappings = {
		-- Setting to false to use custom keymaps in keymaps.lua
		popup = {
			["?"] = "HelpPopup",
			["A"] = "CherryPickPopup",
			["D"] = "DiffPopup",
			["M"] = "RemotePopup",
			["P"] = "PushPopup",
			["X"] = "ResetPopup",
			["Z"] = "StashPopup",
			["b"] = "BranchPopup",
			["c"] = "CommitPopup",
			["f"] = "FetchPopup",
			["l"] = "LogPopup",
			["m"] = "MergePopup",
			["p"] = "PullPopup",
			["r"] = "RebasePopup",
			["v"] = "RevertPopup",
		},
	},

	-- Commit editor settings
	commit_editor = {
		kind = "tab",
	},

	-- Console settings
	console = {
		timeout = 2000,
		process_timeout = 5000,
	},

	-- Auto-refresh settings
	auto_refresh = true,

	-- Disable builtin notifications
	disable_builtin_notifications = false,

	-- Use magit-style buffer switching
	use_magit_keybindings = false,
})
