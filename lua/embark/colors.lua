local options = require("embark.config").options

---@class embark.colors
local M = {}

-- == COLOR PALETTE ==
--
-- TODO: Cterm values here are OG from Challenger Deep

---@class embark.colors.palette
M.palette = {
  -- Space
  space0 = "#100E23",
  space1 = "#1e1c31",
  space2 = "#2F2A47",
  space3 = "#3E3859",
  space4 = "#585273",
  -- Astral
  astral0 = "#8A889D",
  astral1 = "#cbe3e7",
  -- Nebula
  red = "#F48FB1",
  dark_red = "#F02E6E",
  green = "#A1EFD3",
  dark_green = "#7fe9c3",
  yellow = "#ffe6b3",
  dark_yellow = "#F2B482",
  blue = "#91ddff",
  dark_blue = "#78a8ff",
  purple = "#d4bfff",
  dark_purple = "#7676ff",
  cyan = "#ABF8F7",
  dark_cyan = "#63f2f1",
  diff_del = "#5E3859",
  diff_add = "#2D5059",
  diff_changed = "#38325A",

  bg = "#1e1c31",
  bg_dark = "#100E23",
  bg_bright = "#585273",
  norm = "#cbe3e7",
  fg = "#8A889D",
  norm_subtle = "#8A889D",
  visual = "#3E3859",
  head_a = "#78a8ff",
  head_b = "#91ddff",
  head_c = "#63f2f1",
}

