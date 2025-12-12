-- 使用 Neovim 0.11+ 的新 LSP 配置 API
-- 参考: :help lspconfig-nvim-0.11

require("nvchad.configs.lspconfig").defaults()

local nvlsp = require "nvchad.configs.lspconfig"

-- 通用 on_attach 函数
local on_attach = function(client, bufnr)
  -- 禁用 LSP 格式化（使用 conform.nvim 代替）
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false
  nvlsp.on_attach(client, bufnr)
end

-- 通用配置
local common = {
  on_attach = on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
}

-- Ruff (Python)
vim.lsp.config("ruff", common)

-- Gopls (Go)
vim.lsp.config("gopls", vim.tbl_extend("force", common, {
  settings = {
    gopls = {
      analyses = { unusedparams = true },
      staticcheck = true,
      gofumpt = true,
    },
  },
}))

-- Lua LS
vim.lsp.config("lua_ls", vim.tbl_extend("force", common, {
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
      workspace = {
        library = vim.api.nvim_get_runtime_file("", true),
        checkThirdParty = false,
      },
      telemetry = { enable = false },
    },
  },
}))

-- 启用 LSP 服务器
vim.lsp.enable({ "ruff", "gopls", "lua_ls" })
