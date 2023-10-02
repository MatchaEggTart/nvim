local option = vim.opt
local buffer = vim.b
local global = vim.g

-- This file is automatically loaded by plugins.core
global.mapleader = ","
global.maplocalleader = "\\"

-- utf8
option.fileencoding = 'UTF-8'
global.encoding = "UTF-8"
buffer.fileencoding = 'UTF-8'

option.autowrite = true -- Enable auto write

-- 系统剪贴板
option.clipboard = "unnamedplus" -- Sync with system clipboard
-- opt.clipboard:append("unnamedplus")

-- 自动补全不自动选中
option.completeopt = "menu,menuone,noselect"

-- 隐藏引号
option.conceallevel = 3  -- Hide * markup for bold and italic
option.confirm = true    -- Confirm to save changes before exiting modified buffer
option.cursorline = true -- Enable highlighting of the current line

-- 格式选项
option.formatoptions = "jcroqlnt" -- tcqj
option.grepformat = "%f:%l:%c:%m"
option.grepprg = "rg --vimgrep"

-- 搜索大小写不敏感，除非包含大写
option.ignorecase = true -- Ignore case
option.smartcase = true  -- Don't ignore case with capitals

-- 搜索不要高亮
option.hlsearch = false

-- 边输入边搜索
option.incsearch = true

option.inccommand = "nosplit" -- preview incremental substitute
option.laststatus = 0
-- opt.list = true -- Show some invisible characters (tabs...

-- 鼠标支持
option.mouse = "a" -- Enable mouse mode
-- opt.mouse:append("a")

option.number = true -- Print line number

-- 补全最多显示10行
option.pumblend = 10          -- Popup blend
option.pumheight = 10         -- Maximum number of entries in a popup

option.relativenumber = false -- Relative line numbers
option.scrolloff = 4          -- Lines of context
option.sessionoptions = { "buffers", "curdir", "tabpages", "winsize" }
option.shortmess:append({ W = true, I = true, c = true })

-- 使用增强状态栏插件后不再需要 vim 的模式提示
option.showmode = false  -- Dont show mode since we have a statusline
option.sidescrolloff = 8 -- Columns of context

-- 显示左侧图标指示列
option.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time

option.spelllang = { "en" }
option.timeoutlen = 500
option.undofile = true
option.undolevels = 10000
option.updatetime = 200               -- Save swap file and trigger CursorHold
option.wildmode = "longest:full,full" -- Command-line completion mode
option.winminwidth = 5                -- Minimum window width

-- 禁止折行
option.wrap = true -- Disable line wrap

-- 缩进
option.tabstop = 2       -- Number of spaces tabs count for
option.shiftwidth = 2    -- Size of an indent
option.softtabstop = 2
option.shiftround = true -- Round indent
option.expandtab = true  -- Use spaces instead of tabs

-- 新行对齐当前行
option.autoindent = true
option.smartindent = true -- Insert indents automatically

-- 命令行高为2，提供足够的显示空间
option.cmdheight = 2

-- 当文件被外部程序修改时，自动加载
option.autoread = true

-- 光标在行首尾时<Left><Right>可以跳到下一行
option.whichwrap = '<,>,[,]'

-- 允许隐藏被修改过的buffer
option.hidden = true

-- 禁止创建备份文件
option.backup = false
option.writebackup = false
option.swapfile = false

-- split window 从下边和右边出现
option.splitbelow = true -- Put new windows below current
option.splitright = true -- Put new windows right of current

-- 样式
option.background = "dark"
-- 真色
option.termguicolors = true -- True color support

-- 补全增强
option.wildmenu = true

-- 项目下的.nvim 配置读取
option.exrc = false

-- 永远显示 tabline
-- opt.showtabline = 2

--[[
if vim.fn.has("nvim-0.9.0") == 1 then
  opt.splitkeep = "screen"
  opt.shortmess:append({ C = true })
end
]]
   --
-- Fix markdown indentation settings

global.markdown_recommended_style = 0

if vim.fn.has('wsl') then
  vim.cmd [[
  augroup Yank
  autocmd!
  autocmd TextYankPost * :call system('/mnt/c/windows/system32/clip.exe ',@")
  augroup END
  ]]
end
