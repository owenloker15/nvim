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
    "sainnhe/gruvbox-material",
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_background = "medium" -- soft | medium | hard
      vim.g.gruvbox_material_palette = "mix"       -- default | mix | original
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_enable_italic = 1

      vim.cmd.colorscheme("gruvbox-material")
    end,
  },

  -- Visual assist layer
  {
    "bartekprtc/gruv-vsassist.nvim",
    dependencies = { "sainnhe/gruvbox-material" },
    config = function()
      require("gruv-vsassist").setup({
        transparent_mode = false, -- set true if you use a transparent terminal
      })
    end,
  },
}
