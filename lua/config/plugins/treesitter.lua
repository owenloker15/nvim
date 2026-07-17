return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  branch = "main",
  config = function()
    local treesitter = require("nvim-treesitter")

    treesitter.setup()

    treesitter.install({
      "json",
      "javascript",
      "html",
      "css",
      "bash",
      "lua",
      "vim",
      "vimdoc",
      "dockerfile",
      "gitignore",
      "c",
      "cpp",
      "cmake",
      "python",
      "rust",
    })

    -- Enable treesitter highlighting
    vim.api.nvim_create_autocmd("FileType", {
      callback = function(args)
        pcall(vim.treesitter.start, args.buf)
      end,
    })

    -- use bash parser for zsh files
    vim.treesitter.language.register("bash", "zsh")
  end,
}