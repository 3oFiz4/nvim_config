return {
  "snacks.nvim",
  opts = {
    dashboard = {
      width = 48,
      sections = {
        function()
          math.randomseed(os.time() + (vim.uv.hrtime() % 1000000))
          local is_intro = math.random(1, 2) == 10
          if is_intro then
            return {
              { pane = 1, text = { { "> hello world, i am ", hl = "footer" }, { "jordan", hl = "special" } } },
              {
                pane = 1,
                text = {
                  { "> i ", hl = "footer" },
                  { "dissassemble", hl = "special" },
                  { " stuff for fun", hl = "footer" },
                },
              },
              {
                pane = 1,
                text = {
                  { "> i ", hl = "footer" },
                  { "<3", hl = "special" },
                  { " math, cs stuff, psychology", hl = "footer" },
                },
              },
              {
                pane = 1,
                text = {
                  { "philosophy, and engineering ", hl = "footer" },
                },
              },
              {
                pane = 1,
                text = {
                  { "> im highly ", hl = "footer" },
                  { "curious, obssessed with my hobbies", hl = "special" },
                },
              },
              {
                pane = 1,
                text = {
                  { "> im not", hl = "footer" },
                  { " introverted ", hl = "special" },
                  { "anyways, i do love", hl = "footer" },
                },
              },
              {
                pane = 1,
                text = {
                  { "yapping about math, coding, life, philosophy.", hl = "special" },
                },
              },
              {
                pane = 1,
                text = {
                  { "> i suffer from major existential crisis", hl = "footer" },
                },
              },
              {
                pane = 1,
                text = {
                  { "because i accidentally read ", hl = "footer" },
                  { "hegel", hl = "special" },
                },
              },
              {
                pane = 1,
                text = {
                  { "and some ancient", hl = "special" },
                  { " buddhist sutra", hl = "special" },
                },
              },
              {
                pane = 1,
                text = {
                  { "> and i thinks thats.. all..", hl = "footer" },
                },
              },
              {
                pane = 1,
                padding = 1,
                text = {
                  { "> idk why i even put this on my nvim", hl = "footer" },
                },
              },
            }
          else
            local pin = require("config.pinterest").get_random_pin()
            if pin then
              return {
                {
                  section = "terminal",
                  cmd = string.format('chafa -f symbols --symbols ascii -c full --size 44x18 "%s"', pin),
                  pane = 1,
                  height = 18,
                  width = 44,
                  padding = 1,
                },
              }
            else
              return {
                {
                  pane = 1,
                  padding = 1,
                  text = { { "> hello world, i am ", hl = "footer" }, { "jordan", hl = "special" } },
                },
              }
            end
          end
        end,

        function()
          local stats = require("config.github_stats").get_stats()
          return {
            {
              pane = 1,
              text = {
                { "Github: ", hl = "footer" },
                { stats.username, hl = "special" },
                { " ", hl = "footer" },
                { tostring(stats.repos), hl = "special" },
                { " repo;", hl = "footer" },
              },
            },
            {
              pane = 1,
              padding = 1,
              text = {
                { tostring(stats.commits), hl = "special" },
                { " cmits; ", hl = "footer" },
                { tostring(stats.stars), hl = "special" },
                { " strs;", hl = "footer" },
              },
            },
          }
        end,

        {
          pane = 1,
          text = {
            { "Website: ", hl = "footer" },
            { "www.3ofiz4.xyz ", hl = "special" },
            { "(isOnline: true)" },
          },
        },

        {
          pane = 1,
          text = {},
        },

        { section = "startup", pane = 1 },

        { section = "keys", gap = 1, padding = 1, pane = 2 },
      },
      preset = {
        pick = function(cmd, opts)
          return LazyVim.pick(cmd, opts)()
        end,
        -- stylua: ignore
        ---@type snacks.dashboard.Item[]
        keys = {
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "g", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "r", desc = "Recent Files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "x", desc = "Lazy Extras", action = ":LazyExtras" },
          { icon = "󰒲 ", key = "l", desc = "Lazy", action = ":Lazy" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
        },
      },
    },
  },
}
