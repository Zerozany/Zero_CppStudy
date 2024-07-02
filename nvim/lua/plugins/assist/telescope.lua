-- lua/plugins/telescope.lua
-- @param 模糊搜索
if not Zero.plugins then
	Zero.plugins = {}
end

table.insert(Zero.plugins, {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	config = function()
		-- 加载 fzf 扩展
		require("telescope").load_extension("fzf")
		-- 配置 telescope
		require("telescope").setup({
			extensions = {
				fzf = {
					fuzzy = true,
					override_generic_sorter = true,
					override_file_sorter = true,
					case_mode = "smart_case",
				},
			},
			defaults = {
				-- 允许动态地更改预览窗口的标题
				dynamic_preview_title = true,
				-- 控制如何显示文件路径
				path_display = { "smart" },
				-- 配置显示 preview 窗口
				preview = {
					treesitter = true, -- 使用 treesitter 进行语法高亮
					msg_bg_fillchar = ' ', -- 背景填充字符
					wrap = true, -- 是否换行
				},
				-- 自定义显示行为
				layout_config = {
					preview_cutoff = 30, -- 小于此宽度时不显示预览窗口
				},
			},
			-- 配置特定选择器的行为
			pickers = {
				-- 查找文件、查找文本
				find_files = {
					-- 包括隐藏文件
					hidden = true,
				},
			},
		})
		-- 根据文件类型或文件名对预览窗口进行自定义配置
		vim.api.nvim_create_autocmd("User", {
			pattern = "TelescopePreviewerLoaded",
			callback = function(args)
			  if args.data.filetype ~= "help" then
				vim.wo.number = true
			  elseif args.data.bufname:match("*.csv") then
				vim.wo.wrap = false
			  end
			end,
		})

		local builtin = require("telescope.builtin")
		-- @param 查找文件
		vim.keymap.set("n", "<leader>f", builtin.find_files, {})
		-- @param 在所有文件中进行实时搜索
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		-- @param 用于列出当前缓冲区
		vim.keymap.set("n", "<leader><space>", builtin.buffers, {})
		-- @param 用于查看帮助标签
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
		-- @param Normal 模式下按 <leader>? 用于查找最近打开的文件
		vim.keymap.set("n", "<leader>?", builtin.oldfiles, { desc = "[?] Find recently opened files" })
		-- @param 进行当前缓冲区的模糊搜索
		vim.keymap.set("n", "<leader>ff", function()
			require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
				-- 透明度
				winblend = 0,
				previewer = false,
			}))
		end)
	end,
})
