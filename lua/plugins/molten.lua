return {
  "benlubas/molten-nvim",
  version = "^1.0.0",
  build = ":UpdateRemotePlugins",
  dependencies = { "willothy/wezterm.nvim" },
  cmd = {
    "ColabConnect",
    "MoltenInit",
    "MoltenInfo",
    "MoltenEvaluateLine",
    "MoltenEvaluateOperator",
    "MoltenEvaluateVisual",
    "MoltenReevaluateCell",
    "MoltenShowOutput",
    "MoltenHideOutput",
    "MoltenDelete",
    "MoltenInterrupt",
  },
  init = function()
    vim.g.molten_auto_open_output = false
    vim.g.molten_image_provider = "wezterm"
    vim.g.molten_output_show_more = true
    vim.g.molten_output_virt_lines = true
    vim.g.molten_split_direction = "right"
    vim.g.molten_split_size = 40
    vim.g.molten_virt_text_output = true
    vim.g.molten_use_border_highlights = true
    vim.g.molten_virt_lines_off_by_1 = true
    vim.g.molten_auto_image_popup = false
    vim.g.molten_output_win_max_height = 20

    vim.api.nvim_create_user_command("ColabConnect", function(opts)
      local target = opts.args ~= "" and opts.args or "http://localhost:8888"
      require("lazy").load({ plugins = { "molten-nvim" } })
      vim.cmd("MoltenInit " .. target)
    end, {
      nargs = "?",
      desc = "Connect Molten to Colab remote Jupyter kernel",
    })
  end,
  keys = {
    { "<leader>mi", ":MoltenInit<cr>", desc = "Molten Init Kernel" },
    { "<leader>mc", ":ColabConnect ", desc = "Molten Connect Colab (URL/Token)" },
    { "<leader>me", ":MoltenEvaluateOperator<cr>", desc = "Molten Evaluate Operator" },
    { "<leader>ml", ":MoltenEvaluateLine<cr>", desc = "Molten Evaluate Line" },
    { "<leader>mr", ":MoltenReevaluateCell<cr>", desc = "Molten Re-evaluate Cell" },
    { "<leader>mo", ":MoltenShowOutput<cr>", desc = "Molten Show Output" },
    { "<leader>mh", ":MoltenHideOutput<cr>", desc = "Molten Hide Output" },
    { "<leader>md", ":MoltenDelete<cr>", desc = "Molten Delete Cell Output" },
    { "<leader>mI", ":MoltenInterrupt<cr>", desc = "Molten Interrupt Kernel" },
    { "<leader>mv", ":<C-u>MoltenEvaluateVisual<cr>gv", mode = "v", desc = "Molten Evaluate Visual" },
  },
}
