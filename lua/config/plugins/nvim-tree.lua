return {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("nvim-tree").setup({
            sort = {
                sorter = "case_sensitive",
            },
            view = {
                width = 40,
                side = "left",
                preserve_window_proportions = true,
            },
            renderer = {
                group_empty = true,
                highlight_git = true,
                highlight_opened_files = "name",
                indent_markers = {
                    enable = true,
                },
                icons = {
                    show = {
                        git = true,
                        folder = true,
                        file = true,
                        folder_arrow = true,
                    },
                },
            },
            filters = {
                dotfiles = false,
                custom = { "^.git$" },
            },
            git = {
                enable = true,
                ignore = false,
            },
            diagnostics = {
                enable = true,
                show_on_dirs = true,
                show_on_open_dirs = true,
            },
            actions = {
                open_file = {
                    resize_window = true,
                },
            },
        })

        -- Keybindings
        vim.keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
        vim.keymap.set("n", "<leader>ef", ":NvimTreeFocus<CR>", { desc = "Focus NvimTree" })
        vim.keymap.set("n", "<leader>ec", ":NvimTreeCollapse<CR>", { desc = "Collapse NvimTree" })
        vim.keymap.set("n", "<leader>er", ":NvimTreeRefresh<CR>", { desc = "Refresh NvimTree" })
    end
}
