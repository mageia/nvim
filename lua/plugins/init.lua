return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre', -- 启用保存时自动格式化
    opts = require "configs.conform",
  },

  {
    "neovim/nvim-lspconfig",
    lazy = true,
    event = { "BufReadPre", "BufNewFile" },  -- 在打开或创建文件时加载
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",  -- LSP 补全源
    },
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    event = { "BufReadPost", "BufNewFile" },
    cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
    build = ":TSUpdate",
    opts = function()
      local opts = require "nvchad.configs.treesitter"
      opts.ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "html",
        "css",
        "javascript",
        "typescript",
        "python",
        "markdown",
        "json",
      }
      return opts
    end,
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- 自动补全核心插件
  {
    "hrsh7th/nvim-cmp",
    lazy = true,
    event = "InsertEnter",
    dependencies = {
      -- 补全源
      "hrsh7th/cmp-nvim-lsp", -- LSP补全
      "hrsh7th/cmp-buffer", -- 缓冲区补全
      "hrsh7th/cmp-path", -- 路径补全
      "hrsh7th/cmp-cmdline", -- 命令行补全
      
      -- 代码片段引擎
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip", -- 代码片段补全
      
      -- 补全时显示代码参数的虚拟提示
      -- "ray-x/lsp-signature.nvim",
    },
    config = function()
      local cmp = require("cmp")
      
      cmp.setup({
        snippet = {
          expand = function(args)
            require('luasnip').lsp_expand(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered(),
          documentation = cmp.config.window.bordered(),
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-c>'] = cmp.mapping.abort(),
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { 'i', 's' }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
          { name = 'buffer' },
          { name = 'path' },
        })
      })
    end
  },

  -- Github Copilot
  {
    "zbirenbaum/copilot.lua",
    lazy = true,
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
        keymap = {
          accept = "<C-e>",
          accept_word = false,
          accept_line = "<C-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-]>",
        },
      },
      panel = { 
        enabled = true,
        auto_refresh = true,
      },
      filetypes = {
        ["*"] = true,
      },
    },
  },

}