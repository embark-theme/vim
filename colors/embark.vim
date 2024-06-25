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
let s:dark_green = { "gui": "#7fe9c3", "cterm": "119", "cterm16": "10"}

let s:yellow = { "gui": "#ffe6b3", "cterm": "228", "cterm16": "3"}
let s:dark_yellow = { "gui": "#F2B482", "cterm": "215", "cterm16": "11"}

let s:blue = { "gui": "#91ddff", "cterm": "159", "cterm16": "4"}
let s:dark_blue = { "gui": "#78a8ff", "cterm": "135", "cterm16": "13"}

let s:purple = { "gui": "#d4bfff", "cterm": "141", "cterm16": "5"}
let s:dark_purple = { "gui": "#7676ff", "cterm": "75", "cterm16": "12"}

let s:cyan = { "gui": "#ABF8F7", "cterm": "122", "cterm16": "6"}
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

let s:diff_del = { "gui": "#5E3859", "cterm": "203", "cterm16": "9"}
let s:diff_add = { "gui": "#2D5059", "cterm": "119", "cterm16": "10"}
let s:diff_changed = { "gui": "#38325A", "cterm": "215", "cterm16": "11"}

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
" Generated with `:help E669`
"
" Nested descriptions fallback to parent rule
call s:h("Comment",       {"fg": s:norm_subtle, "gui": s:maybe_italic(""), "cterm": s:maybe_italic("")})

" * Constant any constant
call s:h("Constant",      {"fg": s:purple})
"   String  a string constant: "this is a string"
call s:h("String",      {"fg": s:yellow})
"   Character a character constant: 'c', '\n'
"   Number  a number constant: 234, 0xff
call s:h("Number",    {"fg": s:dark_yellow})
"   Boolean a boolean constant: TRUE, false
call s:h("Boolean",    {"fg": s:dark_yellow})
"   Float  a floating point constant: 2.3e10
call s:h("Float",    {"fg": s:dark_yellow})

" * Identifier any variable name
call s:h("Identifier", {"fg": s:norm})
"   Function function name (also: methods for classes)
call s:h("Function",      {"fg": s:red})

" * Statement - any statement
call s:h("Statement",  {"fg": s:green})
"   Conditional if, then, else, endif, switch, etc.
"   Repeat  for, do, while, etc.
"   Label  case, default, etc.
call s:h("Label",        {"fg": s:dark_blue})
"   Operator "sizeof", "+", "*", etc.
call s:h("Operator",     {"fg": s:dark_cyan})
"   Keyword any other keyword
call s:h("Keyword",       {"fg": s:green})
"   Exception try, catch, throw

" * PreProc generic Preprocessor
call s:h("PreProc",       {"fg": s:green})
"   Include preprocessor #include
"   Define  preprocessor #define
"   Macro  same as Define
"   PreCondit preprocessor #if, #else, #endif, etc.

" * Type  int, long, char, etc.
call s:h("Type",          {"fg": s:purple})
"   StorageClass static, register, volatile, etc.
"   Structure struct, union, enum, etc.
"   Typedef A typedef

" * Special any special symbol
call s:h("Special",       {"fg": s:cyan})
"   SpecialChar special character in a constant
"   Tag  you can use CTRL-] on this
"   Delimiter character that needs attention
"   SpecialComment special things inside a comment
"   Debug  debugging statements

" * Underlined text that stands out, HTML links
call s:h("Underlined",    {"fg": s:norm, "gui": "underline", "cterm": "underline"})

" * Ignore  left blank, hidden  |hl-Ignore|
call s:h("Ignore",        {"fg": s:bg})

" * Error  any erroneous construct
call s:h("Error",         {"fg": s:dark_red, "bg": s:bg_dark , "gui": "bold", "cterm": "bold"})

" * Todo  anything that needs extra attention; mostly the
"    keywords TODO FIXME and XXX
call s:h("Todo",          {"fg": s:dark_yellow, "bg": s:bg, "gui": "bold", "cterm": "bold"})


