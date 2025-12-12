require "nvchad.options"

-- NvChad 默认已设置: number, relativenumber, expandtab, shiftwidth,
-- tabstop, ignorecase, smartcase, clipboard, cursorline 等

local opt = vim.opt

-- 自定义选项（覆盖或补充 NvChad 默认值）
opt.scrolloff = 8
opt.sidescrolloff = 8
opt.cmdheight = 1
opt.showtabline = 2

-- LSP 相关设置
vim.lsp.set_log_level("WARN")
opt.updatetime = 300
opt.signcolumn = "yes"

-- LSP 诊断选项
vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
