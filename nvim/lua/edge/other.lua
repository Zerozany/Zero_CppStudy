return {
	-- git设置
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({})
		end,
	},

	-- markdown
	{
		"ellisonleao/glow.nvim",
		cmd = "Glow",
		config = function()
			require("glow").setup({})
		end,
	},

	-- 一个超快的显示hex颜色的插件
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({
				"cpp",
				"c",
				"python",
				"lua",
				"bash",
				"vim",
				"json",
				"markdown",
			})
		end,
	},

	-- 文件顶部显示函数名
	--[[{
		"nvim-treesitter/nvim-treesitter-context",
		config = function()
			require("treesitter-context").setup({
				enable = true,
				-- 显示上下文窗口中的行号
				max_lines = 0,
			})
		end,
	},]]--
}
