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
          colors.black = "#000000"
          colors.red = "#ff0000"
          colors.orange = "#ff6200"
          colors.white = "#f2f2f2"
          colors.hex00 = "#000000"
          colors.hex01 = "#101010"
          colors.hex02 = "#202020"
          colors.hex03 = "#303030"
          colors.hex04 = "#404040"
          colors.hex05 = "#505050"
          colors.hex06 = "#606060"
          colors.hex07 = "#707070"
          colors.hex08 = "#808080"
          colors.hex09 = "#909090"
          colors.hex10 = "#A0A0A0"
          colors.color0 = "#6e1a1a"
          colors.color1 = "#ffb0b0"
          colors.color2 = "#ff5a5a"
          colors.color3 = "#ff0000"
          colors.color4 = "#a66d6d"
          colors.color5 = "#664e4d"
          colors.color6 = "#cf433e"
          colors.color7 = "#e28989"
          colors.color8 = "#000000"
          colors.color9 = "#eed0d0"
          colors.color10 = "#090707"
          colors.color11 = "#5b2121"
          colors.color12 = "#423434"
          colors.color13 = "#141010"
          colors.color14 = "#7c6060"
          colors.color15 = "#faa2a2"
          colors.bg_0 = "#000000"
          colors.bg_1 = "#080808"
          colors.bg_2 = "#121212"
          colors.bg_3 = "#1a1a1a"
          colors.bg_4 = "#262626"
          colors.fg_0 = "#666666"
          colors.fg_1 = "#8a8a8a"
          colors.fg_2 = "#bcbcbc"
          colors.fg_3 = "#d0d0d0"
          colors.fg_4 = "#eeeeee"
          colors.red_dark = "#870000"
          colors.red_mid = "#af0000"
          colors.red_soft = "#d70000"
          colors.red_deep = "#9e2929"
          colors.red_pale = "#ffd6d6"
          colors.orange_soft = "#ff6200"
          colors.orange_dim = "#cc4e00"
          colors.bg = "#000000"
          colors.fg = "#bcbcbc"
          colors.cursorline = "#121212"
          colors.selection = "#262626"
          colors.linenr = "#585858"
          colors.comment = "#585858"
          colors.gutter_fg = "#585858"
          colors.nontext = "#585858"
          colors.keyword = "#eeeeee"
          colors.Function = "#eeeeee"
          colors.string = "#8a8a8a"
          colors.constant = "#d0d0d0"
          colors.type = "#eeeeee"
          colors.number = "#ff0000"
          colors.boolean = "#ff0000"
          colors.operator = "#d0d0d0"
          colors.variable = "#bcbcbc"
          colors.cursor = "#ff6200"
          colors.visual = "#262626"
          colors.search = "#303030"
          colors.statusline = "#121212"
          colors.menu_bg = "#1a1a1a"
          colors.menu_sel = "#303030"
          colors.fold = "#1a1a1a"
          colors.split = "#262626"
          colors.diag_error = "#ff0000"
          colors.diag_warn = "#ff6200"
          colors.diag_info = "#d0d0d0"
          colors.diag_hint = "#8a8a8a"
          colors.error_bg = "#870000"
          colors.error_fg = "#eeeeee"
          colors.warning_bg = "#af0000"
          colors.warning_fg = "#eeeeee"
          colors.matchparen = "#585858"
          colors.pmenu_thumb = "#080808"
          colors.diff_add = "#ff6200"
          colors.diff_change = "#d70000"
          colors.diff_delete = "#585858"
          colors.spell_bad = "#870000"
          colors.spell_cap = "#af0000"
          colors.spell_rare = "#ff0000"
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
          colors.fg_gutter = colors.red
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
          hl.Normal = { fg = c.hex09, bg = c.bg }
          hl.Menu = { fg = c.hex09, bg = c.bg }
          hl.NormalFloat = { fg = c.hex09, bg = c.hex00 }
          hl.FloatBorder = { fg = c.red_dark, bg = c.hex00 }
          hl.NormalNC = { fg = c.hex08, bg = c.bg }
          -- Popups
          hl.Pmenu = { bg = c.hex01, fg = c.hex09 }
          hl.PmenuSel = { bg = c.hex03, fg = c.white }
          hl.PmenuSbar = { bg = c.hex02 }
          hl.PmenuThumb = { bg = c.hex04 }

          -- Sidebar
          hl.NvimTreeNormal = { bg = c.hex00, fg = c.red }
          hl.NvimTreeNormalNC = { bg = c.hex00, fg = c.hex07 }
          hl.NvimTreeWinSeparator = { fg = c.hex01, bg = c.hex01 }

          -- Cursor
          hl.CursorLine = { bg = c.cursorline }
          hl.CursorLineNr = {
            fg = c.red,
            bold = true,
          }
          hl.CursorLineNrAbove = {
            fg = c.red,
            bold = true,
          }
          hl.CursorLineNrBelow = {
            fg = c.red,
            bold = true,
          }

          hl.LineNr = {
            fg = c.red,
          }

          -- Visual/Search
          hl.Visual = {
            bg = "#2a0d0d",
          }

          hl.CursorWord = {
            fg = c.white,
            bg = c.red_mid,
            bold = true,
          }

          hl.CursorWord0 = {
            fg = c.white,
            bg = c.red_mid,
            bold = true,
          }

          hl.CursorWord1 = {
            fg = c.white,
            bg = c.red_mid,
            bold = true,
          }

          hl.LspReferenceText = {
            fg = c.white,
            bg = c.red_dark,
          }

          hl.LspReferenceRead = {
            fg = c.white,
            bg = c.red_dark,
          }

          hl.LspReferenceWrite = {
            fg = c.white,
            bg = c.red_mid,
            bold = true,
          }

          hl.Search = {
            bg = c.hex03,
            fg = c.white,
          }

          hl.IncSearch = {
            bg = c.red_mid,
            fg = c.white,
          }

          -- =========================================================
          -- Comments
          -- =========================================================

          hl.Comment = {
            fg = c.hex04,
            italic = true,
          }

          hl["@comment"] = {
            fg = c.hex04,
            italic = true,
          }

          hl["@comment.documentation"] = {
            fg = c.hex05,
          }

          -- =========================================================
          -- Syntax
          -- =========================================================

          hl.String = {
            fg = c.hex08,
          }

          hl.Number = {
            fg = c.white,
          }

          hl.Boolean = {
            fg = c.red_soft,
          }

          hl.Constant = {
            fg = c.hex08,
          }

          -- Class / Type
          -- Highest semantic importance.
          hl.Type = {
            fg = c.red_light,
            bold = true,
          }

          -- Structural syntax
          hl.Keyword = {
            fg = c.white,
          }

          -- Functions
          hl.Function = {
            fg = c.red_soft,
          }

          -- Variables
          hl.Variable = { fg = c.red_deep }

          hl.Identifier = {
            fg = c.red_dark,
          }

          hl.Operator = {
            fg = c.hex07,
          }

          -- =========================================================
          -- Treesitter
          -- =========================================================

          hl["@string"] = {
            fg = c.hex08,
          }

          hl["@string.documentation.c"] = {
            fg = c.red_mid,
          }

          hl["@number"] = {
            fg = c.white,
          }

          hl["@boolean"] = {
            fg = c.red_soft,
          }

          hl["@constant"] = {
            fg = c.hex08,
          }

          hl["@type"] = {
            fg = c.red_light,
            bold = true,
          }

          hl["@keyword"] = {
            fg = c.white,
          }

          hl["@function"] = {
            fg = c.red_soft,
          }

          hl["@variable"] = { fg = c.red_deep }

          hl["@parameter"] = {
            fg = c.red_mid,
          }

          hl["@field"] = { fg = c.red_deep }

          hl["@punctuation.bracket"] = {
            fg = c.hex07,
          }

          hl["@punctuation.delimiter"] = {
            fg = c.hex06,
          }

          hl["@tag"] = {
            fg = c.red_soft,
          }

          hl["@tag.delimiter"] = {
            fg = c.hex07,
          }

          -- =========================================================
          -- LSP semantic tokens
          -- =========================================================

          hl["@lsp.type.parameter"] = {
            fg = c.red_mid,
          }

          hl["@lsp.type.member"] = {
            fg = c.red_dark,
          }

          hl["@lsp.type.function"] = {
            fg = c.red_soft,
          }

          hl["@lsp.type.method"] = {
            fg = c.red_soft,
          }

          hl["@lsp.type.boolean"] = {
            fg = c.red_soft,
          }

          hl["@lsp.type.number"] = {
            fg = c.white,
          }

          hl["@lsp.type.operator"] = {
            fg = c.hex06,
          }

          hl["@lsp.type.class"] = {
            fg = c.red_light,
            bold = true,
          }

          hl["@lsp.type.struct"] = {
            fg = c.red_light,
            bold = true,
          }

          hl["@lsp.type.interface"] = {
            fg = c.red_light,
            bold = true,
          }

          hl["@lsp.type.enum"] = {
            fg = c.red_light,
            bold = true,
          }

          hl["@lsp.type.variable"] = {
            fg = c.red_deeo,
          }

          hl["@lsp.type.property"] = {
            fg = c.red_deeo,
          }

          hl["@lsp.type.macro"] = {
            fg = c.red_mid,
          }

          -- =========================================================
          -- Diagnostics
          -- =========================================================

          hl.DiagnosticError = {
            fg = c.white,
          }

          hl.DiagnosticWarn = {
            fg = c.red_soft,
          }

          hl.DiagnosticInfo = {
            fg = c.hex08,
          }

          hl.DiagnosticHint = {
            fg = c.hex06,
          }

          -- =========================================================
          -- Git
          -- =========================================================

          hl.DiffAdd = {
            bg = "#101010",
          }

          hl.DiffDelete = {
            bg = "#1a0000",
          }

          hl.DiffChange = {
            bg = "#202020",
          }

          hl.DiffText = {
            bg = "#303030",
          }

          hl.GitSignsAdd = {
            fg = c.hex08,
          }

          hl.GitSignsChange = {
            fg = c.red_mid,
          }

          hl.GitSignsDelete = {
            fg = c.red_soft,
          }

          -- =========================================================
          -- Status line
          -- =========================================================

          hl.StatusLine = {
            bg = c.bg_1,
            fg = c.red,
            bold = true,
          }

          hl.StatusLineNC = {
            bg = c.hex01,
            fg = c.hex06,
          }

          -- =========================================================
          -- Extra
          -- =========================================================

          hl.Error = {
            bg = c.hex03,
            fg = c.white,
          }

          hl.WildMenu = {
            bg = c.hex01,
            fg = c.white,
          }

          hl.ColorColumn = {
            bg = c.hex01,
          }

          hl.SignColumn = {
            bg = c.black,
            fg = c.hex05,
          }

          hl.TabLine = {
            bg = c.hex00,
            fg = c.hex06,
          }

          hl.TabLineFill = {
            bg = c.hex00,
            fg = c.hex05,
          }

          hl.TSPunctDelimiter = {
            fg = c.hex06,
          }

          hl.Special = {
            fg = c.hex09,
          }

          hl.PreProc = {
            fg = c.red_light,
          }

          hl.Other = {
            fg = c.hex08,
          }

          -- if / else / for / while / return
          hl.Conditional = {
            fg = c.white,
            bold = true,
          }

          hl.Repeat = {
            fg = c.white,
          }

          hl.Keyword = {
            fg = c.white,
            bold = true,
          }

          hl["@keyword.conditional"] = {
            fg = c.white,
            bold = true,
          }

          hl["@keyword.repeat"] = {
            fg = c.white,
          }

          hl["@keyword.return"] = {
            fg = c.white,
          }

          hl["@keyword.function"] = {
            fg = c.white,
          }

          -- =========================================================
          -- Functions
          -- =========================================================

          hl.Function = {
            fg = c.red_soft,
            bold = true,
          }

          hl["@function"] = { fg = c.red_soft, bold = true }

          hl["@function.call"] = {
            fg = c.red_soft,
          }

          hl["@function.method"] = {
            fg = c.red_soft,
          }

          hl["@function.method.call"] = {
            fg = c.red_soft,
          }

          hl["@constructor"] = {
            fg = c.red_light,
            bold = true,
          }

          -- =========================================================
          -- Classes / Objects / Data Types
          -- =========================================================

          hl.Type = { fg = c.fg_4, bold = true }
          hl["@type"] = { fg = c.red_pale, bold = true }

          hl["@type.builtin"] = {
            fg = c.red_light,
          }

          hl["@type.definition"] = {
            fg = c.red_light,
            bold = true,
          }

          hl["@lsp.type.class"] = {
            fg = c.red_light,
            bold = true,
          }

          hl["@lsp.type.struct"] = {
            fg = c.red_light,
            bold = true,
          }

          hl["@lsp.type.interface"] = {
            fg = c.red_light,
            bold = true,
          }

          hl["@lsp.type.enum"] = {
            fg = c.red_light,
            bold = true,
          }

          -- Object instance / variable object
          hl["@variable.member"] = {
            fg = c.red_mid,
          }

          -- =========================================================
          -- Attributes / Properties
          -- =========================================================

          hl["@attribute"] = {
            fg = c.red_mid,
          }

          hl["@property"] = {
            fg = c.red_dark,
          }

          hl["@lsp.type.property"] = {
            fg = c.red_dark,
          }

          -- =========================================================
          -- Operators
          -- =========================================================

          -- = + - * / == != => etc
          hl.Operator = {
            fg = c.hex07,
          }

          hl["@operator"] = {
            fg = c.hex07,
          }

          hl["@lsp.type.operator"] = {
            fg = c.hex06,
          }

          -- =========================================================
          -- Data types
          -- =========================================================

          hl["@type.builtin.c"] = {
            fg = c.red_light,
            bold = true,
          }

          hl["@keyword.type"] = {
            fg = c.red_light,
          }

          hl["@keyword.type.c"] = {
            fg = c.red_light,
          }

          hl.StorageClass = {
            fg = c.red_light,
          }

          -- =========================================================
          -- Documentation comments
          -- =========================================================

          hl.SpecialComment = {
            fg = c.hex05,
            italic = true,
          }

          hl["@comment.documentation"] = {
            fg = c.hex05,
            italic = true,
          }

          hl["@string.documentation"] = {
            fg = c.hex05,
          }

          hl["@string.documentation.c"] = {
            fg = c.hex05,
          }

          -- =========================================================
          -- Statusline
          -- Black-red hierarchy.
          -- Active = stronger red.
          -- Inactive = muted grayscale.
          -- =========================================================

          hl.StatusLine = {
            bg = "#140000",
            fg = c.red_light,
            bold = true,
          }

          hl.StatusLineNC = {
            bg = c.hex01,
            fg = c.hex06,
          }

          hl.WinBar = {
            bg = c.black,
            fg = c.red_mid,
          }

          hl.WinBarNC = {
            bg = c.black,
            fg = c.hex05,
          }

          -- =========================================================
          -- Global popup / floating UI
          -- This affects many plugins including Snacks.nvim,
          -- Lazy.nvim, Mason, Telescope, Noice, etc.
          -- =========================================================

          hl.NormalFloat = {
            bg = c.hex00,
            fg = c.hex09,
          }

          hl.FloatBorder = {
            bg = c.hex00,
            fg = c.red_dark,
          }

          hl.FloatTitle = {
            bg = c.hex00,
            fg = c.red_soft,
            bold = true,
          }

          hl.Pmenu = {
            bg = c.hex01,
            fg = c.hex08,
          }

          hl.PmenuSel = {
            bg = c.hex03,
            fg = c.white,
            bold = true,
          }

          hl.PmenuThumb = {
            bg = c.hex04,
          }

          hl.PmenuSbar = {
            bg = c.hex02,
          }

          -- =========================================================
          -- Snacks.nvim common groups
          -- (only applied if plugin defines them)
          -- =========================================================

          hl.SnacksNormal = {
            bg = c.hex00,
            fg = c.hex09,
          }

          hl.SnacksBorder = {
            bg = c.hex00,
            fg = c.red_dark,
          }

          hl.SnacksTitle = {
            fg = c.red_soft,
            bold = true,
          }

          hl.SnacksInputBorder = {
            fg = c.red_mid,
          }

          hl.SnacksInputTitle = {
            fg = c.red_soft,
            bold = true,
          }

          hl.SnacksPicker = {
            bg = c.hex00,
            fg = c.hex09,
          }

          hl.SnacksPickerBorder = {
            fg = c.red_dark,
          }

          hl.SnacksPickerTitle = {
            fg = c.red_light,
            bold = true,
          }

          hl.SnacksPickerCursorLine = {
            bg = c.hex02,
          }

          hl.SnacksPickerMatch = {
            fg = c.red_soft,
            bold = true,
          }

          -- =========================================================
          -- Telescope compatibility
          -- =========================================================

          hl.TelescopeNormal = {
            bg = c.hex00,
            fg = c.hex09,
          }

          hl.TelescopeBorder = {
            bg = c.hex00,
            fg = c.red_dark,
          }

          hl.TelescopeTitle = {
            fg = c.red_light,
            bold = true,
          }

          hl.TelescopeSelection = {
            bg = c.hex02,
          }

          hl.TelescopeMatching = {
            fg = c.red_soft,
            bold = true,
          }

          -- =========================================================
          -- Noice / notify compatibility
          -- =========================================================

          hl.NoiceCmdlinePopupBorder = {
            fg = c.red_dark,
          }

          hl.NoiceCmdlineIcon = {
            fg = c.red_soft,
          }

          hl.NotifyINFOBorder = {
            fg = c.hex06,
          }

          hl.NotifyWARNBorder = {
            fg = c.red_mid,
          }

          hl.NotifyERRORBorder = {
            fg = c.red_soft,
          }

          hl.NotifyINFOTitle = {
            fg = c.hex08,
          }

          hl.NotifyWARNTitle = {
            fg = c.red_mid,
          }

          hl.NotifyERRORTitle = {
            fg = c.red_soft,
          }

          -- =========================================================
          -- Objects / members
          -- =========================================================

          -- object.property
          hl["@variable.member"] = {
            fg = c.red_mid,
          }

          -- self.user / this.value
          hl["@property"] = {
            fg = c.red_dark,
          }

          hl["@lsp.type.property"] = {
            fg = c.red_dark,
          }

          -- =========================================================
          -- Function parameters / arguments
          -- =========================================================

          -- function test(user, amount)
          hl["@parameter"] = {
            fg = c.red_mid,
            italic = true,
          }

          hl["@lsp.type.parameter"] = {
            fg = c.red_mid,
            italic = true,
          }

          -- passed arguments
          hl["@argument"] = {
            fg = c.red_mid,
          }

          -- =========================================================
          -- Exceptions
          -- =========================================================

          -- try / except / finally / raise
          hl.Exception = {
            fg = c.white,
            bold = true,
          }

          hl["@keyword.exception"] = {
            fg = c.white,
            bold = true,
          }

          hl["@exception"] = {
            fg = c.white,
            bold = true,
          }

          -- raise keyword
          hl["@keyword.exception.python"] = {
            fg = c.white,
            bold = true,
          }

          -- =========================================================
          -- Escape characters
          -- =========================================================

          -- \n \t \r \" \\ etc
          hl.SpecialChar = {
            fg = c.red_soft,
            bold = true,
          }

          hl["@string.escape"] = {
            fg = c.red_soft,
            bold = true,
          }

          hl["@character.special"] = {
            fg = c.red_soft,
            bold = true,
          }

          -- any character after "\"
          hl["@string.special"] = {
            fg = c.red_soft,
          }

          -- =========================================================
          -- f-string interpolation brackets
          -- Example:
          -- f"{name}"
          --     ^    ^
          -- =========================================================

          hl["@punctuation.special"] = {
            fg = c.red_mid,
          }

          hl["@punctuation.bracket"] = {
            fg = c.hex07,
          }

          -- specifically useful for interpolated regions
          hl["@markup.raw.delimiter"] = {
            fg = c.red_mid,
          }

          hl["@conceal"] = {
            fg = c.red_mid,
          }

          -- =========================================================
          -- PARAMETERS / ARGUMENTS
          -- Treesitter + LSP variants
          -- =========================================================

          -- Generic Treesitter
          hl["@parameter"] = {
            fg = c.red_light,
            italic = true,
          }

          hl["@parameter.reference"] = {
            fg = c.red_mid,
          }

          -- Neovim 0.10+ captures
          hl["@variable.parameter"] = {
            fg = c.red_light,
            italic = true,
          }

          hl["@variable.parameter.builtin"] = {
            fg = c.red_mid,
          }

          -- LSP semantic tokens
          hl["@lsp.type.parameter"] = {
            fg = c.red_light,
            italic = true,
          }

          -- Function arguments
          hl.Function = { fg = c.red_soft, bold = true }

          -- Python-specific
          hl["@variable.parameter.python"] = {
            fg = c.red_light,
            italic = true,
          }

          -- Lua
          hl["@variable.parameter.lua"] = {
            fg = c.red_light,
            italic = true,
          }

          -- TS/JS
          hl["@variable.parameter.javascript"] = {
            fg = c.red_light,
            italic = true,
          }

          hl["@variable.parameter.typescript"] = {
            fg = c.red_light,
            italic = true,
          }

          -- =========================================================
          -- OBJECTS / MEMBERS
          -- =========================================================

          -- object.property
          hl["@variable.member"] = {
            fg = c.red_mid,
          }

          -- self.value / this.value
          hl["@property"] = {
            fg = c.red_mid,
          }

          hl["@property.python"] = {
            fg = c.red_mid,
          }

          hl["@property.lua"] = {
            fg = c.red_mid,
          }

          hl["@lsp.type.property"] = {
            fg = c.red_mid,
          }

          hl["@field"] = {
            fg = c.red_mid,
          }

          hl["@field.key"] = {
            fg = c.red_mid,
          }

          -- =========================================================
          -- INDENT GUIDES
          -- indent-blankline / snacks indent scope
          -- =========================================================

          -- normal indent guides
          hl.IblIndent = {
            fg = c.bg_3,
            nocombine = true,
          }

          hl.IndentBlanklineChar = {
            fg = c.bg_3,
            nocombine = true,
          }

          hl.SnacksIndent = {
            fg = c.bg_3,
            nocombine = true,
          }

          -- active scope indent
          hl.IblScope = {
            fg = c.red_soft,
            bold = true,
            nocombine = true,
          }

          hl.IndentBlanklineContextChar = {
            fg = c.red_soft,
            bold = true,
            nocombine = true,
          }

          hl.SnacksIndentScope = {
            fg = c.red_soft,
            bold = true,
            nocombine = true,
          }

          vim.api.nvim_set_hl(0, "LineNrAbove", { fg = color_0, bold = true })
          vim.api.nvim_set_hl(0, "LineNr", { fg = color_3, bold = true })
          vim.api.nvim_set_hl(0, "LineNrBelow", { fg = color_0, bold = true })
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
