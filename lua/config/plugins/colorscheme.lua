return {
	{
		"owenloker15/custom-vsassist.nvim",
		priority = 1000,
		config = function()
			vim.cmd.colorscheme("custom-vsassist")
		end,
	},
	--	{
	--		"BoHomola/vsassist.nvim",
	--		priority = 1000,
	--		config = function()
	--			vim.cmd.colorscheme("vsassist")
	--		end,
	--	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 999,
		config = function()
			require("catppuccin").setup({ flavour = "mocha" })
			-- vim.cmd.colorscheme("catppuccin") -- Commented out to avoid override
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		opts = {},
		config = function()
			-- vim.cmd.colorscheme("tokyonight") -- Commented out to avoid override
		end,
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
