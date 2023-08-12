-- This file is automatically loaded by plugins.core
vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'UTF-8'

local opt = vim.opt

opt.autowrite = true -- Enable auto write

-- 系统剪贴板
opt.clipboard = "unnamedplus" -- Sync with system clipboard
-- opt.clipboard:append("unnamedplus")

-- 自动补全不自动选中
opt.completeopt = "menu,menuone,noselect"

-- 隐藏引号
opt.conceallevel = 3 -- Hide * markup for bold and italic
opt.confirm = true -- Confirm to save changes before exiting modified buffer
opt.cursorline = true -- Enable highlighting of the current line

-- 格式选项
opt.formatoptions = "jcroqlnt" -- tcqj
opt.grepformat = "%f:%l:%c:%m"
opt.grepprg = "rg --vimgrep"

-- 搜索大小写不敏感，除非包含大写
opt.ignorecase = true -- Ignore case
opt.smartcase = true -- Don't ignore case with capitals

-- 搜索不要高亮
opt.hlsearch = false

-- 边输入边搜索
opt.incsearch = true

opt.inccommand = "nosplit" -- preview incremental substitute
opt.laststatus = 0
-- opt.list = true -- Show some invisible characters (tabs...

-- 鼠标支持
opt.mouse = "a" -- Enable mouse mode
-- opt.mouse:append("a")

opt.number = true -- Print line number

-- 补全最多显示10行
opt.pumblend = 10 -- Popup blend
opt.pumheight = 10 -- Maximum number of entries in a popup

opt.relativenumber = false -- Relative line numbers
opt.scrolloff = 4 -- Lines of context
opt.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
opt.shortmess:append({ W = true, I = true, c = true })

-- 使用增强状态栏插件后不再需要 vim 的模式提示
opt.showmode = false -- Dont show mode since we have a statusline
opt.sidescrolloff = 8 -- Columns of context

-- 显示左侧图标指示列
opt.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time

opt.spelllang = { "en" }
opt.timeoutlen = 500
opt.undofile = true
opt.undolevels = 10000
opt.updatetime = 200 -- Save swap file and trigger CursorHold
opt.wildmode = "longest:full,full" -- Command-line completion mode
opt.winminwidth = 5 -- Minimum window width

-- 禁止折行
opt.wrap = false -- Disable line wrap

-- 缩进
opt.tabstop = 2 -- Number of spaces tabs count for
opt.shiftwidth = 2 -- Size of an indent
opt.softtabstop = 2
opt.shiftround = true -- Round indent
opt.expandtab = true -- Use spaces instead of tabs

-- 新行对齐当前行
opt.autoindent = true
opt.smartindent = true -- Insert indents automatically

-- 命令行高为2，提供足够的显示空间
opt.cmdheight = 2

-- 当文件被外部程序修改时，自动加载
opt.autoread = true

-- 光标在行首尾时<Left><Right>可以跳到下一行
opt.whichwrap = '<,>,[,]'

-- 允许隐藏被修改过的buffer
opt.hidden = true

-- 禁止创建备份文件
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- split window 从下边和右边出现
opt.splitbelow = true -- Put new windows below current
opt.splitright = true -- Put new windows right of current

-- 样式
opt.background = "dark"
opt.termguicolors = true -- True color support

-- 补全增强
opt.wildmenu = true

-- 永远显示 tabline
-- opt.showtabline = 2

--[[
if vim.fn.has("nvim-0.9.0") == 1 then
  opt.splitkeep = "screen"
  opt.shortmess:append({ C = true })
end
]]--
-- Fix markdown indentation settings

vim.g.markdown_recommended_style = 0
