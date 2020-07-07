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
  let g:embark_terminal_italics = 1
endif

if !exists("g:embark_terminalcolors")
  let g:embark_termcolors = 256
endif

" == COLOR PALETTE == 
"
" TODO: Cterm values here are OG from Challenger Deep
let s:space = { "gui": "#1e1c31", "cterm": "233", "cterm16": "NONE"}
let s:deep_space= { "gui": "#100E23", "cterm": "232", "cterm16": "0"}
let s:eclipse = { "gui": "#3E3859", "cterm": "236", "cterm16": "8"}

let s:stardust = { "gui": "#cbe3e7", "cterm": "253", "cterm16": "7"}
let s:cosmos = { "gui": "#a6b3cc", "cterm": "252", "cterm16": "15"}

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

let s:black           = { "gui": "#2e3440", "cterm": "0", "cterm16" : "8" }
let s:medium_gray     = { "gui": "#767676", "cterm": "243", "cterm16" : "243" }
let s:white           = { "gui": "#F3F3F3", "cterm": "15", "cterm16" : "15" }
let s:actual_white    = { "gui": "#FFFFFF", "cterm": "231", "cterm16" : "231" }
let s:light_black     = { "gui": "#424242", "cterm": "8", "cterm16" : "0" }
let s:lighter_black   = { "gui": "#545454", "cterm": "240", "cterm16" : "240" }

" lighter shadows and darker grays
let s:subtle_black  = { "gui": "#303030", "cterm": "236", "cterm16" : "236" }
let s:light_gray    = { "gui": "#B2B2B2", "cterm": "249", "cterm16" : "249" }
let s:lighter_gray  = { "gui": "#C6C6C6", "cterm": "251", "cterm16" : "251" }

let s:bg              = s:space
let s:bg_subtle       = s:deep_space
let s:bg_dark         = s:eclipse
let s:norm            = s:stardust
let s:norm_subtle     = s:cosmos
let s:visual          = s:bg_dark

let s:head_a         = s:dark_blue
let s:head_b         = s:blue
let s:head_c         = s:dark_cyan

" == UTILS AND HELPERS == 
"
" shamelessly stolen from hemisu: https://github.com/noahfrederick/vim-hemisu/
function! s:h(group, style)
  " Not all terminals support italics properly. If yours does, opt-in.
  if g:embark_terminal_italics == 0 && has_key(a:style, "cterm") && a:style["cterm"] == "italic"
    unlet a:style.cterm
  endif
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

" == COMMON GROUPS ==
"
" (see `:h w18`)
call s:h("Normal",        {"bg": s:bg, "fg": s:norm})
call s:h("Cursor",        {"bg": s:blue, "fg": s:bg_dark})
call s:h("Comment",       {"fg": s:medium_gray, "gui": "italic", "cterm": "italic"})

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
call s:h("Error",         {"fg": s:dark_red, "bg": s:bg_subtle , "gui": "bold", "cterm": "bold"})
call s:h("Todo",          {"fg": s:dark_yellow, "bg": s:bg_subtle, "gui": "bold", "cterm": "bold"})

" == UI CHROME ==
"
" ordered according to `:help hitest.vim`
call s:h("SpecialKey",    {"fg": s:blue})
call s:h("Boolean",    {"fg": s:dark_yellow})
call s:h("Number",    {"fg": s:dark_yellow})
call s:h("Float",    {"fg": s:dark_yellow})
call s:h("NonText",       {"fg": s:bg_dark})
call s:h("Directory",     {"fg": s:purple})
call s:h("ErrorMsg",      {"fg": s:dark_red})
call s:h("IncSearch",     {"bg": s:yellow, "fg": s:space})
call s:h("Search",        {"bg": s:dark_yellow, "fg": s:space})
call s:h("MoreMsg",       {"fg": s:medium_gray, "gui": "bold", "cterm": "bold"})
hi! link ModeMsg MoreMsg

call s:h("LineNr",        {"fg": s:eclipse, "bg": s:bg_subtle})
hi LineNr guibg=NONE ctermbg=NONE

