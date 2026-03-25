vim.opt.relativenumber = true
vim.opt.nu = true

-- tabs and indentation
-- Set indentation to 4 spaces instead of tabs
vim.opt.expandtab = true      -- Use spaces instead of tabs
vim.opt.shiftwidth = 4        -- Number of spaces for each indentation
vim.opt.tabstop = 4           -- Number of spaces that a <Tab> in the file counts for
vim.opt.softtabstop = 4       -- Number of spaces that a <Tab> counts for while performing editing operations
vim.opt.smartindent = true
vim.opt.autoindent = true -- copy indent from current line when starting a new one

vim.opt.wrap = false

-- search settings
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true  -- if you include mixed case in your search, assumes you want case sensitive

-- Terminal colors
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes"

-- backspace
vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line, or insert mode start position

-- clipboard
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register
vim.opt.clipboard = "unnamedplus"

-- splitting windows
vim.opt.splitright = true -- when splitting windows vertically, make it go to the right
vim.opt.splitbelow = true -- when splitting windows horizontally, make it go to below

vim.cmd("let g:netrw_liststyle = 3")
