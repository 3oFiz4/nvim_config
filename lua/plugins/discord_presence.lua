return {
  "vyfor/cord.nvim",
  opts = {
    buttons = {
      {
        label = "View Repository",
        url = function(opts)
          return opts.repo_url -- only show the button if a repo URL is found
        end,
      },

      {
        label = "GitHub",
        url = "https://github.com/3oFiz4",
      },
    },
    display = {
      theme = "void", -- 'default', 'atom', 'catppuccin', 'minecraft', 'void', 'classic'
    },
    text = {
      editing = function(opts)
        return "Rectifying " .. opts.filename
      end,
      workspace = function(opts)
        return "Repository: " .. opts.workspace
      end,
      terminal = function(opts)
        return "In a terminal (" .. opts.name .. ")"
      end,
    },
  },
  lazy = true,
}