call s:h("CursorLineNr",  {"bg": s:bg_subtle, "fg": s:blue, "gui": "bold"})
call s:h("Question",      {"fg": s:red})
call s:h("StatusLine",    {"bg": s:bg_dark})
call s:h("Conceal",       {"fg": s:norm})
call s:h("StatusLineNC",  {"bg": s:bg_dark, "fg": s:medium_gray})
call s:h("VertSplit",     {"fg": s:bg_subtle})
call s:h("Title",         {"fg": s:dark_blue})
call s:h("Visual",        {"bg": s:visual})
call s:h("WarningMsg",    {"fg": s:yellow})
call s:h("WildMenu",      {"fg": s:bg_subtle, "bg": s:cyan})
call s:h("Folded",        {"fg": s:dark_purple})
call s:h("FoldColumn",    {"fg": s:yellow})
call s:h("DiffAdd",       {"fg": s:space, "bg": s:dark_green})
call s:h("DiffDelete",    {"fg": s:space, "bg": s:red})
call s:h("DiffChange",    {"fg": s:space, "bg": s:dark_yellow})
call s:h("DiffText",      {"fg": s:space, "bg": s:dark_yellow, "gui": "bold"})
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
call s:h("Pmenu",         {"fg": s:norm, "bg": s:deep_space})
call s:h("PmenuSel",      {"fg": s:purple, "bg": s:space})
call s:h("PmenuSbar",     {"fg": s:norm, "bg": s:bg_subtle})
call s:h("PmenuThumb",    {"fg": s:norm, "bg": s:bg_subtle})
call s:h("TabLine",       {"fg": s:norm, "bg": s:bg_dark})
call s:h("TabLineSel",    {"fg": s:norm, "bg": s:bg_subtle, "gui": "bold", "cterm": "bold"})
call s:h("TabLineFill",   {"fg": s:norm, "bg": s:bg_dark})
call s:h("CursorColumn",  {"bg": s:bg_subtle})
call s:h("CursorLine",    {"bg": s:bg_subtle})
call s:h("ColorColumn",   {"bg": s:bg_subtle})

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
call s:h("htmlH1",        {"fg": s:head_a, "gui": "bold,italic", "cterm": "bold"     })
call s:h("htmlH2",        {"fg": s:head_a, "gui": "bold"       , "cterm": "bold"     })
call s:h("htmlH3",        {"fg": s:head_b, "gui": "italic"     , "cterm": "italic"   })
call s:h("htmlH4",        {"fg": s:head_b, "gui": "italic"     , "cterm": "italic"   })
call s:h("htmlH5",        {"fg": s:head_c                                            })
call s:h("htmlH6",        {"fg": s:head_c                                            })
call s:h("htmlLink",      {"fg": s:blue  , "gui": "underline"  , "cterm": "underline"})
call s:h("htmlItalic",    {                "gui": "italic"     , "cterm": "italic"   })
call s:h("htmlBold",      {                "gui": "bold"       , "cterm": "bold"     })
call s:h("htmlBoldItalic",{                "gui": "bold,italic", "cterm": "bold"     })
" hi htmlString     guifg=#87875f guibg=NONE gui=NONE        ctermfg=101 ctermbg=NONE cterm=NONE

