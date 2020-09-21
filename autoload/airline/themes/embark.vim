scriptencoding utf-8
let g:airline#themes#embark#palette = {}

" Airline sections are as follows:
"_______________________________________________________________
"| a | b |     c               x     | y | z | warning | error |
"¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯¯

" airline_a (left most section)
" airline_b (section just to the right of airline_a)
" airline_c (section just to the right of airline_b)
" airline_x (first section of the right most sections)
" airline_y (section just to the right of airline_x)
" airline_z (right most section with no warnings or errors)
" airline_warning (warning section)
" airline_error (error section)

" values in the arrays are as follows:
" [guifg, guibg, ctermfg, ctermbg, opts]

" 'opts' can be any of the following: 
" bold, underline, undercurl, reverse, inverse, italic, standout, strikethrough, NONE

"----------------- NORMAL MODE ----------------------------

let g:airline#themes#embark#palette.normal = {
      \  'airline_a':       [ '#100e23' , '#aaffe4' , 232  , 122 ],
      \  'airline_b':       [ '#100e23' , '#63f2f1' , 232  , 121 ],
      \  'airline_c':       [ '#ffffff' , '#100e23' , 255  , 232 ],
      \  'airline_x':       [ '#63f2f1' , '#100e23' , 255  , 232 ],
      \  'airline_y':       [ '#100e23' , '#63f2f1' , 232  , 121 ],
      \  'airline_z':       [ '#100e23' , '#aaffe4' , 232  , 122 ],
      \  'airline_warning': [ '#100e23' , '#F48FB1' , 232  , 204 ],
      \  'airline_error':   [ '#100e23' , '#ff5458' , 232  , 203 ],
      \ }

let g:airline#themes#embark#palette.normal_modified = {
      \  'airline_c':       [ '#F48FB1' , '#100e23' , 204  , 232 , '' ],
      \  'airline_warning': [ '#100e23' , '#F48FB1' , 232  , 204 ],
      \  'airline_error':   [ '#100e23' , '#ff5458' , 232  , 203 ],
      \ }

"----------------- INSERT MODE ----------------------------

let g:airline#themes#embark#palette.insert = {
      \  'airline_a':       [ '#100e23' , '#F48FB1' , 232  , 204 ],
      \  'airline_b':       [ '#100e23' , '#ff5458' , 232  , 203 ],
      \  'airline_c':       [ '#ffffff' , '#100e23' , 255  , 232 ],
      \  'airline_x':       [ '#ff5458' , '#100e23' , 255  , 232 ],
      \  'airline_y':       [ '#100e23' , '#ff5458' , 232  , 203 ],
      \  'airline_z':       [ '#100e23' , '#F48FB1' , 232  , 204 ],
      \  'airline_warning': [ '#ffffff' , '#ff5458' , 255  , 203 ],
      \  'airline_error':   [ '#ffffff' , '#af0000' , 255  , 124 ],
      \ }

let g:airline#themes#embark#palette.insert_modified = {
      \  'airline_c':       [ '#F48FB1' , '#100e23' , 204  , 232 , '' ],
      \  'airline_warning': [ '#100e23' , '#ff5458' , 232  , 203 ],
      \  'airline_error':   [ '#ffffff' , '#af0000' , 232  , 124 ],
      \ }

let g:airline#themes#embark#palette.insert_paste = {
      \ 'airline_a':        [ '#100e23' , '#ffe9aa' , 232  , 228 , '' ]
      \ }

"----------------- VISUAL MODE ----------------------------

let g:airline#themes#embark#palette.visual= {
      \  'airline_a':       [ '#100e23' , '#ffe9aa' , 232  , 228 ],
      \  'airline_b':       [ '#100e23' , '#ffb378' , 232  , 215 ],
      \  'airline_c':       [ '#ffffff' , '#100e23' , 255  , 232 ],
      \  'airline_x':       [ '#ffb378' , '#100e23' , 255  , 232 ],
      \  'airline_y':       [ '#100e23' , '#ffb378' , 232  , 215 ],
      \  'airline_z':       [ '#100e23' , '#ffe9aa' , 232  , 228 ],
      \  'airline_warning': [ '#100e23' , '#F48FB1' , 232  , 204 ],
      \  'airline_error':   [ '#100e23' , '#ff5458' , 232  , 203 ],
      \ }

let g:airline#themes#embark#palette.visual_modified = {
      \  'airline_c':       [ '#F48FB1' , '#100e23' , 204  , 232 , '' ],
      \  'airline_warning': [ '#100e23' , '#F48FB1' , 232  , 204 ],
      \  'airline_error':   [ '#100e23' , '#ff5458' , 232  , 203 ],
      \ }

"----------------- COMMANDLINE MODE -----------------------

let g:airline#themes#embark#palette.commandline = {
      \  'airline_a':       [ '#100e23' , '#c991e1' , 232  , 141 ],
      \  'airline_b':       [ '#100e23' , '#906cff' , 232  , 135 ],
      \  'airline_c':       [ '#ffffff' , '#100e23' , 255  , 232 ],
      \  'airline_x':       [ '#906cff' , '#100e23' , 255  , 232 ],
      \  'airline_y':       [ '#100e23' , '#906cff' , 232  , 135 ],
      \  'airline_z':       [ '#100e23' , '#c991e1' , 232  , 141 ],
      \  'airline_warning': [ '#100e23' , '#F48FB1' , 232  , 204 ],
      \  'airline_error':   [ '#100e23' , '#ff5458' , 232  , 203 ],
      \ }


