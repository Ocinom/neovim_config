vim.keymap.set("n", "<leader>px", vim.cmd.Ex)
vim.keymap.set("n", "<leader>ex", vim.cmd.Ex)

-- Cargo check
vim.keymap.set("n", "<leader>cc", ":!cargo check<CR>")
vim.keymap.set("n", "<leader>cr", ":!cargo run<CR>")
vim.keymap.set("n", "<leader>cT", ":!cargo test<CR>")
vim.keymap.set("n", "<leader>ct", ":!cargo pretty-test<CR>")
vim.keymap.set("n", "<leader>cb", ":!cargo build<CR>")

-- Surround visual select with quotes
vim.keymap.set("v", "''", ":s/\\%V.*\\%V/\"&\"/<CR>")
vim.keymap.set("n", "'w", "viw<right>:s/\\%V.*\\%V/\"&\"/<CR>")

-- Edit confs
vim.keymap.set("n", "<leader>Cr", ":e ~/.config/nvim/lua/remaps.lua <CR>")
vim.keymap.set("n", "<leader>Cp", ":e ~/.config/nvim/lua/plugins.lua <CR>")
vim.keymap.set("n", "<leader>Ci", ":e ~/.config/nvim/init.lua <CR>")
vim.keymap.set("n", "<leader>Cs", ":e ~/.config/nvim/lua/set.lua <CR>")

-- Commenting
vim.keymap.set("n", "<leader>\\", ":TComment<CR>")
vim.keymap.set("v", "<leader>\\", ":TComment<CR>")
vim.keymap.set("i", "<leader>\\", "<Esc>:TComment<CR>i")

-- Back to previous file
vim.keymap.set("n", "<leader>b", "<C-6>")

-- Semicolon at the end
vim.keymap.set("i", "<leader>;", "<Esc>A;<Esc>")

-- Telescope keymaps
local builtin = require('telescope.builtin')
vim.keymap.set("n", "<C-f>", builtin.find_files, {})
vim.keymap.set("n", "<C-g>", builtin.live_grep, {})
vim.keymap.set("n", "<C-h>", builtin.git_files, {})
vim.keymap.set("n", "<C-k>", builtin.keymaps, {})

-- Harpoons keymaps
local mark = require("harpoon.mark")
local ui = require("harpoon.ui")
vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader><leader>", ui.toggle_quick_menu)

vim.keymap.set("n", "<leader>1", function() ui.nav_file(1) end)
vim.keymap.set("n", "<leader>2", function() ui.nav_file(2) end)
vim.keymap.set("n", "<leader>3", function() ui.nav_file(3) end)
vim.keymap.set("n", "<leader>4", function() ui.nav_file(4) end)

-- NERDTree remaps
vim.keymap.set("n", "<leader>t", ":NERDTreeToggle<CR>", {noremap = true, silent = false})
vim.keymap.set("n", "<leader>tt", ":ToggleTerm direction=vertical size=100<CR>", { noremap = true, silent = false })
vim.keymap.set("t", "<leader>tt", "<C-\\><C-n>:ToggleTerm<CR>")

-- Undotree remaps
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)

-- Vim fugitive remaps
vim.keymap.set("n", "<leader>gs", vim.cmd.Git) 

-- Go-specific if err != nil block
vim.keymap.set("n", "<leader>en", "iif err != nil {}<left><CR><CR><up><tab><tab>", { noremap = true, silent = false })
vim.keymap.set("i", "<leader>en", "if err != nil {}<left><CR><CR><up><tab><tab>", { noremap = true, silent = false })

vim.keymap.set("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", { noremap = true, silent = true })
vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", { noremap = true, silent = true })

-- Easy word deletion in insert mode
vim.keymap.set("i", "<C-BS>", "<Esc>diwi<right>", { noremap = true, silent = true })

-- Leap bindings
vim.keymap.set({'n', 'x', 'o'}, 's', '<Plug>(leap-forward)')
vim.keymap.set({'n', 'x', 'o'}, 'S', '<Plug>(leap-backward)')
vim.keymap.set({'n', 'x', 'o'}, '<leader>s', '<Plug>(leap-from-window)')

-- Custom write! from insert
vim.keymap.set("i", "<leader>=", "<Esc>:w!<CR>i")
vim.keymap.set("n", "<leader>=", ":w!<CR>")

-- Vim fugitive binds
vim.keymap.set("n", "<leader>gg", ":Git<CR>")
vim.keymap.set("i", "<leader>gg", "<Esc>:Git<CR>")

-- markdown-preview keymaps
vim.keymap.set("n", "<leader>MD", "<Plug>MarkdownPreview")
