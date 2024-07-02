-- @param options table
Zero.options = {
    -- 设置光标移动至窗口顶部或底部时保持在屏幕中间
    scrolloff = math.floor((vim.fn.winheight(0) - 1) / 2),
    -- 设置光标移动至窗口左侧或右侧时保持在屏幕中间
    sidescrolloff = math.floor((vim.fn.winwidth(0) - 1) / 2),
    -- 行首不显示 ~ 符号
    fillchars = { eob = ' ' },
    -- 设置行号
    number = true,
    -- 设置相对行号,k上j下
    relativenumber = true,
    -- 光标所在行高亮显示
    cursorline = false,
    -- 禁用备份文件
    backup = false,
    -- 禁止写入备份文件
    writebackup = false,
    -- 禁止交换文件
    swapfile = false,
    -- 不显示输入模式信息(之后会使用插件覆盖)
    showmode = false,
    -- 允许退格键在插入模式下删除自动缩进,换行符前的字符,插入模式开始之前的字符
    backspace = { 'indent', 'eol', 'start' },
    -- 设置 Tab 默认为 4 个空格宽度
    tabstop = 4,
    -- 设置 Tab 时键入的空格数目为 4
    softtabstop = 4,
    -- 设置 << or >> 时缩进的数量
    shiftwidth = 4,
    -- 使用 << or >> 进行缩进时，是否进行四舍五入
    shiftround = true,
    -- 设置在插入模式下将 Tab 展开为空格
    expandtab = true,
    -- 根据上一行决定新行的缩进
    autoindent = true,
    -- 启用缩进换行，使换行后的行与原行对齐，保持代码或文本结构的清晰
    breakindent = true,
    -- 根据编程语言使用智能缩进
    smartindent = true,
    -- 启用命令行补全菜单
    wildmenu = true,
    -- 补全菜单方案
    wildmode = { 'full' },
    -- 有补全选项时，将显示一个带有可用选择的弹出菜单
    wildoptions = 'pum',
    -- 补全菜单透明度
    -- pumblend = 70,
    -- 搜索结果是否高亮显示
    hlsearch = true,
    -- 搜索时实时高亮显示文本
    incsearch = true,
    -- 搜索时忽略大小写
    ignorecase = true,
    -- 智能大小写匹配
    smartcase = true,
    -- 始终显示补全菜单,如果只有一项补全时，也显示菜单
    completeopt = { 'menu', 'menuone' },
    -- 启用真彩色
    termguicolors = true,
    -- 显示行号与文本之间的间隔(or auto)
    signcolumn = 'yes:1',
    -- 文件改动时自动重读文件
    autoread = true,
    -- 动态设置窗口标题
    title = true,
    -- 控制自动保存文件和触发插件操作（如语法检查、自动补全等）的延迟时间设置
    updatetime = 50,
    -- 组合键间隔时间(ms)
    timeoutlen = 500,
    -- @param 启用鼠标事件
    -- @param "a"：启用鼠标的所有功能。这包括文本选择、滚动、点击等操作
    -- @param "n"：禁用鼠标。鼠标事件将被忽略
    -- @param "v"：仅在可视模式下允许使用鼠标选择文本
    -- @param "r"：仅允许使用鼠标进行滚动
    mouse = 'a',
    -- 启用鼠标移动事件
    mousemoveevent = true,
    -- 启用持久撤销
    undofile = true,
    -- 文件存储信息
    undodir = vim.fn.expand('$HOME/.local/share/nvim/undo'),
    -- 存放 Vim 脚本的配置文件
    exrc = true,
    -- 禁止超过最大宽度时自动换行
    wrap = false,
    -- 选择色彩的高亮,或者'light'
    background = 'dark',
    -- @param Split 窗口时出现的位置
    -- @param 从右侧分裂
    -- @param 从下方分裂
    splitbelow = true,
    splitright = true,
    -- 命令行使用的行数
    cmdheight = 1,
    -- @param b：允许使用方向键（如 <Up> 和 <Down>）跨越文本块的边界。
    -- @param h：允许在行首使用左方向键 <Left>。
    -- @param l：允许在行尾使用右方向键 <Right>。
    -- @param <：允许在当前行的开头使用左方向键 <Left>。
    -- @param >：允许在当前行的末尾使用右方向键 <Right>。
    -- @param [：允许在未映射的方向键的前一个使用左方向键 <Left>。
    -- @param ]：允许在未映射的方向键的后一个使用右方向键 <Right>。
    -- @param ~：允许在换行符后使用方向键跨行。
    whichwrap = 'b,h,l,<,>,[,],~',
    -- 允许在未保存文件的情况下切换缓冲区（文件），而无需先保存当前文件
    hidden = true,
    -- 设置弹出菜单(如补全菜单、命令建议等)的最大显示行数
    pumheight = 10,
    -- 设置了数字显示格式
    nrformats = { 'bin', 'hex', 'alpha' },
    -- 粘贴文本时临时禁用一些插件或映射
    paste = true,
    -- @param 控制命令行消息的显示方式和详细程度
    -- @param a：使用“可选文件已自动写入”的短消息，而不是完整消息。
    -- @param c：不显示模式更改的提示信息。
    -- @param f：在文件名被改变时，避免显示确认信息。
    -- @param o：关闭允许输入/输出文件的警告信息。
    -- @param O：在需要输入/输出文件时，避免显示确认信息。
    -- @param T：关闭标签页命令的附加短消息。
    -- @param W：关闭 " [w]ritten" 消息和文件写入警告。
    shortmess = vim.o.shortmess .. 'c',
    -- 控制是否显示标签页行(0、1)
    showtabline = 2,
    -- 底部状态栏显示当前输入的部分命令
    showcmd = true,
    -- 每个分割窗口都有单独的状态行
    laststatus = 2,
    -- 配置增量命令预览功能,例如内容替换
    inccommand = 'split',
}
