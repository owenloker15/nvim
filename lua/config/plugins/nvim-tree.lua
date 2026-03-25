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
            update_focused_file = {
                enable = false, -- disable auto-sync
                update_cwd = false,
                ignore_list = {},
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

        -- Toggle focus between NvimTree and previous window
        vim.keymap.set("n", "<leader>ef", function()
            local api = require("nvim-tree.api")
            local view = require("nvim-tree.view")
            -- Check if current buffer is NvimTree
            if vim.bo.filetype == "NvimTree" then
                -- Go to previous window
                vim.cmd("wincmd p")
            else
                -- Focus NvimTree
                api.tree.focus()
            end
        end, { desc = "Toggle focus NvimTree/previous window" })

        vim.keymap.set("n", "<leader>ee", ":NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
        vim.keymap.set("n", "<leader>ec", ":NvimTreeCollapse<CR>", { desc = "Collapse NvimTree" })
        vim.keymap.set("n", "<leader>er", ":NvimTreeRefresh<CR>", { desc = "Refresh NvimTree" })
        vim.keymap.set("n", "<leader>es", ":NvimTreeFindFile<CR>", { desc = "Sync NvimTree to current file" })
    end
}
