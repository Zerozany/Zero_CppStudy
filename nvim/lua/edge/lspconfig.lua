-- lua/plugins/lspconfig.lua
-- @param lspconfig
if not Zero.plugins then
	Zero.plugins = {}
end

table.insert(Zero.plugins, {
	"neovim/nvim-lspconfig",
	config = function()
		-- 全局配置 LSP 诊断
		vim.diagnostic.config({
			virtual_text = true,
			signs = true,
			underline = true,
			update_in_insert = true,
			severity_sort = true,
		})

		local lspconfig = require("lspconfig")

		-- lua
		lspconfig.lua_ls.setup({
			settings = {
				Lua = {
					diagnostics = {
						globals = { "vim" },
					},
				},
			},	
		})

		-- 安装 Pyright
		lspconfig.pyright.setup({})

		-- 确保已安装 clangd: `sudo apt install clangd`
		-- 设置clangd作为语言服务器
		lspconfig.clangd.setup({
			capabilities = {
				offsetEncoding = {'utf-8'}  -- 默认能力，设置偏移编码为utf-8
			},
			cmd = { "clangd" },  -- clangd的命令路径，如果在系统PATH中可省略路径
			filetypes = {  -- 支持的文件类型
				"c",
				"cpp",
				"h",
				"hpp",
				"objc",
				"objcpp",
				"cuda",
				"proto"
			},
			-- 根目录查找模式
			root_dir = lspconfig.util.root_pattern(  
				'.clangd',
				'.clang-tidy',
				'.clang-format',
				'compile_commands.json',
				'compile_flags.txt',
				'configure.ac',
				'.git'
			),
			-- 单文件支持
			single_file_support = true,
			-- 设置去抖动延迟选项
			flags = {
				debounce_text_changes = 150,
			}
		})

		lspconfig.jsonls.setup({})

	end  
})

-- 示例：映射一个按键来在源文件和头文件之间切换
vim.api.nvim_set_keymap('n', '<leader>q', '<cmd>ClangdSwitchSourceHeader<CR>', { noremap = true, silent = true })