" == UI CHROME ==
" Generated with `:help highlight-default`
"
" ColorColumn - Used for the columns set with 'colorcolumn'.
call s:h("ColorColumn",   {"bg": s:space2})
" Conceal - Placeholder characters substituted for concealed
call s:h("Conceal",       {"fg": s:norm})
" Cursor - Character under the cursor.
call s:h("Cursor",        {"bg": s:blue, "fg": s:bg_bright})
" CursorColumn - Screen-column at the cursor, when 'cursorcolumn' is set.
call s:h("CursorColumn",  {"bg": s:bg_dark})
" CursorLine - Screen-line at the cursor, when 'cursorline' is set.
call s:h("CursorLine",    {"bg": s:bg_dark})
" Directory -Directory names (and other special names in listings).
call s:h("Directory",     {"fg": s:purple})
" DiffAdd - Diff mode: Added line. |diff.txt|
call s:h("DiffAdd",       {"bg": s:diff_add})
" DiffChange - Diff mode: Changed line. |diff.txt|
call s:h("DiffChange",    {"bg": s:diff_changed})
" DiffDelete - Diff mode: Deleted line. |diff.txt|
call s:h("DiffDelete",    {"fg": s:visual, "bg": s:diff_del})
" DiffText - Diff mode: Changed text within a changed line. |diff.txt|
call s:h("DiffText",      {"bg": s:diff_changed, "gui": "underline", "sp": s:dark_blue })
" EndOfBuffer	Filler lines (~) after the end of the buffer.
" ErrorMsg - Error messages on the command line.
call s:h("ErrorMsg",      {"fg": s:dark_red})
" WinSeparator - Separators between window splits.
call s:h("WinSeparator",     {"fg": s:space3})
" Folded - Line used for closed folds.
call s:h("Folded",        {"fg": s:dark_purple})
" FoldColumn - 'foldcolumn'
call s:h("FoldColumn",    {"fg": s:dark_purple})
" SignColumn - Column where |signs| are displayed.
call s:h("SignColumn",    {"fg": s:green})
" IncSearch - 'incsearch' highlighting; also used for the text replaced with
call s:h("IncSearch",     {"bg": s:yellow, "fg": s:bg})
" Substitute - |:substitute| replacement text highlighting.
" LineNr -Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
call s:h("LineNr",        {"fg": s:space4})
" CursorLineNr - Like LineNr when 'cursorline' is set and 'cursorlineopt'
call s:h("CursorLineNr",  {"bg": s:bg_dark, "fg": s:blue, "gui": "bold"})
" CursorLineFold - Like FoldColumn when 'cursorline' is set for the cursor line.
" MatchParen - Character under the cursor or just before it, if it
call s:h("MatchParen",    {"bg": s:bg_dark, "fg": s:purple, "gui": "bold", "cterm": "bold"})
" ModeMsg - 'showmode' message (e.g., "-- INSERT --").
call s:h("ModeMsg",       {"fg": s:norm_subtle, "gui": "bold", "cterm": "bold"})
" MsgArea - Area for messages and cmdline.
" MoreMsg - |more-prompt|
hi! link MoreMsg ModeMsg
" NonText - '@' at the end of the window, characters from 'showbreak'
call s:h("NonText",       {"fg": s:bg_bright})
" Normal - Normal text.
call s:h("Normal",        {"bg": s:bg, "fg": s:norm})
" Pmenu - Popup menu: Normal item.
call s:h("Pmenu",         {"fg": s:norm, "bg": s:space2})
" NormalFloat - Normal text in floating windows.
hi! link NormalFloat Pmenu 
" PmenuSel - Popup menu: Selected item.
call s:h("PmenuSel",      {"fg": s:purple, "bg": s:bg})
" PmenuSbar - Popup menu: Scrollbar.
call s:h("PmenuSbar",     {"fg": s:norm, "bg": s:bg_dark})
" PmenuThumb - Popup menu: Thumb of the scrollbar.
call s:h("PmenuThumb",    {"fg": s:norm, "bg": s:bg_dark})
" Question - |hit-enter| prompt and yes/no questions.
call s:h("Question",      {"fg": s:green})
" QuickFixLine - Current |quickfix| item in the quickfix window. Combined with
" Search - Last search pattern highlighting (see 'hlsearch').
call s:h("Search",        {"bg": s:dark_yellow, "fg": s:bg})
" SpecialKey - Unprintable chars: Text displayed differently from what it is
call s:h("SpecialKey",    {"fg": s:blue})
" SpellBad Word that is not recognized by the spellchecker. |spell|
if has("gui_running")
" SpellBad Word that is not recognized by the spellchecker. |spell|
  call s:h("SpellBad",    {"gui": "underline", "sp": s:dark_red})
