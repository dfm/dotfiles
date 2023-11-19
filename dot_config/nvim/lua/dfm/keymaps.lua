vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })
vim.keymap.set({ "n", "i", "v" }, "<C-a>", "<Nop>", { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic message" })
-- vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

-- My favorite keybinds
vim.keymap.set({ "i", "n" }, "<ESC>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })
vim.keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })
vim.keymap.set("i", "kj", "<ESC>", { desc = "Exit insert mode" })
vim.keymap.set("n", ",.", "<cmd>w<cr><esc>", { desc = "Save file" })
vim.keymap.set("n", ".,", "<cmd>w<cr><esc>", { desc = "Save file" })
vim.keymap.set({ "i", "x", "n", "s" }, "<C-s>", "<cmd>w<cr><esc>", { desc = "Save file" })

-- Exit terminal mode with esc
vim.keymap.set("t", "<ESC>", "<C-\\><C-n>", { desc = "Exit terminal model" })

-- Better navigation between panes
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move one pane left" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move one pane down" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move one pane up" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move one pane right" })

vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Move one pane left" })
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Move one pane down" })
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Move one pane up" })
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Move one pane right" })

-- Resize with arrows
vim.keymap.set({ "n", "t" }, "<C-Up>", "<cmd>resize -2<CR>")
vim.keymap.set({ "n", "t" }, "<C-Down>", "<cmd>resize +2<CR>")
vim.keymap.set({ "n", "t" }, "<C-Left>", "<cmd>vertical resize -2<CR>")
vim.keymap.set({ "n", "t" }, "<C-Right>", "<cmd>vertical resize +2<CR>")

-- Navigate buffers
vim.keymap.set("n", "<S-l>", ":bnext<CR>")
vim.keymap.set("n", "<S-h>", ":bprevious<CR>")

-- Stay in visual after indenting
vim.keymap.set("v", "<", "<gv^")
vim.keymap.set("v", ">", ">gv^")

-- Allow clipboard copy paste in neovide
vim.g.neovide_input_use_logo = 1
vim.api.nvim_set_keymap("", "<D-v>", "+p<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("!", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("t", "<D-v>", "<C-R>+", { noremap = true, silent = true })
vim.api.nvim_set_keymap("v", "<D-v>", "<C-R>+", { noremap = true, silent = true })
