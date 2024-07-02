-- lua/plugins/transparent.lua
if not Zero.plugins then
	Zero.plugins = {}
end

table.insert(Zero.plugins, {
	"xiyaowong/nvim-transparent",
	config = function()
		require("transparent").setup({
			-- 默认组,:hi查看
			groups = {
				"Normal",
				"NormalNC",
				"Comment",
				"Constant",
				"Special",
				"Identifier",
				"Statement",
				"PreProc",
				"Type",
				"Underlined",
				"Todo",
				"String",
				"Function",
				"Conditional",
				"Repeat",
				"Operator",
				"Structure",
				"LineNr",
				"NonText",
				"SignColumn",
				"CursorLine",
				"CursorLineNr",
				"StatusLine",
				"StatusLineNC",
				"EndOfBuffer",
			},
			extra_groups = { "NvimTreeNormal" }, -- 额外需要透明的组
			exclude_groups = {}, -- 不希望透明的组
		})
	end,
})