" SpellCap - Word that should start with a capital. |spell|
  call s:h("SpellCap",    {"gui": "underline", "sp": s:green})
" SpellLocal - Word that is recognized by the spellchecker as one that is
  call s:h("SpellLocal",  {"gui": "underline", "sp": s:dark_green})
" SpellRare - Word that is recognized by the spellchecker as one that is
  call s:h("SpellRare",   {"gui": "underline", "sp": s:red})
else
" SpellBad Word that is not recognized by the spellchecker. |spell|
  call s:h("SpellBad",    {"cterm": "underline", "fg": s:dark_red})
" SpellCap - Word that should start with a capital. |spell|
  call s:h("SpellCap",    {"cterm": "underline", "fg": s:green})
" SpellLocal - Word that is recognized by the spellchecker as one that is
  call s:h("SpellLocal",  {"cterm": "underline", "fg": s:dark_green})
" SpellRare - Word that is recognized by the spellchecker as one that is
  call s:h("SpellRare",   {"cterm": "underline", "fg": s:red})
" SpellLocal - Word that is recognized by the spellchecker as one that is
  call s:h("SpellLocal",  {"gui": "underline", "sp": s:dark_green})
endif
" StatusLine - Status line of current window.
call s:h("StatusLine",    {"bg": s:bg, "fg": s:norm})
" StatusLineNC - Status lines of not-current windows.
call s:h("StatusLineNC",  {"bg": s:bg})
" TabLine - Tab pages line, not active tab page label.
call s:h("TabLine",       {"fg": s:norm_subtle, "bg": s:bg})
" TabLineFill - Tab pages line, where there are no labels.
call s:h("TabLineFill",   {"fg": s:norm_subtle, "bg": s:bg})
" TabLineSel Tab pages line, active tab page label.
call s:h("TabLineSel",    {"fg": s:norm, "bg": s:visual, "gui": "bold", "cterm": "bold"})
" Title - Titles for output from ":set all", ":autocmd" etc.
call s:h("Title",         {"fg": s:dark_blue})
" Visual - Visual mode selection.
call s:h("Visual",        {"bg": s:visual})
" VisualNOS - Visual mode selection when vim is "Not Owning the Selection".
" WarningMsg - Warning messages.
call s:h("WarningMsg",    {"fg": s:yellow})
" Whitespace - "nbsp", "space", "tab", "multispace", "lead" and "trail"
" WildMenu - Current match in 'wildmenu' completion.
call s:h("WildMenu",      {"fg": s:bg_dark, "bg": s:cyan})
" WinBar - Window bar of current window.
" WinBarNC - Window bar of not-current windows.

