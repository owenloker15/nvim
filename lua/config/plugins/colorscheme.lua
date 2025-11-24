return {
    {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        require("catppuccin").setup({ flavour = "mocha" })
        vim.cmd.colorscheme("catppuccin")
    end
    },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        opts = {},
        config = function()
            vim.cmd.colorscheme("tokyonight")
        end
    },
    -- {
    --     "rose-pine/neovim",
    --     name = "rose-pine",
    --     config = function()
    --         require('rose-pine').setup({
    --             disable_background = true,
    --             styles = {
    --                 italic = false,
    --             },
    --         })
    --         vim.cmd.colorscheme("rose-pine")
    --     end
    -- },
}
