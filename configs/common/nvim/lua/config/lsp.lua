-- Diagnostics
vim.diagnostic.config({
    virtual_text = true,
    severity_sort = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("user-lsp-keymaps", { clear = true }),
    callback = function(ev)
        local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = ev.buf, desc = "LSP: " .. desc })
        end

        map("n", "gd", vim.lsp.buf.definition, "Go to definition")
        map("n", "gD", vim.lsp.buf.declaration, "Go to declaration")
        map("n", "<leader>rn", vim.lsp.buf.rename, "Rename symbol")
        map({ "n", "x" }, "<leader>ca", vim.lsp.buf.code_action, "Code action")
        map("n", "<leader>gr", vim.lsp.buf.references, "References")
        map("n", "<leader>gi", vim.lsp.buf.implementation, "Go to implementation")
        map("n", "<leader>gt", vim.lsp.buf.type_definition, "Go to type definition")
        map("n", "<leader>ds", vim.lsp.buf.document_symbol, "Document symbols")
        map("n", "<leader>e", vim.diagnostic.open_float, "Show line diagnostics")
        map("n", "<leader>q", vim.diagnostic.setloclist, "Diagnostics to loclist")
        map("n", "<leader>ws", vim.lsp.buf.workspace_symbol, "Workspace symbols")

        local client = vim.lsp.get_client_by_id(ev.data.client_id)
        if client and client:supports_method("textDocument/inlayHint") then
            map("n", "<leader>th", function()
                vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = ev.buf }), { bufnr = ev.buf })
            end, "Toggle inlay hints")
        end
    end,
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
