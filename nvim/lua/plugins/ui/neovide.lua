-- sudo snap install neovide --edge
-- `edge表示最新版`
if vim.g.neovide then
    -- 设置透明度 取值范围从 0（完全透明）到 1（完全不透明）
    vim.g.neovide_transparency = 0.9
    -- 设置字体 这里的 h14 指定字体大小为 14 点，i 表示使用斜体
    vim.o.guifont = 'JetbrainsMono Nerd Font:h14:i'
    -- 设置 Neovide 窗口的缩放因子为 1.6
    vim.g.neovide_scale_factor = 1.6
end