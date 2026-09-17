return {
  "max397574/better-escape.nvim",
  event = "InsertEnter",
  opts = {
    timeout = 200, -- Set custom timeout in ms (optional)
    default_mappings = true, -- Set to false if you want *only* your custom mappings
    mappings = {
      i = {
        -- Map `jk` to Escape in Insert mode
        j = {
          k = "<Esc>",
        },
        -- Map `kj` to Escape in Insert mode
        k = {
          j = "<Esc>",
        },
      },
    },
  },
}
