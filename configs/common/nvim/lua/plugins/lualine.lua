return {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-mini/mini.icons" },
    opts = {
        options = {
            theme = "tokyonight",
            globalstatus = true,
        },
    },
}
