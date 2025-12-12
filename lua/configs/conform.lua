local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "ruff_format", "ruff_organize_imports" },
    go = { "gofmt", "goimports" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    json = { "prettier" },
    markdown = { "prettier" },
  },

  format_on_save = {
    timeout_ms = 1000,
    lsp_fallback = true,
  },
}

return options