---@type table<string, vim.api.keyset.highlight>
M.colors = {
  ALEErrorSign = { fg = M.palette.red, bg = M.palette.bg },
  ALEVirtualTextWarning = { fg = M.palette.dark_yellow },
  ALEWarningSign = { fg = M.palette.dark_yellow, bg = M.palette.bg },
  Boolean = { fg = M.palette.dark_yellow },
  CmpItemAbbrMatch = { link = "Pmenu" },
  CmpItemKindDefault = { fg = M.palette.purple },
  CmpItemKindFunction = { link = "Function" },
  CmpItemKindInterface = { link = "CmpItemKindDefault" },
  CmpItemKindMethod = { link = "CmpItemKindFunction" },
  CmpItemKindModule = { link = "PreProc" },
  CmpItemKindReference = { link = "CmpItemKindDefault" },
  CmpItemKindSnippet = { link = "Constant" },
  CmpItemKindStruct = { link = "CmpItemKindModule" },
  CmpItemKindText = { link = "Comment" },
  CmpItemMenu = { link = "Comment" },
  ColorColumn = { bg = M.palette.space2 },
  Comment = { fg = M.palette.astral0, italic = options.italic },
  Conceal = { fg = M.palette.astral1 },
  Constant = { fg = M.palette.purple },
  CtrlpMatch = { fg = M.palette.yellow },
  Cursor = { bg = M.palette.blue, fg = M.palette.bg_bright },
  CursorColumn = { bg = M.palette.bg_dark },
  CursorLine = { bg = M.palette.bg_dark },
  CursorLineNr = { bg = M.palette.bg_dark, fg = M.palette.blue, bold = true },
  DiagnosticError = { fg = M.palette.red, bg = M.palette.bg_dark },
  DiagnosticFloatingError = { link = "DiagnosticSignError" },
  DiagnosticFloatingHint = { link = "DiagnosticSignHint" },
  DiagnosticFloatingInfo = { link = "DiagnosticSignInfo" },
  DiagnosticFloatingWarn = { link = "DiagnosticSignWarn" },
  DiagnosticHint = { fg = M.palette.purple, bg = M.palette.bg_dark },
  DiagnosticInfo = { fg = M.palette.blue, bg = M.palette.bg_dark },
  DiagnosticSignError = { fg = M.palette.red },
  DiagnosticSignHint = { fg = M.palette.purple },
  DiagnosticSignInfo = { fg = M.palette.blue },
  DiagnosticSignWarn = { fg = M.palette.yellow },
  DiagnosticUnderlineError = { underline = true, sp = M.palette.red },
  DiagnosticUnderlineHint = { underline = true, sp = M.palette.purple },
  DiagnosticUnderlineInfo = { underline = true, sp = M.palette.blue },
  DiagnosticUnderlineWarn = { underline = true, sp = M.palette.yellow },
  DiagnosticWarn = { fg = M.palette.yellow, bg = M.palette.bg_dark },
  DiffAdd = { bg = M.palette.diff_add },
  DiffChange = { bg = M.palette.diff_changed },
  DiffDelete = { fg = M.palette.space3, bg = M.palette.diff_del },
  DiffText = { bg = M.palette.diff_changed, underline = true, sp = M.palette.dark_blue },
  Directory = { fg = M.palette.purple },
  Error = { fg = M.palette.dark_red, bg = M.palette.space0, bold = true },
  ErrorMsg = { fg = M.palette.dark_red },
  FlashLabel = { link = "LeapLabelPrimary" },
  Float = { fg = M.palette.dark_yellow },
  FoldColumn = { fg = M.palette.dark_purple },
  Folded = { fg = M.palette.purple, bg = M.palette.space2 },
  Function = { fg = M.palette.red },
  GitGutterAdd = { fg = M.palette.green, bg = M.palette.bg },
  GitGutterChange = { fg = M.palette.yellow, bg = M.palette.bg },
  GitGutterChangeDelete = { fg = M.palette.red, bg = M.palette.bg },
  GitGutterDelete = { fg = M.palette.red, bg = M.palette.bg },
  GitSignsAdd = { link = "GitGutterAdd" },
  GitSignsChange = { link = "GitGutterChange" },
  GitSignsChangedelete = { link = "GitGutterDelete" },
  GitSignsDelete = { link = "GitGutterDelete" },
  GitSignsTopdelete = { link = "GitGutterDelete" },
  Identifier = { fg = M.palette.astral1 },
  Ignore = { fg = M.palette.space1 },
  IncSearch = { bg = M.palette.yellow, fg = M.palette.bg },
  Keyword = { fg = M.palette.green },
  Label = { fg = M.palette.dark_blue },
  LeapLabelPrimary = { fg = M.palette.bg_dark, bg = M.palette.dark_cyan, bold = true },
  LeapLabelSecondary = { fg = M.palette.bg_dark, bg = M.palette.purple },
  LineNr = { fg = M.palette.space4 },
  MatchParen = { bg = M.palette.bg_dark, fg = M.palette.purple, bold = true },
  ModeMsg = { fg = M.palette.norm_subtle, bold = true },
  MoreMsg = { link = "ModeMsg" },
  NERDTreeDir = { fg = M.palette.blue },
  NERDTreeFlags = { fg = M.palette.green },
  NeoTreeGitUnStaged = { fg = M.palette.dark_cyan },
  NeoTreeGitUntracked = { fg = M.palette.astral0, bold = true, italic = options.italic },
  NonText = { fg = M.palette.bg_bright },
  Normal = { bg = M.palette.bg, fg = M.palette.norm },
  NormalFloat = { link = "Pmenu" },
  NotifyDEBUGBorder = { fg = M.palette.blue },
  NotifyDEBUGIcon = { link = "NotifyDEBUGIcon" },
  NotifyDEBUGTitle = { link = "NotifyDEBUGBorder" },
  NotifyERRORBorder = { fg = M.palette.red },
  NotifyERRORIcon = { link = "NotifyERRORBorder" },
  NotifyERRORTitle = { link = "NotifyERRORBorder" },
  NotifyINFOBODY = { link = "NotifyInfoBorder" },
  NotifyINFOBorder = { fg = M.palette.green },
  NotifyINFOIcon = { link = "NotifyInfoBorder" },
  NotifyINFOTitle = { link = "NotifyInfoBorder" },
  NotifyTRACEBorder = { fg = M.palette.purple },
  NotifyTRACEIcon = { link = "NotifyTRACEBorder" },
  NotifyTRACETitle = { link = "NotifyTRACEBorder" },
  NotifyWARNBorder = { fg = M.palette.yellow },
  NotifyWARNIcon = { link = "NotifyWARNTitle" },
  NotifyWARNTitle = { link = "NotifyWARNBorder" },
  Number = { fg = M.palette.dark_yellow },
  NvimTreeFolderIcon = { fg = M.palette.purple },
  NvimTreeFolderName = { fg = M.palette.blue },
  NvimTreeRootFolder = { fg = M.palette.green },
  Operator = { fg = M.palette.dark_cyan },
  Pmenu = { fg = M.palette.norm, bg = M.palette.space2 },
  PmenuSbar = { fg = M.palette.norm, bg = M.palette.bg_dark },
  PmenuSel = { fg = M.palette.purple, bg = M.palette.bg },
  PmenuThumb = { fg = M.palette.norm, bg = M.palette.bg_dark },
  PreProc = { fg = M.palette.green },
  Question = { fg = M.palette.green },
  RenderMarkdownH1Bg = { fg = M.palette.dark_purple, underline = true, bold = true },
  RenderMarkdownH2Bg = { fg = M.palette.dark_blue, underline = true, bold = true },
  RenderMarkdownH3Bg = { fg = M.palette.dark_cyan, underline = true, bold = true },
  RenderMarkdownH4Bg = { fg = M.palette.green, underline = true, bold = true },
  RenderMarkdownH5Bg = { fg = M.palette.yellow, underline = true, bold = true },
  RenderMarkdownH6Bg = { fg = M.palette.yellow, underline = true, bold = true },
  Search = { bg = M.palette.dark_yellow, fg = M.palette.bg },
  SignColumn = { fg = M.palette.green },
  SignifySignAdd = { link = "LineNr" },
  SignifySignChange = { link = "LineNr" },
  SignifySignDelete = { link = "LineNr" },
  Sneak = { link = "Search" },
  Special = { fg = M.palette.cyan },
  SpecialKey = { fg = M.palette.blue },
  SpellBad = { underline = true, fg = M.palette.dark_red },
  SpellCap = { underline = true, fg = M.palette.green },
  SpellLocal = { underline = true, fg = M.palette.dark_green, sp = M.palette.dark_green },
  SpellRare = { underline = true, fg = M.palette.red },
  Statement = { fg = M.palette.green },
  StatusLine = { bg = M.palette.bg, fg = M.palette.norm },
  StatusLineNC = { bg = M.palette.bg },
  String = { fg = M.palette.yellow },
  TabLine = { fg = M.palette.norm_subtle, bg = M.palette.bg },
  TabLineFill = { fg = M.palette.norm_subtle, bg = M.palette.bg },
  TabLineSel = { fg = M.palette.norm, bg = M.palette.visual, bold = true },
  TelescopeBorder = { link = "LineNr" },
  TelescopeMatching = { link = "String" },
  TelescopeNormal = { fg = M.palette.astral0 },
  TelescopePreviewTitle = { fg = M.palette.space0, bg = M.palette.purple },
  TelescopePromptNormal = { link = "Normal" },
  TelescopePromptPrefix = { link = "Type" },
  TelescopePromptTitle = { fg = M.palette.space0, bg = M.palette.green },
  TelescopeResultsDiffAdd = { link = "GitGutterAdd" },
  TelescopeResultsDiffChange = { link = "GitGutterChange" },
  TelescopeResultsDiffDelete = { link = "GitGutterDelete" },
  TelescopeResultsDiffUntracked = { link = "Title" },
  TelescopeResultsTitle = { fg = M.palette.space0, bg = M.palette.blue },
  TelescopeSelection = { bg = M.palette.visual, fg = M.palette.astral1 },
  TelescopeSelectionCaret = { bg = M.palette.visual, fg = M.palette.green },
  Title = { fg = M.palette.dark_blue },
  Todo = { fg = M.palette.dark_yellow, bg = M.palette.space1, bold = true },
  Type = { fg = M.palette.purple },
  Underlined = { fg = M.palette.astral1, underline = true },
  Visual = { bg = M.palette.visual },
  WarningMsg = { fg = M.palette.yellow },
  WhichKey = { fg = M.palette.blue },
  WhichKeyDesc = { fg = M.palette.astral1 },
  WhichKeyGroup = { fg = M.palette.purple },
  WildMenu = { fg = M.palette.bg_dark, bg = M.palette.cyan },
  WinSeparator = { fg = M.palette.space3 },
  diffAdded = { fg = M.palette.green },
  diffFile = { fg = M.palette.purple },
  diffIndexLine = { fg = M.palette.purple },
  diffLine = { fg = M.palette.purple },
  diffNewFile = { fg = M.palette.blue },
  diffOldFile = { fg = M.palette.blue },
  diffRemoved = { fg = M.palette.red },
  diffSubname = { fg = M.palette.norm },
  elixirAtom = { fg = M.palette.yellow },
  elixirVariable = { fg = M.palette.purple },
  htmlBold = { bold = true },
  htmlBoldItalic = { bold = true, italic = options.italic },
  htmlEndTag = { link = "htmlTag" },
  htmlH1 = { fg = M.palette.head_a, bold = true, italic = options.italic },
  htmlH2 = { fg = M.palette.head_a, bold = true },
  htmlH3 = { fg = M.palette.head_b, italic = true },
  htmlH4 = { fg = M.palette.head_b, italic = true },
  htmlH5 = { fg = M.palette.head_c },
  htmlH6 = { fg = M.palette.head_c },
  htmlItalic = { italic = options.italic },
  htmlLink = { fg = M.palette.blue, underline = true },
  htmlTag = { link = "Special" },
  htmlTagN = { link = "Keyword" },
  htmlTagName = { link = "KeyWord" },
  jsAsyncKeyword = { link = "PreProc" },
  jsClassDefinition = { link = "Type" },
  jsClassKeyword = { fg = M.palette.purple },
  jsConditional = { link = "PreProc" },
  jsExtendsKeyword = { link = "PreProc" },
  jsForAwait = { link = "PreProc" },
  jsRepeat = { link = "PreProc" },
  jsReturn = { link = "PreProc" },
  jsxClosePunct = { link = "jsxOpenPunct" },
  jsxOpenPunct = { fg = M.palette.norm_subtle },
  markdownBlockquote = { fg = M.palette.norm },
  markdownBlockquoteDelimiter = { fg = M.palette.norm },
  markdownBold = { fg = M.palette.norm, bold = true },
  markdownBoldItalic = { fg = M.palette.norm, bold = true, italic = options.italic },
  markdownCode = { fg = M.palette.norm },
  markdownCodeDelimiter = { fg = M.palette.norm },
  markdownEscape = { fg = M.palette.norm },
  markdownFencedCodeBlock = { fg = M.palette.norm },
  markdownH1 = { fg = M.palette.head_a, bold = true, italic = options.italic },
  markdownH2 = { fg = M.palette.head_a, bold = true },
  markdownH3 = { fg = M.palette.head_a, italic = options.italic },
  markdownH4 = { fg = M.palette.head_a, italic = options.italic },
  markdownH6 = { fg = M.palette.head_a },
  markdownHeadingDelimiter = { fg = M.palette.norm },
  markdownHeadingRule = { fg = M.palette.norm },
  markdownId = { fg = M.palette.norm_subtle },
  markdownIdDeclaration = { fg = M.palette.norm_subtle },
  markdownInlineCode = { fg = M.palette.norm },
  markdownInlineDelimiter = { fg = M.palette.norm },
  markdownItalic = { fg = M.palette.norm, italic = options.italic },
  markdownItemDelimiter = { fg = M.palette.norm },
  markdownLinkDelimiter = { fg = M.palette.norm_subtle },
  markdownLinkReference = { fg = M.palette.norm_subtle },
  markdownLinkText = { fg = M.palette.norm },
  markdownLinkTextContainer = { fg = M.palette.norm_subtle },
  markdownLinkTextDelimiter = { fg = M.palette.norm_subtle },
  markdownLinkUrl = { fg = M.palette.norm_subtle, underline = true },
  markdownLinkUrlContainer = { fg = M.palette.norm_subtle },
  markdownListMarker = { fg = M.palette.norm },
  markdownOrderedListMarker = { fg = M.palette.norm },
  markdownRule = { fg = M.palette.norm },
  markdownUrl = { fg = M.palette.norm_subtle, underline = true },
  markdownUrlDelimiter = { fg = M.palette.norm_subtle },
  markdownUrlTitle = { fg = M.palette.norm },
  markdownUrlTitleDelimiter = { fg = M.palette.norm_subtle },
  mckarkdownH5 = { fg = M.palette.head_a },
  mkdBlockQuote = { fg = M.palette.norm },
  mkdCode = { fg = M.palette.norm },
  mkdDelimiter = { fg = M.palette.norm_subtle },
  mkdID = { fg = M.palette.norm_subtle },
  mkdIndentCode = { fg = M.palette.norm },
  mkdLineContinue = { fg = M.palette.norm },
  mkdLink = { fg = M.palette.norm },
  mkdLinkDef = { fg = M.palette.norm_subtle },
  mkdListItem = { fg = M.palette.norm },
  mkdNonListItemBlock = { fg = M.palette.norm }, -- bug in syntax?
  mkdRule = { fg = M.palette.norm },
  mkdUrl = { fg = M.palette.norm_subtle, underline = true },
  mmdFootnoteDelimiter = { fg = M.palette.norm_subtle },
  mmdFootnoteMarker = { fg = M.palette.norm },
  mmdTableAlign = { fg = M.palette.norm },
  mmdTableCaption = { fg = M.palette.norm },
  mmdTableCaptionDelimiter = { fg = M.palette.norm },
  mmdTableDelimiter = { fg = M.palette.norm },
  mmdTableHeadDelimiter = { fg = M.palette.norm },
  mmdTableHeader = { fg = M.palette.norm },
  qfLineNr = { fg = M.palette.norm_subtle },
  xmlEndTag = { link = "xmlTag" },
  xmlTag = { link = "htmlTag" },
  xmlTagName = { link = "htmlTagName" },
}

