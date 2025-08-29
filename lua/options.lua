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

-- LSP 相关设置以避免同步错误
vim.lsp.set_log_level("WARN")  -- 减少日志级别避免过多错误信息
vim.opt.updatetime = 300  -- 更快的更新时间
vim.opt.signcolumn = "yes"  -- 始终显示符号列避免布局跳动

-- 设置 LSP 诊断选项
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,  -- 插入模式下不更新诊断
  severity_sort = true,
})

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!