let g:airline#themes#embark#palette.commandline_modified = {
      \  'airline_c':       [ '#F48FB1' , '#100e23' , 204  , 232 , '' ],
      \  'airline_warning': [ '#100e23' , '#F48FB1' , 232  , 204 ],
      \  'airline_error':   [ '#100e23' , '#ff5458' , 232  , 203 ],
      \ }

"----------------- TERMINAL MODE --------------------------

let g:airline#themes#embark#palette.terminal = {
      \  'airline_a':       [ '#100e23' , '#91ddff' , 232  , 159 ],
      \  'airline_b':       [ '#100e23' , '#65b2ff' , 232  ,  75 ],
      \  'airline_c':       [ '#ffffff' , '#100e23' , 255  , 232 ],
      \  'airline_x':       [ '#65b2ff' , '#100e23' , 255  , 232 ],
      \  'airline_y':       [ '#100e23' , '#65b2ff' , 232  ,  75 ],
      \  'airline_z':       [ '#100e23' , '#91ddff' , 232  , 159 ],
      \  'airline_warning': [ '#100e23' , '#F48FB1' , 232  , 204 ],
      \  'airline_error':   [ '#100e23' , '#ff5458' , 232  , 203 ],
      \ }

"----------------- REPLACE MODE ---------------------------

let g:airline#themes#embark#palette.replace = {
      \  'airline_a':       [ '#100e23' , '#A1EFD3' , 232  , 204 ],
      \  'airline_b':       [ '#100e23' , '#62d196' , 232  , 203 ],
      \  'airline_c':       [ '#ffffff' , '#100e23' , 255  , 232 ],
      \  'airline_x':       [ '#62d196' , '#100e23' , 255  , 232 ],
      \  'airline_y':       [ '#100e23' , '#62d196' , 232  , 203 ],
      \  'airline_z':       [ '#100e23' , '#A1EFD3' , 232  , 204 ],
      \  'airline_warning': [ '#ffffff' , '#F48FB1' , 255  , 203 ],
      \  'airline_error':   [ '#ffffff' , '#ff5458' , 255  , 124 ],
      \ }

let g:airline#themes#embark#palette.replace_modified = {
      \  'airline_c':       [ '#F48FB1' , '#100e23' , 204  , 232 , '' ],
      \  'airline_warning': [ '#100e23' , '#F48FB1' , 232  , 204],
      \  'airline_error':   [ '#ffffff' , '#ff5458' , 232  , 203],
      \ }

"------------------ INACTIVE (MODE) -----------------------

let g:airline#themes#embark#palette.inactive= {
      \  'airline_a':       [ '#3E3859' , '#100e23' , 236  , 232 ],
      \  'airline_b':       [ '#100e23' , '#3E3859' , 232  , 236 ],
      \  'airline_c':       [ '#3E3859' , '#100e23' , 236  , 232 ],
      \  'airline_x':       [ '#3E3859' , '#100e23' , 236  , 232 ],
      \  'airline_y':       [ '#100e23' , '#3E3859' , 232  , 236 ],
      \  'airline_z':       [ '#3E3859' , '#100e23' , 236  , 232 ],
      \  'airline_warning': [ '#100e23' , '#F48FB1' , 232  , 204 ],
      \  'airline_error':   [ '#100e23' , '#ff5458' , 232  , 203 ],
      \ }

let g:airline#themes#embark#palette.inactive_modified= {
      \  'airline_c':       [ '#3E3859' , ''        , 236  , ''  , '' ],
      \  'airline_warning': [ '#100e23' , '#F48FB1' , 232  , 204 ],
      \  'airline_error':   [ '#100e23' , '#ff5458' , 232  , 203 ],
      \ }

"------------------ TABLINE -------------------------------

let g:airline#themes#embark#palette.tabline = { 
      \ 'airline_tablabel':           [ '#100e23' , '#63f2f1' , 232 , 121 , 'bold'],
      \ 'airline_tab':                [ '#ffffff' , '#100e23' , 255 , 232 ,     ''],
      \ 'airline_tabsel':             [ '#100e23' , '#aaffe4' , 232 , 122 ,     ''],
      \ 'airline_tabtype':            [ '#100e23' , '#906cff' , 232 , 135 ,     ''],
      \ 'airline_tabfill':            [ '#ffffff' , '#100e23' , 255 , 232 ,     ''],
      \ 'airline_tabmod':             [ '#100e23' , '#F48FB1' , 232 , 204 ,     ''],
      \ 'airline_tabmod_unsel':       [ '#F48FB1' , '#100e23' , 204 , 232 ,     ''],
      \ 'airline_tabhid':             [ '#ffffff' , '#100e23' , 255 , 232 ,     ''],
      \ 'airline_tablabel_right':     [ '#100e23' , '#63f2f1' , 232 , 121 , 'bold'],
      \ 'airline_tab_right':          [ '#ffffff' , '#3E3859' , 255 , 232 ,     ''],
      \ 'airline_tabsel_right':       [ '#100e23' , '#aaffe4' , 232 , 122 ,     ''],
      \ 'airline_tabmod_right':       [ '#100e23' , '#F48FB1' , 232 , 204 ,     ''],
      \ 'airline_tabmod_unsel_right': [ '#F48FB1' , '#100e23' , 204 , 232 ,     ''],
      \ 'airline_tabhid_right':       [ '#ffffff' , '#100e23' , 255 , 232 ,     ''],
      \ }

"------------------ ACCENT ----------------------------------

let g:airline#themes#embark#palette.accents = {
      \ 'red': [ '#ff0000' , '' , 160 , ''  ]
      \ }
