-- lua/plugins/mason-tool.lua
-- @param mason-tool
if not Zero.plugins then
	Zero.plugins = {}
end

table.insert(Zero.plugins, {
	"WhoIsSethDaniel/mason-tool-installer.nvim",
	config = function()
		require("mason-tool-installer").setup({
			-- :mason
			ensure_installed = {
				-- 提供 Lua 语言的语言服务器协议 (LSP) 支持
				"stylua",
				"lua-language-server",
				-- 提供 Vim 脚本语言的语言服务器协议 (LSP) 支持
				"vim-language-server",
				-- python
				"pyright",
				"isort",
				-- python 格式化
				"black",
				-- C 和 C++
				'clangd',
				'clang-format',
			},
			auto_update = true,
		})
	end,
})
