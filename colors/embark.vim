" Vim Color File
" Name: embark.vim
" Based On: Challenger Deep, Ayu Mirage, and Manta

" == PRELUDE ==
"
" Setup and configuration
hi clear

if exists('syntax on')
  syntax reset
endif

let g:colors_name='embark'
set background=dark

if !exists("g:embark_terminal_italics")
  let g:embark_terminal_italics = 0
endif

if !exists("g:embark_terminalcolors")
  let g:embark_termcolors = 256
endif

" == COLOR PALETTE == 
"
" TODO: Cterm values here are OG from Challenger Deep

" Space
let s:space0 = { "gui": "#100E23", "cterm": "232", "cterm16": "0"}
let s:space1 = { "gui": "#1e1c31", "cterm": "233", "cterm16": "NONE"}
let s:space2 = { "gui": "#2D2B40", "cterm": "233", "cterm16": "NONE" }
let s:space3 = { "gui": "#3E3859", "cterm": "236", "cterm16": "8"}
let s:space4 = { "gui": "#585273", "cterm": "236", "cterm16": "8"}

" Astral
let s:astral0 = {"gui": "#8A889D", "cterm": "252", "cterm16": "15"}
let s:astral1 = { "gui": "#cbe3e7", "cterm": "253", "cterm16": "7"}

" Nebula
let s:red = { "gui": "#F48FB1", "cterm": "204", "cterm16": "1"}
let s:dark_red = { "gui": "#F02E6E", "cterm": "203", "cterm16": "9"}

let s:green = { "gui": "#A1EFD3", "cterm": "120", "cterm16": "2"}
let s:dark_green = { "gui": "#62d196", "cterm": "119", "cterm16": "10"}

let s:yellow = { "gui": "#ffe6b3", "cterm": "228", "cterm16": "3"}
let s:dark_yellow = { "gui": "#F2B482", "cterm": "215", "cterm16": "11"}

let s:blue = { "gui": "#91ddff", "cterm": "159", "cterm16": "4"}
let s:dark_blue = { "gui": "#65b2ff", "cterm": "75", "cterm16": "12"}

let s:purple = { "gui": "#d4bfff", "cterm": "141", "cterm16": "5"}
let s:dark_purple = { "gui": "#a37acc", "cterm": "135", "cterm16": "13"}

let s:cyan = { "gui": "#87DFEB", "cterm": "122", "cterm16": "6"}
let s:dark_cyan = { "gui": "#63f2f1", "cterm": "121", "cterm16": "14"}

let s:bg              = s:space1
let s:bg_dark       = s:space0
let s:bg_bright         = s:space4
let s:norm            = s:astral1
let s:norm_subtle     = s:astral0
let s:visual          = s:space3

let s:head_a         = s:dark_blue
let s:head_b         = s:blue
let s:head_c         = s:dark_cyan

" == UTILS AND HELPERS == 
"
" shamelessly stolen from hemisu: https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  " Not all terminals support italics properly. If yours does, opt-in.
  if g:embark_termcolors == 16
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm16 : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm16 : "NONE")
  else
    let l:ctermfg = (has_key(a:style, "fg") ? a:style.fg.cterm : "NONE")
    let l:ctermbg = (has_key(a:style, "bg") ? a:style.bg.cterm : "NONE")
  end
  execute "highlight" a:group
    \ "guifg="   (has_key(a:style, "fg")    ? a:style.fg.gui   : "NONE")
    \ "guibg="   (has_key(a:style, "bg")    ? a:style.bg.gui   : "NONE")
    \ "guisp="   (has_key(a:style, "sp")    ? a:style.sp.gui   : "NONE")
    \ "gui="     (has_key(a:style, "gui")   ? a:style.gui      : "NONE")
    \ "ctermfg=" . l:ctermfg
    \ "ctermbg=" . l:ctermbg
    \ "cterm="   (has_key(a:style, "cterm") ? a:style.cterm    : "NONE")
endfunction

function! s:maybe_italic(style)
  " Are italics turned on
  if g:embark_terminal_italics == 1
    " if there are other styles than italics concat
    if empty(a:style)
      return "italic"
    else
      return a:style . ",italic"
    endif
  else
    " If the only style would have been italics set to none
    if empty(a:style)
      return "NONE"
    else
      " Otherwise return other styles
      return a:style
    endif
  endif