---@param group string
---@param style vim.api.keyset.highlight
function M.h(group, style)
  vim.api.nvim_set_hl(0, group, style)
end

function M.setup()
  vim.cmd([[
    hi clear

    if exists('syntax on')
      syntax reset
    endif
  ]])

  vim.g.colors_name = "embark"
  vim.o.background = "dark"

  if vim.fn.exists("g:embark_terminal_italics") ~= 1 then
    vim.g.embark_terminal_italics = 0
  end
  if vim.fn.exists("g:embark_terminalcolors") ~= 1 then
    vim.g.embark_termcolors = 256
  end

  if vim.fn.has("nvim-0.8") == 1 then
    M.colors["@constructor"] = { fg = M.palette.purple }
    M.colors["@function"] = { fg = M.palette.red }
    M.colors["@function.call"] = { fg = M.palette.blue }
    M.colors["@keyword.operator"] = { fg = M.palette.cyan }
    M.colors["@markup.emphasis"] = { italic = options.italic }
    M.colors["@markup.link"] = { fg = M.palette.purple }
    M.colors["@markup.link.uri"] = { fg = M.palette.blue }
    M.colors["@markup.list.checked"] = { fg = M.palette.norm_subtle }
    M.colors["@markup.list.unchecked"] = { fg = M.palette.dark_cyan, bold = true }
    M.colors["@markup.raw"] = { fg = M.palette.cyan }
    M.colors["@markup.strong"] = { bold = true }
    M.colors["@module"] = { fg = M.palette.purple }
    M.colors["@punctuation.bracket"] = { fg = M.palette.cyan }
    M.colors["@string.escape"] = { fg = M.palette.cyan }
    M.colors["@string.special"] = { fg = M.palette.dark_blue }
    M.colors["@string.special.symbol"] = { fg = M.palette.yellow }
    M.colors["@symbol"] = { fg = M.palette.yellow }
    M.colors["@text.emphasis"] = { italic = options.italic }
    M.colors["@text.literal"] = { fg = M.palette.cyan }
    M.colors["@text.reference"] = { fg = M.palette.purple }
    M.colors["@text.strong"] = { bold = true }
    M.colors["@text.todo.checked"] = { fg = M.palette.norm_subtle }
    M.colors["@text.todo.unchecked"] = { fg = M.palette.dark_cyan, bold = true }
    M.colors["@text.uri"] = { fg = M.palette.blue }
    M.colors["@variable.builtin"] = { fg = M.palette.cyan }

    M.colors["@constant.builtin"] = { link = "Special" }
    M.colors["@markup.heading"] = { link = "Title" }
    M.colors["@tag"] = { link = "Keyword" }
    M.colors["@tag.attribute"] = { link = "Constant" }
    M.colors["@tag.delimiter"] = { link = "Special" }
  end

  for name, style in pairs(M.colors) do
    M.h(name, style)
  end

  vim.g.terminal_color_0 = M.palette.bg_bright
  vim.g.terminal_color_1 = M.palette.red
  vim.g.terminal_color_2 = M.palette.green
  vim.g.terminal_color_3 = M.palette.yellow
  vim.g.terminal_color_4 = M.palette.blue
  vim.g.terminal_color_5 = M.palette.purple
  vim.g.terminal_color_6 = M.palette.cyan
  vim.g.terminal_color_7 = M.palette.bg
  vim.g.terminal_color_8 = M.palette.bg_bright
  vim.g.terminal_color_9 = M.palette.dark_red
  vim.g.terminal_color_10 = M.palette.dark_green
  vim.g.terminal_color_11 = M.palette.dark_yellow
  vim.g.terminal_color_12 = M.palette.dark_blue
  vim.g.terminal_color_13 = M.palette.dark_purple
  vim.g.terminal_color_14 = M.palette.dark_cyan
  vim.g.terminal_color_15 = M.palette.norm_subtle

  vim.g.terminal_ansi_colors = {
    M.palette.bg_bright,
    M.palette.red,
    M.palette.green,
    M.palette.yellow,
    M.palette.blue,
    M.palette.purple,
    M.palette.cyan,
    M.palette.bg,
    M.palette.bg_bright,
    M.palette.dark_red,
    M.palette.dark_green,
    M.palette.dark_yellow,
    M.palette.dark_blue,
    M.palette.dark_purple,
    M.palette.dark_cyan,
    M.palette.norm_subtle,
  }
end

return M
-- vim:ts=2:sts=2:sw=2:et