if has('nvim')
  " Neovim Diagnostics
  " SEVERITY - Info, Warn, Error, Hint
  " TYPE - Sign, Underline, Float, Virtual Text
  "
  " Highlights
  " Diagnostic[SEVERITY]
  " Diagnostic[TYPE][SEVERITY]
  "
  " Default Diagnostic highlights
  " Dark background for virtual text
  call s:h("DiagnosticHint", { "fg": s:purple, "bg": s:bg_dark })
  call s:h("DiagnosticInfo", { "fg": s:blue, "bg": s:bg_dark })
  call s:h("DiagnosticWarn", { "fg": s:yellow, "bg": s:bg_dark })
  call s:h("DiagnosticError", { "fg": s:red, "bg": s:bg_dark })
  " For signs and floating menus drop the dark background
  call s:h("DiagnosticSignHint", { "fg": s:purple })
  call s:h("DiagnosticSignWarn", { "fg": s:yellow })
  call s:h("DiagnosticSignInfo", { "fg": s:blue })
  call s:h("DiagnosticSignError", { "fg": s:red })
  hi link DiagnosticFloatingHint DiagnosticSignHint
  hi link DiagnosticFloatingInfo DiagnosticSignInfo
  hi link DiagnosticFloatingWarn DiagnosticSignWarn
  hi link DiagnosticFloatingError DiagnosticSignError
  call s:h("DiagnosticUnderlineHint", {"cterm": "underline", "gui": "underline", "sp": s:purple})
  call s:h("DiagnosticUnderlineInfo", {"cterm": "underline", "gui": "underline", "sp": s:blue})
  call s:h("DiagnosticUnderlineWarn", {"cterm": "underline", "gui": "underline", "sp": s:yellow})
  call s:h("DiagnosticUnderlineError", {"cterm": "underline", "gui": "underline", "sp": s:red})

  " Telescope support
  call s:h("TelescopeNormal", {"fg": s:astral0})
  hi link TelescopeBorder LineNr
  call s:h("TelescopeSelection", {"bg": s:visual, "fg": s:astral1})
  hi link TelescopeMatching String
  call s:h("TelescopePreviewTitle", {"fg": s:space0, "bg": s:purple})
  call s:h("TelescopePromptTitle", {"fg": s:space0, "bg": s:green})
  hi link TelescopePromptNormal Normal
  call s:h("TelescopeResultsTitle", {"fg": s:space0, "bg": s:blue})
  hi link TelescopePromptPrefix Type
  hi link TelescopeResultsDiffAdd GitGutterAdd
  hi link TelescopeResultsDiffChange GitGutterChange
  hi link TelescopeResultsDiffDelete GitGutterDelete
  hi link TelescopeResultsDiffUntracked Title

  " Nvim-tree support
  call s:h("NvimTreeFolderIcon", {"fg": s:purple})
  call s:h("NvimTreeFolderName", {"fg": s:blue})
  call s:h("NvimTreeRootFolder", {"fg": s:green})

  " nvim-cmp support
  hi link CmpItemMenu Comment
  call s:h("CmpItemKindDefault", {"fg": s:purple})
  hi link CmpItemAbbrMatch Pmenu
  hi link CmpItemKindDefault Pmenu
  hi link CmpItemKindFunction Function
  hi link CmpItemKindMethod CmpItemKindFunction
  hi link CmpItemKindModule PreProc
  hi link CmpItemKindStruct CmpItemKindModule
  hi link CmpItemKindText Comment
  hi link CmpItemKindSnippet Constant
  hi! link CmpItemKindReference CmpItemKindDefault
  hi! link CmpItemKindInterface CmpItemKindDefault

  " Leap support
  call s:h("LeapLabelPrimary", {"fg": s:bg_dark, "bg": s:dark_cyan, "gui": "bold"})
  call s:h("LeapLabelSecondary", {"fg": s:bg_dark, "bg": s:purple})

  " nvim notify support
  call s:h("NotifyERRORBorder", {"fg": s:red})
  hi! link NotifyERRORTitle NotifyERRORBorder
  hi! link NotifyERRORIcon NotifyERRORBorder

  call s:h("NotifyWARNBorder", {"fg": s:yellow})
  hi! link NotifyWARNTitle NotifyWARNBorder
  hi! link NotifyWARNIcon NotifyWARNTitle

  call s:h("NotifyINFOBorder", {"fg": s:green})
  hi! link NotifyINFOTitle NotifyInfoBorder
  hi! link NotifyINFOIcon NotifyInfoBorder
  hi! link NotifyINFOBODY NotifyInfoBorder

  call s:h("NotifyDEBUGBorder", {"fg": s:blue})
  hi! link NotifyDEBUGTitle NotifyDEBUGBorder
  hi! link NotifyDEBUGIcon NotifyDEBUGIcon

  call s:h("NotifyTRACEBorder", {"fg": s:purple})
  hi! link NotifyTRACETitle NotifyTRACEBorder
  hi! link NotifyTRACEIcon NotifyTRACEBorder

  " Which Key
  call s:h("WhichKey", {"fg": s:blue})
  call s:h("WhichKeyDesc", {"fg": s:astral1})
  call s:h("WhichKeyGroup", {"fg": s:purple})

  " Neotree
  call s:h("NeoTreeGitUntracked", {"fg": s:astral0, "gui": s:maybe_italic("bold")})
  call s:h("NeoTreeGitUnStaged", {"fg": s:dark_cyan})

  if has('nvim-0.8')
    " Treesitter support
    call s:h("@keyword.operator", {"fg": s:cyan})
    hi! link @constant.builtin Special
    call s:h("@punctuation.bracket", {"fg": s:cyan})
    call s:h("@variable.builtin", {"fg": s:cyan})

    call s:h("@string.special", {"fg": s:dark_blue})
    call s:h("@string.escape", {"fg": s:cyan})
    call s:h("@string.special.symbol", {"fg": s:yellow})

    call s:h("@module", {"fg": s:purple })
    call s:h("@function", {"fg": s:red})
    call s:h("@function.call", {"fg": s:blue})
    call s:h("@constructor", {"fg": s:purple})

    hi! link @markup.heading Title
    call s:h("@markup.raw", {"fg": s:cyan})
    call s:h("@markup.link.uri", {"fg": s:blue})
    call s:h("@markup.link", {"fg": s:purple})
    call s:h("@markup.strong", {"gui": "bold"})
    call s:h("@markup.emphasis", {"gui": s:maybe_italic("")})
    call s:h("@markup.list.unchecked", {"fg": s:dark_cyan, "gui": "bold"})
    call s:h("@markup.list.checked", {"fg": s:norm_subtle})

    hi! link @tag Keyword
    hi! link @tag.delimiter Special
    hi! link @tag.attribute Constant

    " Deprecated nvim-treesitter highlights
    " Will remove in a few months
    call s:h("@symbol", {"fg": s:yellow})
    call s:h("@text.literal", {"fg": s:cyan})
    call s:h("@text.uri", {"fg": s:blue})
    call s:h("@text.reference", {"fg": s:purple})
    call s:h("@text.strong", {"gui": "bold"})
    call s:h("@text.emphasis", {"gui": s:maybe_italic("")})
    call s:h("@text.todo.unchecked", {"fg": s:dark_cyan, "gui": "bold"})
    call s:h("@text.todo.checked", {"fg": s:norm_subtle})
  endif
