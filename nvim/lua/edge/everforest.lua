-- lua/plugins/everforest.lua
-- @param everforest 主题插件
if not Zero.plugins then
	Zero.plugins = {}
end

table.insert(Zero.plugins, {
	"sainnhe/everforest",
	lazy = false,
	priority = 1000,
	config = function()
		-- 启用 Everforest 主题中的斜体字
		vim.g.everforest_enable_italic = true
		-- 设置 Everforest 主题为当前颜色方案
		vim.cmd.colorscheme("everforest")
	end,
})
