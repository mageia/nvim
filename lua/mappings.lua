require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

-- 常用命令
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- 文件树
map("n", "<leader>e", "<cmd> NvimTreeToggle <CR>")

-- 保存文件
map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- 窗口导航
map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })

-- 缓冲区导航
map("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Next buffer" })
map("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Prev buffer" })
