require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "prettierd", },
        typescript = { "prettierd", },
        html = { "prettierd", },
        javascriptreact = { "prettierd", },
        typescriptreact = { "prettierd", },
        css = { "prettierd", },
        scss = { "prettierd", },
        markdown = { "prettierd", },
        json = { "prettierd", },
        graphql = { "prettierd", },
        md = { "prettierd", },
        python = { "ruff_fix", "ruff_format", "ruff_organize_imports" },
        rust = { "rustfmt" },
        go = { "gofmt" },
        sql = { "sqlfmt" },
        sh = { "shfmt" }
    },
    -- Set default options
    default_format_opts = {
        lsp_format = "fallback",
    },
    -- Set up format-on-save
    format_on_save = { timeout_ms = 500 },
})
