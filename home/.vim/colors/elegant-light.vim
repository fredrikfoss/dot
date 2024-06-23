" Vim colorscheme based on Elegant Emacs
" Name: elegant-light
" Maintainer: None
" License: Apache-2.0

" set background=light
" set t_Co=256
" set t_md=^[[1m
" set t_ZH=^[[3m
set termguicolors
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "elegant-light"

" Define basic colors
let s:fg_default = "#333333"
let s:bg_default = "#ffffff"
let s:fg_critical = "#ff6347"
let s:fg_popout = "#ffa07a"
let s:fg_strong = s:fg_default
let s:fg_salient = "#00008b"
let s:fg_faded = "#999999"
let s:bg_subtle = "#f0f0f0"
let s:fg_comment = s:fg_faded

" Helper function to define highlight groups
function! s:HL(group, fg, bg, attr)
  execute 'highlight' a:group 'guifg=' . a:fg 'guibg=' . a:bg 'gui=' . a:attr
endfunction

" Default text
call s:HL('Normal', s:fg_default, s:bg_default, 'NONE')

" Critical, errors, and warnings
call s:HL('ErrorMsg', s:fg_critical, s:bg_default, 'bold')
call s:HL('WarningMsg', s:fg_popout, s:bg_default, 'bold')

" Line numbers, cursor line
call s:HL('CursorLine', 'NONE', s:bg_subtle, 'NONE')
call s:HL('CursorLineNr', s:fg_default, s:bg_subtle, 'bold')
call s:HL('LineNr', s:fg_faded, 'NONE', 'NONE')

" Search highlighting
call s:HL('Search', s:bg_default, s:fg_popout, 'bold')
call s:HL('IncSearch', s:bg_default, s:fg_popout, 'bold,underline')

" Popout for things like matching parentheses
call s:HL('MatchParen', s:bg_default, s:fg_popout, 'bold')

" Strong emphasis for bold text
call s:HL('Bold', s:fg_strong, 'NONE', 'bold')

" Salient for links and similar
call s:HL('Underlined', s:fg_salient, 'NONE', 'underline')

" Faded for comments and inactive text
call s:HL('Comment', s:fg_comment, 'NONE', 'italic')
call s:HL('Conceal', s:fg_faded, 'NONE', 'NONE')

" Subtle for cursor line and similar
call s:HL('Cursor', s:fg_default, s:bg_subtle, 'NONE')

" Define syntax highlighting
call s:HL('String', s:fg_popout, 'NONE', 'NONE')
call s:HL('Function', s:fg_strong, 'NONE', 'bold')
call s:HL('Identifier', s:fg_strong, 'NONE', 'NONE')
call s:HL('Constant', s:fg_salient, 'NONE', 'NONE')
call s:HL('Statement', s:fg_salient, 'NONE', 'bold')
call s:HL('PreProc', s:fg_salient, 'NONE', 'NONE')
call s:HL('Type', s:fg_salient, 'NONE', 'NONE')
call s:HL('Special', s:fg_popout, 'NONE', 'bold')
call s:HL('Todo', s:fg_popout, 'NONE', 'bold,italic')

" Status line
call s:HL('Fold', s:fg_faded, s:bg_subtle, 'NONE')
call s:HL('VertSplit', s:bg_subtle, s:bg_subtle, 'NONE')
call s:HL('StatusLine', s:fg_default, s:bg_subtle, 'bold')
call s:HL('StatusLineNC', s:fg_faded, s:bg_subtle, 'NONE')

" Visual selection
call s:HL('Visual', 'NONE', s:bg_subtle, 'NONE')

" Diff highlighting
call s:HL('DiffAdd', 'NONE', s:fg_salient, 'bold')
call s:HL('DiffChange', 'NONE', s:fg_popout, 'NONE')
call s:HL('DiffDelete', 'NONE', s:fg_faded, 'NONE')
call s:HL('DiffText', 'NONE', s:fg_popout, 'bold')
