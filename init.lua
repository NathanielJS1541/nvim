vim.o.number = true
vim.o.mouse = "a"
vim.o.termguicolors= true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.smarttab = true
-- vim.o.smartindent = true
vim.o.completeopt = "menu,menuone,noselect"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.clipboard = "unnamedplus"
vim.o.scrolloff = 10
vim.g.bufferline = {
        auto_hide = true
}

-- Lua script to initialise plugins
require("plugins")
-- Use standard setup functions where available
require("nvim-treesitter.install").compilers = { "zig", "clang" }
require("nvim-tree").setup()
require('lualine').setup()
-- Custom setup for markdown-preview
require("markdown_preview")
-- Custom setup for telescope
require("telescope_init")
-- Custom setup: highlighting for indent_blankline
require("indent_blankline_init")
-- Custom setup: mappings and commands for barbar
require("barbar_init")
-- Custom setup for Coc
require("coc_init")
-- Custom setup for ruff-lsp
require("ruff_init")

-- Setup keymaps for hover.nvim
vim.keymap.set("n",  "K", require("hover").hover       , { desc="hover.nvim"         })
vim.keymap.set("n", "gK", require("hover").hover_select, { desc="hover.nvim (select)" })

-- Choose colorscheme
vim.cmd [[silent! colorscheme dracula]]
-- vim.cmd [[silent! colorscheme nightfox]]
-- vim.cmd [[silent! colorscheme duskfox]]
-- vim.cmd [[silent! colorscheme nordfox]]
-- vim.cmd [[silent! colorscheme terafox]]

-- Set node.exe
vim.cmd [[let g:node_host_prog = expand("~/scoop/persist/nodejs/bin/node_modules/neovim/bin/cli.js")]]
vim.cmd [[let g:coc_node_path = expand("~/scoop/apps/nodejs/current/node.EXE")]]

-- Set python.exe
vim.cmd [[let g:python3_host_prog = expand("~/neovim_venv/Scripts/python.EXE")]]

-- Keybindings to run the file being edited
-- Run Python Files with F9
vim.cmd [[autocmd FileType python map <buffer> <F9> :w<CR>:exec '!python' shellescape(@%, 1)<CR>]]
vim.cmd [[autocmd FileType python imap <buffer> <F9> <esc>:w<CR>:exec '!python' shellescape(@%, 1)<CR>]]
