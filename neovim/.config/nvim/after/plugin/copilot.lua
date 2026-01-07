vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "/Users/tomkafoe/dev/aoc/*",
    callback = function()
        vim.cmd("Copilot disable")
    end
})


vim.api.nvim_create_autocmd("BufEnter", {
    pattern = "/Users/tomkafoe/dev/java/*",
    callback = function()
        vim.cmd("Copilot disable")
    end
})
