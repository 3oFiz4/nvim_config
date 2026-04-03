-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.have_nerd_font = true
vim.keymap.set("n", "-", function()
  -- open vertical split on the left
  vim.cmd("topleft vsplit")

  -- set width to 20% of the screen
  local width = math.floor(vim.o.columns * 0.2)
  vim.cmd("vertical resize " .. width)

  -- open Oil in the split
  vim.cmd("Oil")
end, { desc = "Open Oil in 20% left split" })
