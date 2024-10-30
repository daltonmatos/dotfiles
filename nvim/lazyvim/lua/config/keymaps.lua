-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local keymap = vim.keymap

keymap.del({ "t" }, "<c-l>")
keymap.del({ "n" }, "<leader>gf")
keymap.del({ "n" }, "<leader>gg")
keymap.del({ "n" }, "<leader>gG")
keymap.del({ "n" }, "<leader>gl")
keymap.del({ "n" }, "<leader>gL")

keymap.set({ "n" }, "<leader>wq", "<cmd>close<cr>", { desc = "Close Current Window Only", silent = true })

keymap.set({ "n" }, "<leader>B", "", { desc = "Bookmarked Projects" })
keymap.set(
  { "n" },
  "<leader>BF",
  "<cmd>Telescope project display_type=full hide_workspace=true<cr>",
  { desc = "Find Project", silent = true }
)

keymap.set({ "n" }, "<leader>gs", "<cmd>Neogit<cr>", { desc = "Git status", silent = true })
keymap.set(
  { "n" },
  "<leader>gl",
  "<cmd>DiffviewFileHistory %<cr>",
  { desc = "Git History (Current file)", silent = true }
)
keymap.set(
  { "n" },
  "<leader>gL",
  "<cmd>DiffviewFileHistory<cr>",
  { desc = "Git History (Current branch)", silent = true }
)
