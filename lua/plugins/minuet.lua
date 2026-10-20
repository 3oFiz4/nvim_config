local function get_endpoint()
  local base = vim.env.OPENAI_BASE_URL
  if not base or base == "" then
    return "https://api.openai.com/v1/chat/completions"
  end
  base = base:gsub("/+$", "")
  if not base:match("/chat/completions$") then
    base = base .. "/chat/completions"
  end
  return base
end

return {
  {
    "milanglacier/minuet-ai.nvim",
    event = { "BufReadPost", "BufNewFile" },
    opts = function()
      local endpoint_transform = function(data)
        local base = vim.env.OPENAI_BASE_URL
        if base and base ~= "" then
          base = base:gsub("/+$", "")
          if not base:match("/chat/completions$") then
            base = base .. "/chat/completions"
          end
          data.end_point = base
        end
        return data
      end

      local api_key_fn = function()
        return vim.env.OPENAI_BASE_KEY or vim.env.OPENAI_API_KEY or "OPENAI_BASE_KEY"
      end

      return {
        provider = "openai_compatible",
        request_timeout = 4,
        throttle = 1000,
        debounce = 400,
        notify = "warn",
        provider_options = {
          openai_compatible = {
            model = vim.env.OPENAI_MODEL or "gpt-4o",
            end_point = get_endpoint(),
            api_key = api_key_fn,
            name = "OpenAI",
            stream = true,
            optional = {
              max_tokens = 256,
              top_p = 0.9,
            },
            transform = {
              endpoint_transform,
            },
          },
          openai = {
            model = vim.env.OPENAI_MODEL or "gpt-4o",
            end_point = get_endpoint(),
            api_key = api_key_fn,
            stream = true,
            optional = {
              max_tokens = 256,
              top_p = 0.9,
            },
            transform = {
              endpoint_transform,
            },
          },
        },
        cmp = {
          enable_auto_complete = true,
        },
        blink = {
          enable_auto_complete = true,
        },
        virtualtext = {
          auto_trigger_ft = {},
          keymap = {
            accept = "<A-A>",
            accept_line = "<A-a>",
            prev = "<A-[>",
            next = "<A-]>",
            dismiss = "<A-e>",
          },
        },
      }
    end,
    config = function(_, opts)
      require("minuet").setup(opts)
    end,
  },
  {
    "saghen/blink.cmp",
    optional = true,
    opts = {
      keymap = {
        ["<A-y>"] = {
          function(cmp)
            cmp.show({ providers = { "minuet" } })
          end,
        },
      },
      sources = {
        default = { "minuet" },
        providers = {
          minuet = {
            name = "minuet",
            module = "minuet.blink",
            score_offset = 100,
            async = true,
            timeout_ms = 4000,
          },
        },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    optional = true,
    opts = function(_, opts)
      opts.sources = opts.sources or {}
      table.insert(opts.sources, 1, {
        name = "minuet",
        group_index = 1,
        priority = 100,
      })
      opts.performance = vim.tbl_deep_extend("force", opts.performance or {}, {
        fetching_timeout = 2000,
      })
      opts.mapping = vim.tbl_deep_extend("force", opts.mapping or {}, {
        ["<A-y>"] = require("minuet").make_cmp_map(),
      })
    end,
  },
}
