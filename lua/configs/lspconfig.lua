-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")
local nvlsp = require "nvchad.configs.lspconfig"

-- LSP 服务器列表（目前通过 autocmd 按需加载，此列表仅作参考）
-- local servers = {
--   "ruff",        -- Python 的代码检查工具
--   "gopls",       -- Go 的官方 LSP
--   "lua_ls",      -- Lua 的 LSP
-- }

-- 通用 LSP 配置
local common_config = {
  on_attach = nvlsp.on_attach,
  on_init = nvlsp.on_init,
  capabilities = nvlsp.capabilities,
  flags = {
    debounce_text_changes = 150,
  },
}

-- 按文件类型延迟加载 LSP
vim.api.nvim_create_autocmd("FileType", {
  pattern = "python",
  callback = function()
    -- Python LSP 配置
    vim.defer_fn(function()
      -- Ruff LSP
      lspconfig.ruff.setup(vim.tbl_deep_extend("force", common_config, {
        init_options = {
          settings = {
            -- Ruff 特定设置
            args = {},
          }
        }
      }))
    end, 100)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "go",
  callback = function()
    -- Go LSP 配置
    vim.defer_fn(function()
      lspconfig.gopls.setup(vim.tbl_deep_extend("force", common_config, {
        settings = {
          gopls = {
            analyses = {
              unusedparams = true,
            },
            staticcheck = true,
            gofumpt = true,
          },
        },
      }))
    end, 100)
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "lua",
  callback = function()
    -- Lua LSP 配置
    vim.defer_fn(function()
      lspconfig.lua_ls.setup(vim.tbl_deep_extend("force", common_config, {
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
            workspace = {
              library = vim.api.nvim_get_runtime_file("", true),
              checkThirdParty = false,
            },
            telemetry = {
              enable = false,
            },
          },
        },
      }))
    end, 100)
  end,
})
