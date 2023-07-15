-- Leader Key 为空，设置 Leader Key
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- 本地变量
---- 创建 Map 键映射
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = true }

---- Map 健 保存退出
map("n", "<leader>w", ":w<CR>", opt)
map("n", "<leader>wq", ":wqa!<CR>", opt)
---- 退出
-- map("n", "<leader>qq", ":q!<CR>", opt)
map("n", "<leader>q", ":qa!<CR>", opt)
