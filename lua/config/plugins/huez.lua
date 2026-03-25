return {
    "vague2k/huez.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
        local pickers = require("huez.pickers")

        vim.keymap.set("n", "<leader>co", pickers.themes, { desc = "List all themes" })
        vim.keymap.set("n", "<leader>cof", pickers.favorites, { desc = "List all favorited themes" })
        vim.keymap.set("n", "<leader>col", pickers.live, { desc = "List of colorschemes from registry" })
        vim.keymap.set("n", "<leader>coe", pickers.ensured,
            { desc = "List of colorschemes from registry, ensuring they are installed" })
    end
}
