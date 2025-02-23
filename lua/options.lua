require "nvchad.options"

local opt = vim.opt

-- 显示行号
opt.number = true
opt.relativenumber = true

-- 缩进设置
opt.expandtab = true
opt.shiftwidth = 2
opt.smartindent = true
opt.tabstop = 2
opt.softtabstop = 2

-- 搜索设置
opt.ignorecase = true
opt.smartcase = true

-- 系统剪贴板
opt.clipboard = "unnamedplus"

-- 显示光标行
opt.cursorline = true

-- 显示标签栏
opt.showtabline = 2

-- 设置命令行高度
opt.cmdheight = 1

-- 设置滚动余量
opt.scrolloff = 8
opt.sidescrolloff = 8

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
