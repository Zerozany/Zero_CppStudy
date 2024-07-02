-- lua/plugins/conform.lua
-- @param 格式化代码
if not Zero.plugins then
    Zero.plugins = {}
end

table.insert(Zero.plugins, {
    'stevearc/conform.nvim',
    -- 以懒加载的方式进行加载
    lazy = true,
    -- 在这些事件发生时加载插件
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
        require('conform').setup({
            formatters_by_ft = {
                -- 对所有文件类型使用 codespell 格式化器进行格式化
                ["*"] = { "codespell" },
                -- 移除文件中多余空白字符
                ["_"] = { "trim_whitespace" },
                -- 使用 stylua 进行格式化
                lua = { 'stylua' },
                -- 使用 isort 和 black 进行格式化
                python = { 'isort', 'black' },
                -- 使用 clang-format 进行格式化
                c = { 'clang-format' },
                cpp = { 'clang-format' },
            },
            format_on_save = {
                -- 如果没有找到合适的格式化工具，使用 LSP（语言服务器协议）提供的格式化功能
                lsp_fallback = true,
                -- 设置格式化的超时时间为 500 毫秒
                timeout_ms = 500,
            },
        })
        -- 创建自动命令，在保存文件之前自动格式化代码
        vim.api.nvim_create_autocmd('BufWritePre', {
            pattern = '*',
            callback = function(args)
                require('conform').format({ bufnr = args.buf })
            end,
        })
    end,
})
