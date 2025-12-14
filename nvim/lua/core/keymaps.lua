-- General keymaps that are non-plugin specific

local set = vim.keymap.set

set("n", "<C-s>", ":w<CR>", { desc = "Saves current buffer" })
set("i", "<C-s>", "<C-o>:w<CR>", { desc = "Saves current buffer" })
set("n", "<C-l>", ":source %<CR>", { desc = "Sources current bufer" })
set({ "n","i","v" }, "<C-j>", "<Esc>", {})
set("n", "<leader>q", ":q<CR>", { desc = "Closes buffer" })
set("n", "<C-Esc>", ":noh<CR>", { desc = "Clears search highlight" })
