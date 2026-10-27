-- Diagnostics
vim.diagnostic.config({
    virtual_text = true,
    severity_sort = true,
})

vim.lsp.config("lua_ls", {
    settings = {
        Lua = {
            runtime = { version = "LuaJIT" },
            workspace = {
                checkThirdParty = false,
                library = {
                    vim.env.VIMRUNTIME,
                    "${3rd}/luv/library",
                },
            },
        },
    },
})

vim.lsp.config("vtsls", {
    settings = {
        typescript = { format = { enable = false } },
        javascript = { format = { enable = false } },
    },
})
