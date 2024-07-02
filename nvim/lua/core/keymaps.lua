-- 定义键映射表
-- @param keymaps table
Zero.keymaps = {
    -- @param i：Insert 模式
    -- @param v：Visual 模式
    -- @param x：Visual Block 模式
    -- @param c：Command 模式
    -- @param t：Terminal 模式
    -- 取消 s 默认功能（进入编辑模式）
    { 'n', 's', '', { nowait = true, silent = false } },
    -- 窗口分屏快捷键
    { 'n', 'sv', ':vsp<CR>', { noremap = true, nowait = false, silent = false } },
    { 'n', 'sh', ':sp<CR>', { noremap = true, nowait = false, silent = false } },
    -- 关闭当前窗口
    { 'n', 'sc', '<C-w>c', { noremap = true, nowait = false, silent = false } },
    -- 关闭其他窗口
    { 'n', 'so', '<C-w>o', { noremap = true, nowait = false, silent = false } },
    -- Alt + hjkl  窗口之间跳转
    { 'n', '<A-h>', '<C-w>h', { noremap = true, nowait = false, silent = false } },
    { 'n', '<A-j>', '<C-w>j', { noremap = true, nowait = false, silent = false } },
    { 'n', '<A-k>', '<C-w>k', { noremap = true, nowait = false, silent = false } },
    { 'n', '<A-l>', '<C-w>l', { noremap = true, nowait = false, silent = false } },
    -- 左右比例控制
    { 'n', '<C-Left>', ':vertical resize -2<CR>', { noremap = true, nowait = true, silent = false } },
    { 'n', '<C-Right>', ':vertical resize +2<CR>', { noremap = true, nowait = true, silent = false } },
    { 'n', 's,', ':vertical resize -20<CR>', { noremap = true, nowait = false, silent = false } },
    { 'n', 's.', ':vertical resize +20<CR>', { noremap = true, nowait = false, silent = false } },
    -- 上下比例
    { 'n', 'sj', ':resize +keymap0<CR>', { noremap = true, nowait = false, silent = false } },
    { 'n', 'sk', ':resize -keymap0<CR>', { noremap = true, nowait = false, silent = false } },
    { 'n', '<C-Down>', ':resize +2<CR>', { noremap = true, nowait = true, silent = false } },
    { 'n', '<C-Up>', ':resize -2<CR>', { noremap = true, nowait = true, silent = false } },
    -- 等比例
    { 'n', 's=', '<C-w>=', { noremap = true, nowait = false, silent = false } },
    -- Terminal相关
    { 'n', '<leader>t', ':sp | terminal<CR>', { noremap = true, nowait = false, silent = false } },
    { 'n', '<leader>vt', ':vsp | terminal<CR>', { noremap = true, nowait = false, silent = false } },
    { 't', '<Esc>', '<C-\\><C-n>', { noremap = true, nowait = false, silent = false } },
    { 't', '<A-h>', [[ <C-\><C-N><C-w>h ]], { noremap = true, nowait = false, silent = false } },
    { 't', '<A-j>', [[ <C-\><C-N><C-w>j ]], { noremap = true, nowait = false, silent = false } },
    { 't', '<A-k>', [[ <C-\><C-N><C-w>k ]], { noremap = true, nowait = false, silent = false } },
    { 't', '<A-l>', [[ <C-\><C-N><C-w>l ]], { noremap = true, nowait = false, silent = false } },
    -- visual模式下缩进代码
    { 'v', '<', '<gv', { noremap = true, nowait = false, silent = false } },
    { 'v', '>', '>gv', { noremap = true, nowait = false, silent = false } },
    -- 上下移动选中文本
    { 'v', 'J', ":move '>+keymap<CR>gv-gv", { noremap = true, nowait = false, silent = false } },
    { 'v', 'K', ":move '<-2<CR>gv-gv", { noremap = true, nowait = false, silent = false } },
    -- 上下滚动浏览
    { 'n', '<C-j>', '4j', { noremap = true, nowait = false, silent = false } },
    { 'n', '<C-k>', '4k', { noremap = true, nowait = false, silent = false } },
    { 'n', '<C-u>', '9k', { noremap = true, nowait = false, silent = false } },
    { 'n', '<C-d>', '9j', { noremap = true, nowait = false, silent = false } },
    -- 全部选中
    { 'n', '<C-a>', 'ggVG', { noremap = true, nowait = false, silent = false } },
    -- 保存
    { 'n', '<C-s>', ':w!<CR>', { noremap = true, nowait = false, silent = true } },
    { 'i', '<C-A-s>', ':w!<CR>', { noremap = true, nowait = false, silent = true } },
    -- 退出窗口
    { 'n', 'qq', ':q<CR>', { noremap = true, nowait = false, silent = false } },
    { 'n', 'q!', ':q!<CR>', { noremap = true, nowait = false, silent = false } },
    { 'n', 'QQ', ':qa!<CR>', { noremap = true, nowait = false, silent = false } },
}
