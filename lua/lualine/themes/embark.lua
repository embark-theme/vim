local colors = {
  space0       = "#100e23",
  space1       = "#1e1c31",
  space2       = "#2d2b40",
  space3       = "#3e3859",
  space4       = "#585273",
  astral1      = "#cbe3e7",
  cyan         = "#aaffe4",
  darkcyan     = "#63f2f1",
  yellow       = "#ffe9aa",
  darkyellow   = "#ffb378",
  red          = "#f48fb1",
  darkred      = "#ff5458",
  green        = "#a1efd3",
  darkgreen    = "#62d196",
  purple       = "#d4bfff",
  nebula10     = "#78A8ff",
  nebula11     = "#7676ff",
}

local embark = {
  normal = {
    a = { fg = colors.space0, bg = colors.cyan, gui = "bold", },
    b = { fg = colors.astral1, bg = colors.space2 },
    c = { fg = colors.astral1, bg = colors.space0 },
    y = { fg = colors.space0, bg = colors.darkcyan },
  },
  visual = {
    a = { fg = colors.space0, bg = colors.yellow, gui = "bold", },
    b = { fg = colors.space0, bg = colors.darkyellow },
  },
  insert = {
    a = { fg = colors.space0, bg = colors.red, gui = "bold", },
    b = { fg = colors.space0, bg = colors.darkred },
  },
  replace = {
    a = { fg = colors.space0, bg = colors.nebula10, gui = "bold", },
    b = { fg = colors.space0, bg = colors.nebula11 },
  },
  inactive = {
    a = { fg = colors.space4, bg = colors.space1, gui = "bold", },
    b = { fg = colors.space4, bg = colors.space1 },
    c = { fg = colors.space4, bg = colors.space2 },
    x = { fg = colors.space0, bg = colors.purple },
  },
}

return embark
