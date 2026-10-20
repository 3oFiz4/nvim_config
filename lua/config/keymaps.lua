-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
local wk = require("which-key")

-- Oil Keymap
map("n", "-", function()
  vim.cmd("Otree")
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

local function toggle_minuet_autocomplete()
  local ok, minuet = pcall(require, "minuet")
  if not ok then
    vim.notify("Minuet AI is not loaded yet.", vim.log.levels.WARN)
    return
  end

  local status = {}

  if minuet.config.blink then
    minuet.config.blink.enable_auto_complete = not minuet.config.blink.enable_auto_complete
    local state = minuet.config.blink.enable_auto_complete and "enabled" or "disabled"
    table.insert(status, "blink: " .. state)
  end

  if minuet.config.cmp then
    minuet.config.cmp.enable_auto_complete = not minuet.config.cmp.enable_auto_complete
    local state = minuet.config.cmp.enable_auto_complete and "enabled" or "disabled"
    table.insert(status, "cmp: " .. state)
  end

  pcall(function()
    require("minuet.virtualtext").action.toggle_auto_trigger()
  end)

  if #status > 0 then
    vim.notify("Minuet auto-complete " .. table.concat(status, ", "), vim.log.levels.INFO, { title = "Minuet AI" })
  end
end

map("n", "<leader>as", toggle_minuet_autocomplete, {
  desc = "Toggle Minuet Auto-complete",
})
