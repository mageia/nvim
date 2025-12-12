require "nvchad.mappings"

local map = vim.keymap.set

-- 以下是与 NvChad 默认不同的自定义映射

-- 快捷进入命令模式（NvChad 无此映射）
map("n", ";", ":", { desc = "CMD enter command mode" })

-- 快捷退出插入模式（NvChad 无此映射）
map("i", "jk", "<ESC>")

-- NvimTree 切换（NvChad 默认是 Focus，这里改为 Toggle）
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "nvimtree toggle window" })

-- 保存文件：扩展到插入和可视模式（NvChad 默认仅 normal 模式）
map({ "i", "v" }, "<C-s>", "<cmd>w<CR>", { desc = "general save file" })
