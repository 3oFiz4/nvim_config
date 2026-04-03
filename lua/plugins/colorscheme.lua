return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = function()
      return {
        style = "night",

        styles = {
          comments = { italic = true },
          functions = {}, -- explicitly no italics
          keywords = {},
          variables = {},
        },

        -- Base palette override (Black & Diamond Soft)
        on_colors = function(colors)
          -- Base Backgrounds
          colors.bg = "#000000" -- editor.background
          colors.bg_dark = "#000000" -- sideBar.background / panel.background
          colors.bg_float = "#161b22" -- editorWidget.background
          colors.bg_popup = "#161b22" -- list.hoverBackground
          colors.bg_sidebar = "#0d1117" -- sideBar.background
          colors.bg_statusline = "#0d1117" -- statusBar.background

          -- Base Foregrounds
          colors.fg = "#c9d1d9" -- editor.foreground
          colors.fg_dark = "#8b949e" -- tab.inactiveForeground
          colors.fg_gutter = "#484f58" -- editorLineNumber.foreground (converted from #f0f6fc4d)
          colors.fg_border = "#30363d" -- tab.unfocusedActiveBorderTop (Used for general borders)

          -- Accents (Mapped from UI variables)
          colors.blue = "#58a6ff" -- textLink.foreground / notificationsInfoIcon.foreground
          colors.cyan = "#39c5cf" -- Inferred standard (matches generic dark themes for this palette)
          colors.green = "#28a745" -- editorGutter.addedBackground
          colors.teal = "#17e5e6" -- editor.selectionHighlightBorder
          colors.orange = "#f9826c" -- activityBar.activeBorder
          colors.yellow = "#ffd33d" -- editor.findMatchHighlightBackground (base color)
          colors.purple = "#bc8cff" -- Standard GitHub Dark Keyword
          colors.magenta = "#d46ec0" -- Previous palette
          colors.red = "#f97583" -- errorForeground

          -- Git / Gutter
          colors.git = {
            add = "#28a745", -- editorGutter.addedBackground
            change = "#e2b86b", -- editorGutter.modifiedBackground (approx)
            delete = "#ea4a5a", -- editorGutter.deletedBackground
          }

          -- Diagnostics
          colors.error = "#f97583" -- errorForeground
          colors.warning = "#ffab70" -- notificationsWarningIcon.foreground
          colors.info = "#58a6ff" -- notificationsInfoIcon.foreground
          colors.hint = "#c9d1d9" -- foreground
        end,

        -- Highlight fine-tuning (Treesitter + LSP-safe)
        on_highlights = function(hl, c)
          ----------------------------------------------------------------
          -- Core
          ----------------------------------------------------------------
          hl.Normal = { fg = c.fg, bg = c.bg }
          hl.NormalFloat = { fg = c.fg, bg = c.bg_float }
          hl.FloatBorder = { fg = c.blue, bg = c.bg_float }
          hl.NormalNC = { fg = c.fg, bg = c.bg } -- Non-current windows-
          -- Popups (Pmenu)
          hl.Pmenu = { bg = c.bg_float, fg = c.fg }
          hl.PmenuSel = { bg = "#044289", fg = "#c9d1d9" } -- list.focusBackground
          hl.PmenuSbar = { bg = "#6a737d" } -- scrollbarSlider.background
          hl.PmenuThumb = { bg = "#6a737d" } -- scrollbarSlider.activeBackground

          -- Sidebar / NvimTree
          hl.NvimTreeNormal = { bg = c.bg_sidebar, fg = c.fg }
          hl.NvimTreeNormalNC = { bg = c.bg_sidebar, fg = c.fg }
          hl.NvimTreeWinSeparator = { fg = c.bg_sidebar, bg = c.bg_sidebar }

          -- Cursor & Selection
          hl.CursorLine = { bg = c.bg_highlight }
          hl.CursorLineNr = { fg = c.fg, bold = true } -- editorLineNumber.activeForeground
          hl.LineNr = { fg = c.fg_gutter }

          -- Visual Mode & Search
          hl.Visual = { bg = c.bg_visual }
          hl.Search = { bg = c.bg_search }
          hl.IncSearch = { bg = "#ffd33d" } -- editor.findMatchHighlightBackground

          ----------------------------------------------------------------
          -- Comments
          ----------------------------------------------------------------
          hl.Comment = { fg = c.fg_dark, italic = true }
          hl["@comment"] = { fg = c.fg_dark, italic = true }
          hl["@comment.documentation"] = { fg = c.fg_dark }

          ----------------------------------------------------------------
          -- Syntax
          ----------------------------------------------------------------
          hl.String = { fg = "#a5d6ff" } -- Standard GitHub Dark String
          hl.Number = { fg = c.blue }
          hl.Boolean = { fg = c.blue }
          hl.Constant = { fg = c.blue }
          hl.Type = { fg = c.red } -- Often used for storage types in this scheme
          hl.Keyword = { fg = c.red }
          hl.Function = { fg = "#d2a8ff" } -- Standard GitHub Dark Function (Purple)
          hl.Variable = { fg = c.fg }
          hl.Identifier = { fg = c.fg }
          hl.Operator = { fg = c.fg }

          ----------------------------------------------------------------
          -- Treesitter
          ----------------------------------------------------------------
          hl["@string"] = { fg = "#a5d6ff" }
          hl["@number"] = { fg = c.blue }
          hl["@boolean"] = { fg = c.blue }
          hl["@constant"] = { fg = c.blue }
          hl["@type"] = { fg = c.red }
          hl["@keyword"] = { fg = c.red }
          hl["@function"] = { fg = "#d2a8ff" }
          hl["@variable"] = { fg = c.fg }
          hl["@parameter"] = { fg = c.fg }
          hl["@property"] = { fg = c.fg }

          hl["@punctuation.bracket"] = { fg = c.fg }
          hl["@punctuation.delimiter"] = { fg = c.fg }
          hl["@tag"] = { fg = "#7ee787" } -- HTML Tags (Green)
          hl["@tag.delimiter"] = { fg = c.fg }

          ----------------------------------------------------------------
          -- LSP semantic tokens (Tokyonight supports these natively)
          ----------------------------------------------------------------
          hl["@lsp.type.parameter"] = { fg = c.fg }
          hl["@lsp.type.member"] = { fg = c.cyan }

          hl["@lsp.type.function"] = { fg = c.blue }
          hl["@lsp.type.method"] = { fg = c.blue }

          hl["@lsp.type.boolean"] = { fg = c.orange }
          hl["@lsp.type.number"] = { fg = c.orange }
          hl["@lsp.type.operator"] = { fg = c.fg_dark }

          hl["@lsp.type.class"] = { fg = c.red }
          hl["@lsp.type.struct"] = { fg = c.red }
          hl["@lsp.type.interface"] = { fg = c.red }
          hl["@lsp.type.enum"] = { fg = c.red }
          hl["@lsp.type.variable"] = { fg = c.fg }
          hl["@lsp.type.property"] = { fg = c.fg }
          hl["@lsp.type.function"] = { fg = "#d2a8ff" }
          hl["@lsp.type.method"] = { fg = "#d2a8ff" }
          hl["@lsp.type.macro"] = { fg = c.blue }

          ----------------------------------------------------------------
          -- Diagnostics & Git
          ----------------------------------------------------------------
          hl.DiagnosticError = { fg = c.error }
          hl.DiagnosticWarn = { fg = c.warning }
          hl.DiagnosticInfo = { fg = c.info }
          hl.DiagnosticHint = { fg = c.hint }

          hl.DiffAdd = { bg = "#28a745" } -- diffEditor.insertedTextBackground
          hl.DiffDelete = { bg = "#d73a49" } -- diffEditor.removedTextBackground
          hl.DiffChange = { bg = "#2188ff" }
          hl.DiffText = { bg = "#2188ff" }

          hl.GitSignsAdd = { fg = c.git.add }
          hl.GitSignsChange = { fg = c.blue }
          hl.GitSignsDelete = { fg = c.git.delete }
        end,
      }
    end,
  },

  -- Configure LazyVim to load gruvbox
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
