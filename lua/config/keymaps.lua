-- 本地变量
---- 创建 Map 键映射
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

---- Map 健 保存退出
map("n", "<leader>w", ":w<CR>", opt)
map("n", "<leader>wq", ":wqa!<CR>", opt)
---- 退出
map("n", "<leader>q", ":q!<CR>", opt)
map("n", "<leader>qq", ":qa!<CR>", opt)

---- Visual Mode 将选择块移动
map("v", "J", ":m '>+1<CR>gv=gv", opt)
map("v", "K", ":m '>-2<CR>gv=gv", opt)

------------------------------------------------------------------
-- windows 分屏快捷键
------------------------------------------------------------------
-- 取消 s 默认功能
-- map("n", "s", "", opt)
-- map("n", "sv", ":vsp<CR>", opt)
-- map("n", "sh", ":sp<CR>", opt)
-- 关闭当前
-- map("n", "sc", "<C-w>c", opt)
-- 关闭其他
-- map("n", "so", "<C-w>o", opt) -- close others
-- alt + hjkl  窗口之间跳转
map("n", "<C-h>", "<C-w>h", opt)
map("n", "<C-j>", "<C-w>j", opt)
map("n", "<C-k>", "<C-w>k", opt)
map("n", "<C-l>", "<C-w>l", opt)
-- <leader> + hjkl 窗口之间跳转
map("n", "<leader>h", "<C-w>h", opt)
map("n", "<leader>j", "<C-w>j", opt)
map("n", "<leader>k", "<C-w>k", opt)
map("n", "<leader>l", "<C-w>l", opt)
-- 左右比例控制
-- map("n", "<C-Left>", ":vertical resize -2<CR>", opt)
-- map("n", "<C-Right>", ":vertical resize +2<CR>", opt)
-- map("n", "s,", ":vertical resize -10<CR>", opt)
-- map("n", "s.", ":vertical resize +10<CR>", opt)
-- 上下比例
-- map("n", "sj", ":resize +10<CR>", opt)
-- map("n", "sk", ":resize -10<CR>", opt)
-- map("n", "<C-Down>", ":resize +2<CR>", opt)
-- map("n", "<C-Up>", ":resize -2<CR>", opt)
-- 相等比例
-- map("n", "s=", "<C-w>=", opt)

-- Terminal相关
map("n", "st", ":sp | terminal<CR>", opt)
map("n", "stv", ":vsp | terminal<CR>", opt)
-- Esc 回 Normal 模式
map("t", "<Esc>", "<C-\\><C-n>", opt)
map("t", "<A-h>", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<A-j>", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<A-k>", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<A-l>", [[ <C-\><C-N><C-w>l ]], opt)
map("t", "<leader>h", [[ <C-\><C-N><C-w>h ]], opt)
map("t", "<leader>j", [[ <C-\><C-N><C-w>j ]], opt)
map("t", "<leader>k", [[ <C-\><C-N><C-w>k ]], opt)
map("t", "<leader>l", [[ <C-\><C-N><C-w>l ]], opt)

-- visual模式下缩进代码
map("v", "<", "<gv", opt)
map("v", ">", ">gv", opt)
-- 上下移动选中文本
map("v", "J", ":move '>+1<CR>gv-gv", opt)
map("v", "K", ":move '<-2<CR>gv-gv", opt)

-- 在visual mode 里粘贴不要复制
-- map("v", "p", '"_dP', opt)

-- 上下滚动浏览
-- map("n", "<C-j>", "5j", opt)
-- map("n", "<C-k>", "5k", opt)
-- map("v", "<C-j>", "5j", opt)
-- map("v", "<C-k>", "5k", opt)
-- ctrl u / ctrl + d  只移动9行，默认移动半屏
-- map("n", "<C-u>", "10k", opt)
-- map("n", "<C-d>", "10j", opt)

-- insert 模式下，跳到行首行尾
-- map("i", "<C-h>", "<ESC>I", opt)
-- map("i", "<C-l>", "<ESC>A", opt)