endfunction

" == COMMON GROUPS ==
"
" (see `:h w18`)
call s:h("Normal",        {"bg": s:bg, "fg": s:norm})
call s:h("Cursor",        {"bg": s:blue, "fg": s:bg_bright})
call s:h("Comment",       {"fg": s:norm_subtle, "gui": s:maybe_italic(""), "cterm": s:maybe_italic("")})

call s:h("Constant",      {"fg": s:yellow})
hi! link String           Constant
hi! link Character        Constant

call s:h("Number",       {"fg": s:dark_yellow})
hi! link Boolean          Constant
hi! link Float            Constant

call s:h("Identifier",    {"fg": s:purple})
hi! link Function         Keyword

call s:h("Label",        {"fg": s:dark_blue})
hi! link Conditonal       Statement
hi! link Exception        Statement

call s:h("Operator",     {"fg": s:dark_cyan})
hi! link Repeat           Operator

call s:h("PreProc",       {"fg": s:green})
hi! link Include          PreProc
hi! link Define           PreProc
hi! link Macro            PreProc
hi! link PreCondit        PreProc

call s:h("Keyword",       {"fg": s:red})
hi! link Statement        Keyword

call s:h("Type",          {"fg": s:blue})
hi! link StorageClass     Type
hi! link Structure        Type
hi! link Typedef          Type

call s:h("Special",       {"fg": s:cyan})
hi! link SpecialChar      Special
hi! link Tag              Special
hi! link Delimiter        Special
hi! link SpecialComment   Special
hi! link Debug            Special

call s:h("Underlined",    {"fg": s:norm, "gui": "underline", "cterm": "underline"})
call s:h("Ignore",        {"fg": s:bg})
call s:h("Error",         {"fg": s:dark_red, "bg": s:bg_dark , "gui": "bold", "cterm": "bold"})
call s:h("Todo",          {"fg": s:dark_yellow, "bg": s:bg, "gui": "bold", "cterm": "bold"})

" == UI CHROME ==
"
" ordered according to `:help hitest.vim`
call s:h("SpecialKey",    {"fg": s:blue})
call s:h("Boolean",    {"fg": s:dark_yellow})
call s:h("Number",    {"fg": s:dark_yellow})
call s:h("Float",    {"fg": s:dark_yellow})
call s:h("NonText",       {"fg": s:bg_bright})
call s:h("Directory",     {"fg": s:purple})
call s:h("ErrorMsg",      {"fg": s:dark_red})
call s:h("IncSearch",     {"bg": s:yellow, "fg": s:bg})
call s:h("Search",        {"bg": s:dark_yellow, "fg": s:bg})
call s:h("MoreMsg",       {"fg": s:norm_subtle, "gui": "bold", "cterm": "bold"})
hi! link ModeMsg MoreMsg

call s:h("LineNr",        {"fg": s:space4, "bg": s:bg_dark})
hi LineNr guibg=NONE ctermbg=NONE

call s:h("CursorLineNr",  {"bg": s:bg_dark, "fg": s:blue, "gui": "bold"})
call s:h("Question",      {"fg": s:red})
call s:h("StatusLine",    {"bg": s:bg_bright})
call s:h("Conceal",       {"fg": s:norm})
call s:h("StatusLineNC",  {"bg": s:bg_bright, "fg": s:norm_subtle})
call s:h("VertSplit",     {"fg": s:bg_dark})
call s:h("Title",         {"fg": s:dark_blue})
call s:h("Visual",        {"bg": s:visual})
call s:h("WarningMsg",    {"fg": s:yellow})
call s:h("WildMenu",      {"fg": s:bg_dark, "bg": s:cyan})
call s:h("Folded",        {"fg": s:dark_purple})
call s:h("FoldColumn",    {"fg": s:yellow})
call s:h("DiffAdd",       {"fg": s:bg, "bg": s:dark_green})
call s:h("DiffDelete",    {"fg": s:bg, "bg": s:red})
call s:h("DiffChange",    {"fg": s:bg, "bg": s:dark_yellow})
call s:h("DiffText",      {"fg": s:bg, "bg": s:dark_yellow, "gui": "bold"})
call s:h("SignColumn",    {"fg": s:green})

