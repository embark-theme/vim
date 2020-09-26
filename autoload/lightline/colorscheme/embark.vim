" Colors
let s:deep_space= { "gui": "#100E23", "cterm": "232", "cterm16": "8"}
let s:space = { "gui": "#1e1c31", "cterm": "233", "cterm16": "NONE"}
let s:eclipse = { "gui": "#3E3859", "cterm": "236", "cterm16": "0"}

let s:red = { "gui": "#F48FB1", "cterm": "204", "cterm16": "1"}
let s:dark_red = { "gui": "#ff5458", "cterm": "203", "cterm16": "9"}

let s:green = { "gui": "#A1EFD3", "cterm": "120", "cterm16": "2"}
let s:dark_green = { "gui": "#62d196", "cterm": "119", "cterm16": "10"}

let s:yellow = { "gui": "#ffe9aa", "cterm": "228", "cterm16": "3"}
let s:dark_yellow = { "gui": "#ffb378", "cterm": "215", "cterm16": "11"}

let s:blue = { "gui": "#91ddff", "cterm": "159", "cterm16": "4"}
let s:dark_blue = { "gui": "#65b2ff", "cterm": "75", "cterm16": "12"}

let s:purple = { "gui": "#c991e1", "cterm": "141", "cterm16": "5"}
let s:dark_purple = { "gui": "#906cff", "cterm": "135", "cterm16": "13"}

let s:cyan = { "gui": "#aaffe4", "cterm": "122", "cterm16": "6"}
let s:dark_cyan = { "gui": "#63f2f1", "cterm": "121", "cterm16": "14"}

let s:clouds = { "gui": "#cbe3e7", "cterm": "253", "cterm16": "7"}
let s:dark_clouds = { "gui": "#6B697E", "cterm": "252", "cterm16": "15"}

let s:bg              = s:space
let s:bg_dark       = s:deep_space
let s:bg_bright         = s:eclipse
let s:norm            = s:clouds
let s:norm_subtle     = s:dark_clouds
let s:visual          = s:bg_bright

" lightline embark colors
let s:lfc = {
      \'space': [s:space.gui, s:space.cterm16],
      \'deep_space': [s:deep_space.gui, s:deep_space.cterm16],
      \'eclipse' : [s:eclipse.gui, s:eclipse.cterm16],
      \'red' : [s:red.gui, s:red.cterm16],
      \'dark_red' : [s:dark_red.gui, s:dark_red.cterm16],
      \'green' : [s:green.gui, s:green.cterm16],
      \'dark_green' : [s:dark_green.gui, s:dark_green.cterm16],
      \'yellow' : [s:yellow.gui, s:yellow.cterm16],
      \'dark_yellow' : [s:dark_yellow.gui, s:dark_yellow.cterm16],
      \'blue' : [s:blue.gui, s:blue.cterm16],
      \'dark_blue' : [s:dark_blue.gui, s:dark_blue.cterm16],
      \'purple' : [s:purple.gui, s:purple.cterm16],
      \'dark_purple' : [s:dark_purple.gui, s:dark_purple.cterm16],
      \'cyan' : [s:cyan.gui, s:cyan.cterm16],
      \'dark_cyan' : [s:dark_cyan.gui, s:dark_cyan.cterm16],
      \'clouds' : [s:clouds.gui, s:clouds.cterm16],
      \'dark_clouds' : [s:dark_clouds.gui, s:dark_clouds.cterm16],
      \'bg': [s:bg.gui, s:bg.cterm16],
      \'bg_dark': [s:bg_dark.gui, s:bg_dark.cterm16],
      \'bg_bright': [s:bg_bright.gui, s:bg_bright.cterm16],
      \'norm': [s:norm.gui, s:norm.cterm16],
      \'norm_subtle': [s:norm_subtle.gui, s:norm_subtle.cterm16],
      \}

let s:p = { 'normal': {}, 'inactive': {}, 'insert': {}, 'replace': {}, 'visual': {}, 'tabline': {} }

" Tabline
let s:p.tabline.left    = [ [ s:lfc.clouds, s:lfc.bg_dark ], [s:lfc.clouds, s:lfc.eclipse] ]
let s:p.tabline.tabsel  = [ [ s:lfc.bg_dark, s:lfc.dark_cyan ] ]
let s:p.tabline.middle  = [ [ s:lfc.clouds, s:lfc.bg_dark ] ]
let s:p.tabline.right   = [ [ s:lfc.bg_dark, s:lfc.dark_cyan ] ]

" Normal mode
let s:p.normal.left     = [ [ s:lfc.bg_dark, s:lfc.cyan ],  [ s:lfc.clouds, s:lfc.eclipse ] ]
let s:p.normal.middle   = [ [ s:lfc.clouds, s:lfc.bg_dark ] ]
let s:p.normal.right    = [ [ s:lfc.bg_dark, s:lfc.cyan ],  [ s:lfc.clouds, s:lfc.eclipse ] ]
let s:p.normal.error    = [ [ s:lfc.red, s:lfc.bg_dark ] ]
let s:p.normal.warning  = [ [ s:lfc.yellow, s:lfc.bg_dark ] ]

" Visual mode
let s:p.visual.left     = [ [ s:lfc.bg_dark, s:lfc.yellow ],  [ s:lfc.bg_dark, s:lfc.dark_yellow ] ]
let s:p.visual.right    = [ [ s:lfc.bg_dark, s:lfc.yellow ],  [ s:lfc.bg_dark, s:lfc.dark_yellow ] ]

" Replace mode
let s:p.replace.left    = [ [ s:lfc.bg_dark, s:lfc.green ],  [ s:lfc.bg_dark, s:lfc.dark_green ] ]
let s:p.replace.right   = [ [ s:lfc.bg_dark, s:lfc.green ],  [ s:lfc.bg_dark, s:lfc.dark_green ] ]

" Insert mode
let s:p.insert.left     = [ [ s:lfc.bg_dark, s:lfc.red ],  [ s:lfc.bg_dark, s:lfc.dark_red ] ]
let s:p.insert.right    = [ [ s:lfc.bg_dark, s:lfc.red ],  [ s:lfc.bg_dark, s:lfc.dark_red ] ]

" Inactive split
let s:p.inactive.left   = [ [ s:lfc.eclipse, s:lfc.bg_dark ], [ s:lfc.eclipse, s:lfc.bg_dark ] ]
let s:p.inactive.middle = [ [ s:lfc.eclipse, s:lfc.bg_dark ] ]
let s:p.inactive.right  = [ [ s:lfc.eclipse, s:lfc.bg_dark ], [ s:lfc.eclipse, s:lfc.bg_dark ] ]

let g:lightline#colorscheme#embark#palette = lightline#colorscheme#flatten(s:p)

