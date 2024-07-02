-- @param 全局通用配置

-- @param 使用 VimEnter 事件在 Neovim 启动时自动执行设置函数
vim.api.nvim_create_autocmd('VimEnter', {
    callback = function()
        -- 清除所有之前定义的 autocmd 并从干净的状态开始
        vim.cmd('autocmd!')
        -- 设置编码格式
        vim.g.encoding = 'UTF-8'
        vim.opt.fileencoding = 'utf-8'
        -- 使用系统剪切板
        vim.opt.clipboard:append('unnamedplus')
        -- 在nvim中打开终端时，取消行号显示
        vim.cmd([[
            autocmd TermOpen * setlocal nonumber norelativenumber
            autocmd TermOpen * startinsert
        ]])
    end,
})

-- @param 复制文本高亮
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank({
            higroup = 'IncSearch',
            timeout = 300,
        })
    end,
})


