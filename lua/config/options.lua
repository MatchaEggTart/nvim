-- local opt = vim.opt
-- 全局属性，我们可以利用 options来记忆
local o = vim.opt
-- 缓冲区属性，我们可以利用 buffer-option来记忆
local bo = vim.bo
-- 窗口属性, 我们可以利用 window-option来记忆
local wo = vim.wo

-- utf8
vim.g.encoding = "UTF-8"
vim.o.fileencoding = 'UTF-8'

-- jkhl 移动时光标周围保留8行
o.scrolloff = 8
o.sidescrolloff = 8

-- 行号
wo.number = true
-- wo.relativenumber = true

-- 高亮所在行
wo.cursorline = true

-- 语法高亮
-- o.syntax = true

-- 开启文件类型检测
-- o.filetype = true

-- 显示左侧图标指示列
wo.signcolumn = "yes"

-- 右侧参考线，超过表示代码太长了，考虑换行
-- vim.wo.colorcolumn = "80"

-- 缩进
o.tabstop = 2
bo.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.shiftround = true
o.expandtab = true
o.autoindent = true

-- >> << 时移动长度
o.shiftwidth = 2
bo.shiftwidth = 2

-- 空格替代tab
o.expandtab = true
bo.expandtab = true

-- 新行对齐当前行
o.autoindent = true
bo.autoindent = true
o.smartindent = true

-- 搜索大小写不敏感，除非包含大写
o.ignorecase = true
o.smartcase = true

-- 搜索不要高亮
o.hlsearch = false

-- 边输入边搜索
o.incsearch = true

-- 命令行高为2，提供足够的显示空间
o.cmdheight = 2

-- 当文件被外部程序修改时，自动加载
o.autoread = true
bo.autoread = true

-- 禁止折行
wo.wrap = true

-- 光标在行首尾时<Left><Right>可以跳到下一行
o.whichwrap = '<,>,[,]'


-- 允许隐藏被修改过的buffer
o.hidden = true

-- 鼠标支持
o.mouse:append("a")

-- 系统剪贴板
o.clipboard:append("unnamedplus")

-- 禁止创建备份文件
o.backup = false
o.writebackup = false
o.swapfile = false

-- smaller updatetime
o.updatetime = 300

-- 设置 timeoutlen 为等待键盘快捷键连击时间500毫秒，可根据需要设置
o.timeoutlen = 500

-- split window 从下边和右边出现
o.splitbelow = true
o.splitright = true

-- 自动补全不自动选中
vim.g.completeopt = "menu,menuone,noselect,noinsert"

-- 样式
o.background = "dark"
o.termguicolors = true
o.termguicolors = true

-- 不可见字符的显示，这里只把空格显示为一个点
-- vim.o.list = true
-- vim.o.listchars = "space:·"

-- 补全增强
o.wildmenu = true

-- Dont' pass messages to |ins-completin menu|
o.shortmess = vim.o.shortmess .. 'c'

-- 补全最多显示10行
o.pumheight = 10

-- 永远显示 tabline
o.showtabline = 2

-- 使用增强状态栏插件后不再需要 vim 的模式提示
o.showmode = false

-- 外观
-- o.termguicolors = true
-- o.signcolumn = "yes"
-- vim.cmd[[colorscheme tokyonight-moon]]
