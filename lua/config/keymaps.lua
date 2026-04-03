-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = LazyVim.safe_keymap_set

map("n", "<leader>e", function()
  require("oil").open({ win_width = 0.2 })
end, { desc = "Open Oil (20% width)" })
map("n", "<leader>E", function()
  require("oil").open_cwd({ win_width = 0.2 })
end, { desc = "Open Oil in root (20% width)" })