if has("gui_running")
  call s:h("SpellBad",    {"gui": "underline", "sp": s:dark_red})
  call s:h("SpellCap",    {"gui": "underline", "sp": s:green})
  call s:h("SpellRare",   {"gui": "underline", "sp": s:red})
  call s:h("SpellLocal",  {"gui": "underline", "sp": s:dark_green})
else
  call s:h("SpellBad",    {"cterm": "underline", "fg": s:dark_red})
  call s:h("SpellCap",    {"cterm": "underline", "fg": s:green})
  call s:h("SpellRare",   {"cterm": "underline", "fg": s:red})
  call s:h("SpellLocal",  {"cterm": "underline", "fg": s:dark_green})
endif
call s:h("Pmenu",         {"fg": s:norm, "bg": s:space2})
call s:h("PmenuSel",      {"fg": s:purple, "bg": s:bg})
call s:h("PmenuSbar",     {"fg": s:norm, "bg": s:bg_dark})
call s:h("PmenuThumb",    {"fg": s:norm, "bg": s:bg_dark})
call s:h("TabLine",       {"fg": s:norm, "bg": s:bg_bright})
call s:h("TabLineSel",    {"fg": s:norm, "bg": s:bg_dark, "gui": "bold", "cterm": "bold"})
call s:h("TabLineFill",   {"fg": s:norm, "bg": s:bg_bright})
call s:h("CursorColumn",  {"bg": s:bg_dark})
call s:h("CursorLine",    {"bg": s:bg_dark})
call s:h("ColorColumn",   {"bg": s:bg_dark})

" == PLUGIN SUPPORT GROUPS ==
"
" vim-sneak
hi link Sneak Search


" HTML syntax
hi! link htmlTag          Special
hi! link htmlEndTag       htmlTag

hi! link htmlTagName      KeyWord
" html5 tags show up as htmlTagN
hi! link htmlTagN         Keyword

" HTML content
call s:h("htmlH1",        {"fg": s:head_a, "gui": s:maybe_italic("bold"), "cterm": "bold"     })
call s:h("htmlH2",        {"fg": s:head_a, "gui": "bold"       , "cterm": "bold"     })
call s:h("htmlH3",        {"fg": s:head_b, "gui": s:maybe_italic("")     , "cterm": s:maybe_italic("")   })
call s:h("htmlH4",        {"fg": s:head_b, "gui": s:maybe_italic("")     , "cterm": s:maybe_italic("")   })
call s:h("htmlH5",        {"fg": s:head_c                                            })
call s:h("htmlH6",        {"fg": s:head_c                                            })
call s:h("htmlLink",      {"fg": s:blue  , "gui": "underline"  , "cterm": "underline"})
call s:h("htmlItalic",    {                "gui": s:maybe_italic("")     , "cterm": s:maybe_italic("")   })
call s:h("htmlBold",      {                "gui": "bold"       , "cterm": "bold"     })
call s:h("htmlBoldItalic",{                "gui": s:maybe_italic("bold"), "cterm": "bold"     })
" hi htmlString     guifg=#87875f guibg=NONE gui=NONE        ctermfg=101 ctermbg=NONE cterm=NONE