endif

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

" Javascript
hi! link jsAsyncKeyword  PreProc
hi! link jsForAwait  PreProc
call s:h("jsClassKeyword", {"fg": s:purple})
hi! link jsClassDefinition Type
hi! link jsConditional PreProc
hi! link jsExtendsKeyword PreProc
hi! link jsReturn PreProc
hi! link jsRepeat PreProc
call s:h("jsxOpenPunct", {"fg": s:norm_subtle})
hi! link jsxClosePunct jsxOpenPunct

" Elixir
call s:h("elixirVariable", {"fg": s:purple})
call s:h("elixirAtom", {"fg": s:yellow})

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

call s:h("qfLineNr",      {"fg": s:norm_subtle})

" Signify, git-gutter, gitsigns.nvim
hi link SignifySignAdd              LineNr
hi link SignifySignDelete           LineNr
hi link SignifySignChange           LineNr
call s:h("GitGutterAdd",{"fg": s:green, "bg": s:bg})
call s:h("GitGutterDelete",{"fg": s:red, "bg": s:bg})
call s:h("GitGutterChange",{"fg": s:yellow, "bg": s:bg})
call s:h("GitGutterChangeDelete",{"fg": s:red, "bg": s:bg})
hi link GitSignsAdd GitGutterAdd
hi link GitSignsChange GitGutterChange
hi link GitSignsDelete GitGutterDelete
hi link GitSignsChangedelete GitGutterDelete
hi link GitSignsTopdelete GitGutterDelete

" Fugitive
call s:h("diffAdded",     {"fg": s:green})
call s:h("diffRemoved",   {"fg": s:red})
call s:h("diffFile",      {"fg": s:purple})
call s:h("diffIndexLine", {"fg": s:purple})
call s:h("diffOldFile",   {"fg": s:blue})
call s:h("diffNewFile",   {"fg": s:blue})
call s:h("diffLine",      {"fg": s:purple})
call s:h("diffSubname",   {"fg": s:norm})

" Ale
call s:h("ALEErrorSign", {"fg": s:red, "bg": s:bg})
call s:h("ALEWarningSign", {"fg": s:dark_yellow, "bg": s:bg})
call s:h("ALEVirtualTextWarning", {"fg": s:dark_yellow})
" CTRLP
call s:h("CtrlpMatch", {"fg": s:yellow})
call s:h("NERDTreeDir", {"fg": s:blue})
call s:h("NERDTreeFlags", {"fg": s:green})

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

" 256-color terminal colors
let g:terminal_ansi_colors = [
    \ s:bg_bright.gui, s:red.gui,         s:green.gui,      s:yellow.gui,
    \ s:blue.gui,      s:purple.gui,      s:cyan.gui,       s:bg.gui,
    \ s:bg_bright.gui, s:dark_red.gui,    s:dark_green.gui, s:dark_yellow.gui,
    \ s:dark_blue.gui, s:dark_purple.gui, s:dark_cyan.gui,  s:norm_subtle.gui]

