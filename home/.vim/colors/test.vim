" Vim colorscheme based on Emacs clippings
" Name: test

" set background=light
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "vim-elegance-light"

" General colors
let s:bg = "#ffffff"
let s:fg = "#333333"
let s:critical_bg = "#ff6347"
let s:critical_fg = "#ffffff"
let s:popout_fg = "#ffa07a"
let s:strong_fg = s:fg
let s:salient_fg = "#00008b"
let s:faded_fg = "#999999"
let s:subtle_bg = "#f0f0f0"

" Helper function to define highlight groups
function! s:HL(group, fg, bg, attr)
  execute 'highlight' a:group 'guifg=' . a:fg 'guibg=' . a:bg 'gui=' . a:attr
endfunction

" Default text
call s:HL('Normal', s:fg, s:bg, 'NONE')

" Critical, errors, warnings
call s:HL('ErrorMsg', s:critical_fg, s:critical_bg, 'bold')
call s:HL('WarningMsg', s:popout_fg, s:bg, 'bold')
call s:HL('Todo', s:critical_fg, s:critical_bg, 'bold,reverse')

" Popout, strong, salient, faded, and subtle
call s:HL('Statement', s:popout_fg, s:bg, 'bold')
call s:HL('PreProc', s:strong_fg, s:bg, 'bold')
call s:HL('Type', s:salient_fg, s:bg, 'bold')
call s:HL('Comment', s:faded_fg, s:bg, 'italic')
call s:HL('Special', s:salient_fg, s:bg, 'bold')
call s:HL('Visual', s:fg, s:subtle_bg, 'reverse')

" Search and matching
call s:HL('Search', s:bg, s:popout_fg, 'bold,reverse')
call s:HL('IncSearch', s:bg, s:popout_fg, 'bold,reverse')
call s:HL('MatchParen', s:fg, s:popout_fg, 'bold')

" Line numbers, cursor, and modeline
call s:HL('Cursor', s:fg, s:bg, 'reverse')
call s:HL('CursorLine', s:fg, s:subtle_bg, 'NONE')
call s:HL('CursorColumn', s:fg, s:subtle_bg, 'NONE')
call s:HL('LineNr', s:faded_fg, s:bg, 'NONE')
call s:HL('Fold', s:faded_fg, s:subtle_bg, 'NONE')
call s:HL('VertSplit', s:subtle_bg, s:subtle_bg, 'NONE')
call s:HL('StatusLine', s:strong_fg, s:subtle_bg, 'bold')
call s:HL('StatusLineNC', s:faded_fg, s:subtle_bg, 'NONE')

" Syntax highlighting
call s:HL('Constant', s:salient_fg, s:bg, 'NONE')
call s:HL('String', s:popout_fg, s:bg, 'NONE')
call s:HL('Function', s:strong_fg, s:bg, 'bold')
call s:HL('Identifier', s:strong_fg, s:bg, 'NONE')
call s:HL('Keyword', s:salient_fg, s:bg, 'bold')

" More highlight groups can be defined following the same pattern...

" Set colors for the GUI
if has('gui_running')
  set guifg=s:fg guibg=s:bg
endif