" tpope/vim-markdown
call s:h("markdownBlockquote",          {"fg": s:norm})
call s:h("markdownBold",                {"fg": s:norm  , "gui": "bold"       , "cterm": "bold"  })
call s:h("markdownBoldItalic",          {"fg": s:norm  , "gui": s:maybe_italic("bold"), "cterm": "bold"  })
call s:h("markdownEscape",              {"fg": s:norm})
call s:h("markdownH1",                  {"fg": s:head_a, "gui": s:maybe_italic("bold"), "cterm": "bold"  })
call s:h("markdownH2",                  {"fg": s:head_a, "gui": "bold"       , "cterm": "bold"  })
call s:h("markdownH3",                  {"fg": s:head_a, "gui": s:maybe_italic("")     , "cterm": s:maybe_italic("")})
call s:h("markdownH4",                  {"fg": s:head_a, "gui": s:maybe_italic("")     , "cterm": s:maybe_italic("")})
call s:h("mckarkdownH5",                  {"fg": s:head_a})
call s:h("markdownH6",                  {"fg": s:head_a})
call s:h("markdownHeadingDelimiter",    {"fg": s:norm})
call s:h("markdownHeadingRule",         {"fg": s:norm})
call s:h("markdownId",                  {"fg": s:norm_subtle})
call s:h("markdownIdDeclaration",       {"fg": s:norm_subtle})
call s:h("markdownItalic",              {"fg": s:norm  , "gui": s:maybe_italic("")     , "cterm": s:maybe_italic("")})
call s:h("markdownLinkDelimiter",       {"fg": s:norm_subtle})
call s:h("markdownLinkText",            {"fg": s:norm})
call s:h("markdownLinkTextDelimiter",   {"fg": s:norm_subtle})
call s:h("markdownListMarker",          {"fg": s:norm})
call s:h("markdownOrderedListMarker",   {"fg": s:norm})
call s:h("markdownRule",                {"fg": s:norm})
call s:h("markdownUrl",                 {"fg": s:norm_subtle, "gui": "underline", "cterm": "underline"})
call s:h("markdownUrlDelimiter",        {"fg": s:norm_subtle})
call s:h("markdownUrlTitle",            {"fg": s:norm})
call s:h("markdownUrlTitleDelimiter",   {"fg": s:norm_subtle})
call s:h("markdownCode",                {"fg": s:norm})
call s:h("markdownCodeDelimiter",       {"fg": s:norm})

" plasticboy/vim-markdown
call s:h("mkdBlockQuote",               {"fg": s:norm})
call s:h("mkdDelimiter",                {"fg": s:norm_subtle})
call s:h("mkdID",                       {"fg": s:norm_subtle})
call s:h("mkdLineContinue",             {"fg": s:norm})
call s:h("mkdLink",                     {"fg": s:norm})
call s:h("mkdLinkDef",                  {"fg": s:norm_subtle})
call s:h("mkdListItem",                 {"fg": s:norm})
call s:h("mkdNonListItemBlock",         {"fg": s:norm})  " bug in syntax?
call s:h("mkdRule",                     {"fg": s:norm})
call s:h("mkdUrl",                      {"fg": s:norm_subtle, "gui": "underline", "cterm": "underline"})
call s:h("mkdCode",                     {"fg": s:norm})
call s:h("mkdIndentCode",               {"fg": s:norm})

" gabrielelana/vim-markdown
call s:h("markdownBlockquoteDelimiter", {"fg": s:norm})
call s:h("markdownInlineDelimiter",     {"fg": s:norm})
call s:h("markdownItemDelimiter",       {"fg": s:norm})
call s:h("markdownLinkReference",       {"fg": s:norm_subtle})
call s:h("markdownLinkText",            {"fg": s:norm})
call s:h("markdownLinkTextContainer",   {"fg": s:norm_subtle})
call s:h("markdownLinkUrl",             {"fg": s:norm_subtle, "gui": "underline", "cterm": "underline"})
call s:h("markdownLinkUrlContainer",    {"fg": s:norm_subtle})
call s:h("markdownFencedCodeBlock",     {"fg": s:norm})
call s:h("markdownInlineCode",          {"fg": s:norm})

" mattly/vim-markdown-enhancements
call s:h("mmdFootnoteDelimiter",        {"fg": s:norm_subtle})
call s:h("mmdFootnoteMarker",           {"fg": s:norm})
call s:h("mmdTableAlign",               {"fg": s:norm})
call s:h("mmdTableDelimiter",           {"fg": s:norm})
call s:h("mmdTableHeadDelimiter",       {"fg": s:norm})
call s:h("mmdTableHeader",              {"fg": s:norm})
call s:h("mmdTableCaptionDelimiter",    {"fg": s:norm})
call s:h("mmdTableCaption",             {"fg": s:norm})

" XML content
hi! link xmlTag                     htmlTag
hi! link xmlEndTag                  xmlTag
hi! link xmlTagName                 htmlTagName

