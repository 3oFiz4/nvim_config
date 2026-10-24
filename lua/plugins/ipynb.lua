return {
  "ajbucci/ipynb.nvim",
  lazy = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "neovim/nvim-lspconfig",
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    kernel = {
      python_path = "C:/Python314/python.exe",
    },
    images = {
      enabled = false,
    },
  },
  init = function()
    -- Format image placeholders cleanly without snacks.nvim prompt warning
    local output_file = vim.fn.stdpath("data") .. "/lazy/ipynb.nvim/lua/ipynb/output.lua"
    if vim.fn.filereadable(output_file) == 1 then
      local lines = vim.fn.readfile(output_file)
      local content = table.concat(lines, "\n")
      if content:find("%[Image output %- install snacks%.nvim to view%]") then
        content = content:gsub("%[Image output %- install snacks%.nvim to view%]", "[Diagram / Image Output (view in WezTerm split)]")
        vim.fn.writefile(vim.split(content, "\n"), output_file)
      end
    end
  end,
}
