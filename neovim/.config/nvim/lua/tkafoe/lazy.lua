-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out,                            "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    -- Lazy can manage itself
    { "folke/lazy.nvim" },

    -- Telescope with plenary dependency
    {
        'nvim-telescope/telescope.nvim',
        version = '0.1.8',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },

    -- Rose-pine theme with setup to apply colorscheme on load
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        config = function()
            vim.cmd('colorscheme rose-pine')
        end
    },

    -- Kanagawa theme
    { "rebelot/kanagawa.nvim" },

    -- Treesitter with update command
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate'
    },

    -- Harpoon
    { 'theprimeagen/harpoon' },

    -- Undotree
    { 'mbbill/undotree' },

    -- Fugitive for Git integration
    { 'tpope/vim-fugitive' },
    -- LSP-zero and its dependencies
    { 'neovim/nvim-lspconfig' },
    { 'hrsh7th/cmp-nvim-lsp' },
    { 'hrsh7th/nvim-cmp' },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'williamboman/mason.nvim' },

    -- GitHub Copilot
    { 'github/copilot.vim' },

    -- Git gutter for diff signs
    { 'airblade/vim-gitgutter' },

    -- Alpha for dashboard start screen
    {
        'goolord/alpha-nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require 'alpha'.setup(require 'alpha.themes.startify'.config)
        end
    },

    -- Lualine for status line
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup()
        end
    },

    -- Vim Visual Multi
    { 'mg979/vim-visual-multi' },

    -- Nvim-tree for file explorer
    { 'nvim-tree/nvim-tree.lua' },

    -- Auto pairs for automatic pairing of brackets, etc.
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    },

    -- Github Copilot chat
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        branch = "canary",
        dependencies = {
            { "github/copilot.lua" },    -- or github/copilot.vim
            { "nvim-lua/plenary.nvim" }, -- for curl, log wrapper
        },
        build = "make tiktoken",         -- Only on MacOS or Linux
        opts = {
            debug = true,                -- Enable debugging
            -- See Configuration section for rest
        },
        -- See Commands section for default commands if you want to lazy load on them
    },
})