call s:h("MatchParen",    {"bg": s:bg_dark, "fg": s:purple, "gui": "bold", "cterm": "bold"})
call s:h("qfLineNr",      {"fg": s:norm_subtle})

" Signify, git-gutter
hi link SignifySignAdd              LineNr
hi link SignifySignDelete           LineNr
hi link SignifySignChange           LineNr
call s:h("GitGutterAdd",{"fg": s:green, "bg": s:bg})
call s:h("GitGutterDelete",{"fg": s:red, "bg": s:bg})
call s:h("GitGutterChange",{"fg": s:yellow, "bg": s:bg})
call s:h("GitGutterChangeDelete",{"fg": s:red, "bg": s:bg})

" Ale
call s:h("ALEErrorSign", {"fg": s:red, "bg": s:bg})
call s:h("ALEWarningSign", {"fg": s:dark_yellow, "bg": s:bg})
call s:h("ALEVirtualTextWarning", {"fg": s:dark_yellow})
" CTRLP
call s:h("CtrlpMatch", {"fg": s:yellow})
call s:h("NERDTreeDir", {"fg": s:blue})
call s:h("NERDTreeFlags", {"fg": s:green})

" nvim LSP (legacy, kept here for retro-compatibility)
call s:h ("LspDiagnosticsError", {"fg": s:red, "bg": s:bg_dark})
call s:h ("LspDiagnosticsWarning", {"fg": s:yellow, "bg": s:bg_dark})
call s:h ("LspDiagnosticsInformation", {"fg": s:blue, "bg": s:bg_dark})
call s:h ("LspDiagnosticsHint", {"fg": s:purple, "bg": s:bg_dark})
call s:h ("LspDiagnosticsErrorSign", {"bg": s:bg})
call s:h ("LspDiagnosticsWarningSign", {"bg": s:bg})
call s:h ("LspDiagnosticsInformationSign", {"bg": s:bg})
call s:h ("LspDiagnosticsHintSign", {"bg": s:bg})

" nvim LSP (updated version for neovim master 35325ddac)
call s:h ("LspDiagnosticsDefaultError", {"fg": s:red, "bg": s:bg_dark})
call s:h ("LspDiagnosticsDefaultWarning", {"fg": s:yellow, "bg": s:bg_dark})
call s:h ("LspDiagnosticsDefaultInformation", {"fg": s:blue, "bg": s:bg_dark})
call s:h ("LspDiagnosticsDefaultHint", {"fg": s:purple, "bg": s:bg_dark})
call s:h ("LspDiagnosticsSignError", {"bg": s:bg})
call s:h ("LspDiagnosticsSignWarning", {"bg": s:bg})
call s:h ("LspDiagnosticsSignInformation", {"bg": s:bg})
call s:h ("LspDiagnosticsSignHint", {"bg": s:bg})
call s:h ("LspDiagnosticsUnderlineError", {"cterm": "undercurl", "gui": "undercurl"})
call s:h ("LspDiagnosticsFloatingError", {"bg": s:space2, "fg": s:red})
call s:h ("LspDiagnosticsFloatingWarning", {"bg": s:space2, "fg": s:yellow})
call s:h ("LspDiagnosticsFloatingInformation", {"bg": s:space2, "fg": s:blue})
call s:h ("LspDiagnosticsFloatingHint", {"bg": s:space2, "fg": s:purple})

" nvim terminal colors
let g:terminal_color_0 = s:bg_bright.gui
let g:terminal_color_1 = s:red.gui
let g:terminal_color_2 = s:green.gui
let g:terminal_color_3 = s:yellow.gui
let g:terminal_color_4 = s:blue.gui
let g:terminal_color_5 = s:purple.gui
let g:terminal_color_6 = s:cyan.gui
let g:terminal_color_7 = s:bg.gui
let g:terminal_color_8 = s:bg_bright.gui
let g:terminal_color_9 = s:dark_red.gui
let g:terminal_color_10 = s:dark_green.gui
let g:terminal_color_11 = s:dark_yellow.gui
let g:terminal_color_12 = s:dark_blue.gui
let g:terminal_color_13 = s:dark_purple.gui
let g:terminal_color_14 = s:dark_cyan.gui
let g:terminal_color_15 = s:norm_subtle.gui

