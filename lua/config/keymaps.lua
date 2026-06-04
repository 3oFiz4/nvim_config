-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local wk = require("which-key")

-- Oil Keymap
map("n", "-", function()
  -- open vertical split on the left
  vim.cmd("topleft vsplit")

  -- set width to 20% of the screen
  local width = math.floor(vim.o.columns * 0.2)
  vim.cmd("vertical resize " .. width)

  -- open Oil in the split
  vim.cmd("Oil")
end, { desc = "Open Oil (20% width)" })

local statusline_visible = true

local function toggle_statusline()
  statusline_visible = not statusline_visible

  if statusline_visible then
    vim.opt.laststatus = 3
    vim.opt.showmode = true
  else
    vim.opt.laststatus = 0
    vim.opt.showmode = false
  end
end

map("n", "<leader>aS", toggle_statusline, {
  desc = "Toggle Statusline",
})
