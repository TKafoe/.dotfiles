require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettierd", "prettier", stop_after_first_use = true },
        typescript = { "prettierd", "prettier", stop_after_first_use = true },
        html = { "prettierd", "prettier", stop_after_first_use = true },
        javascriptreact = { "prettierd", "prettier", stop_after_first_use = true },
        typescriptreact = { "prettierd", "prettier", stop_after_first_use = true },
        css = { "prettierd", "prettier", stop_after_first_use = true },
        scss = { "prettierd", "prettier", stop_after_first_use = true },
        markdown = { "prettierd", "prettier", stop_after_first_use = true },
        json = { "prettierd", "prettier", stop_after_first_use = true },
        yaml = { "prettierd", "prettier", stop_after_first_use = true },
        graphql = { "prettierd", "prettier", stop_after_first_use = true },
        md = { "prettierd", "prettier", stop_after_first_use = true },
    },
    -- Set default options
    default_format_opts = {
        lsp_format = "fallback",
    },
    -- Set up format-on-save
    format_on_save = { timeout_ms = 500 },
})