" tpope/vim-markdown
call s:h("markdownBlockquote",          {"fg": s:norm})
call s:h("markdownBold",                {"fg": s:norm  , "gui": "bold"       , "cterm": "bold"  })
call s:h("markdownBoldItalic",          {"fg": s:norm  , "gui": "bold,italic", "cterm": "bold"  })
call s:h("markdownEscape",              {"fg": s:norm})
call s:h("markdownH1",                  {"fg": s:head_a, "gui": "bold,italic", "cterm": "bold"  })
call s:h("markdownH2",                  {"fg": s:head_a, "gui": "bold"       , "cterm": "bold"  })
call s:h("markdownH3",                  {"fg": s:head_a, "gui": "italic"     , "cterm": "italic"})
call s:h("markdownH4",                  {"fg": s:head_a, "gui": "italic"     , "cterm": "italic"})
call s:h("mckarkdownH5",                  {"fg": s:head_a})
call s:h("markdownH6",                  {"fg": s:head_a})
call s:h("markdownHeadingDelimiter",    {"fg": s:norm})
call s:h("markdownHeadingRule",         {"fg": s:norm})
call s:h("markdownId",                  {"fg": s:medium_gray})
call s:h("markdownIdDeclaration",       {"fg": s:norm_subtle})
call s:h("markdownItalic",              {"fg": s:norm  , "gui": "italic"     , "cterm": "italic"})
call s:h("markdownLinkDelimiter",       {"fg": s:medium_gray})
call s:h("markdownLinkText",            {"fg": s:norm})
call s:h("markdownLinkTextDelimiter",   {"fg": s:medium_gray})
call s:h("markdownListMarker",          {"fg": s:norm})
call s:h("markdownOrderedListMarker",   {"fg": s:norm})
call s:h("markdownRule",                {"fg": s:norm})
call s:h("markdownUrl",                 {"fg": s:medium_gray, "gui": "underline", "cterm": "underline"})
call s:h("markdownUrlDelimiter",        {"fg": s:medium_gray})
call s:h("markdownUrlTitle",            {"fg": s:norm})
call s:h("markdownUrlTitleDelimiter",   {"fg": s:medium_gray})
call s:h("markdownCode",                {"fg": s:norm})
call s:h("markdownCodeDelimiter",       {"fg": s:norm})

" plasticboy/vim-markdown
call s:h("mkdBlockQuote",               {"fg": s:norm})
call s:h("mkdDelimiter",                {"fg": s:medium_gray})
call s:h("mkdID",                       {"fg": s:medium_gray})
call s:h("mkdLineContinue",             {"fg": s:norm})
call s:h("mkdLink",                     {"fg": s:norm})
call s:h("mkdLinkDef",                  {"fg": s:medium_gray})
call s:h("mkdListItem",                 {"fg": s:norm})
call s:h("mkdNonListItemBlock",         {"fg": s:norm})  " bug in syntax?
call s:h("mkdRule",                     {"fg": s:norm})
call s:h("mkdUrl",                      {"fg": s:medium_gray, "gui": "underline", "cterm": "underline"})
call s:h("mkdCode",                     {"fg": s:norm})
call s:h("mkdIndentCode",               {"fg": s:norm})

" gabrielelana/vim-markdown
call s:h("markdownBlockquoteDelimiter", {"fg": s:norm})
call s:h("markdownInlineDelimiter",     {"fg": s:norm})
call s:h("markdownItemDelimiter",       {"fg": s:norm})
call s:h("markdownLinkReference",       {"fg": s:medium_gray})
call s:h("markdownLinkText",            {"fg": s:norm})
call s:h("markdownLinkTextContainer",   {"fg": s:medium_gray})
call s:h("markdownLinkUrl",             {"fg": s:medium_gray, "gui": "underline", "cterm": "underline"})
call s:h("markdownLinkUrlContainer",    {"fg": s:medium_gray})
call s:h("markdownFencedCodeBlock",     {"fg": s:norm})
call s:h("markdownInlineCode",          {"fg": s:norm})

" mattly/vim-markdown-enhancements
call s:h("mmdFootnoteDelimiter",        {"fg": s:medium_gray})
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

call s:h("MatchParen",    {"bg": s:bg_subtle, "fg": s:purple, "gui": "bold", "cterm": "bold"})
call s:h("qfLineNr",      {"fg": s:medium_gray})

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


" nvim terminal colors
let g:terminal_color_0 = s:bg_dark.gui
let g:terminal_color_1 = s:red.gui
let g:terminal_color_2 = s:green.gui
let g:terminal_color_3 = s:yellow.gui
let g:terminal_color_4 = s:blue.gui
let g:terminal_color_5 = s:purple.gui
let g:terminal_color_6 = s:cyan.gui
let g:terminal_color_7 = s:space.gui
let g:terminal_color_8 = s:bg_subtle.gui
let g:terminal_color_9 = s:dark_red.gui
let g:terminal_color_10 = s:dark_green.gui
let g:terminal_color_11 = s:dark_yellow.gui
let g:terminal_color_12 = s:dark_blue.gui
let g:terminal_color_13 = s:dark_purple.gui
let g:terminal_color_14 = s:dark_cyan.gui
let g:terminal_color_15 = s:cosmos.gui

