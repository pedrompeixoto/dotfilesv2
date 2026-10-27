return {
    {
        "mason-org/mason.nvim",
        cmd = "Mason",
        opts = {},
    },
    {
        "mason-org/mason-lspconfig.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "mason-org/mason.nvim",
            "neovim/nvim-lspconfig",
            -- load blink first so it registers its LSP capabilities before servers start
            "saghen/blink.cmp",
        },
        opts = {
            ensure_installed = { "lua_ls", "oxfmt", "oxlint", "vtsls" },
        },
    },
}
