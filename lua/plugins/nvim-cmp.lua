-----------------------------------------------------------
-- Autocomplete configuration file
-----------------------------------------------------------

-- Plugin: nvim-cmp
-- url: https://github.com/hrsh7th/nvim-cmp

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

local luasnip_status_ok, luasnip = pcall(require, "luasnip")
if not luasnip_status_ok then
	return
end

local kind_icons = {
	Text = "",
	Method = "",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "ﴯ",
	Interface = "",
	Module = "",
	Property = "ﰠ",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Snippet = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

cmp.setup({
	-- Load snippet support
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	-- Completion settings
	completion = {
		--completeopt = 'menu,menuone,noselect'
		keyword_length = 2,
	},

	-- Borders
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	-- Formatting
	formatting = {
		fields = { "kind", "abbr", "menu" },
		format = function(_, item)
			item.menu = item.kind
			item.kind = kind_icons[item.kind]
			-- item.kind = string.format("%s %s", kind_icons[item.kind], item.kind)
			return item
		end,
	},

	-- Key mapping
	mapping = cmp.mapping.preset.insert({
		["<C-n>"] = cmp.mapping.select_next_item(),
		["<C-p>"] = cmp.mapping.select_prev_item(),
		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-u>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping(function()
			local ok, neo = pcall(require, "neocodeium")
			if ok then
				neo.cycle_or_complete()
			end
			cmp.complete()
		end),
		["<C-e>"] = cmp.mapping.close(),
		["<CR>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
			else
				fallback()
			end
		end, { "i", "c" }),
		["<A-n>"] = cmp.mapping(function()
			if cmp.visible() then
				return cmp.select_next_item()
			end
			local ok, neo = pcall(require, "neocodeium")
			if ok then
				neo.cycle_or_complete(1)
			end
		end),
		["<A-p>"] = cmp.mapping(function()
			if cmp.visible() then
				return cmp.select_prev_item()
			end
			local ok, neo = pcall(require, "neocodeium")
			if ok then
				neo.cycle_or_complete(-1)
			end
		end),
	}),

	-- Load sources, see: https://github.com/topics/nvim-cmp
	sources = cmp.config.sources({
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "path" },
		{ name = "buffer" },
	}, {}),
})
