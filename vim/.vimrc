" ---------------------- vi Compatible (~/.exrc) -----------------------
" set autoindent " automatically indent new lines
" set expandtab  " replace tabs with spaces automatically
" set tabstop=2  " number of spaces to replace a tab with when expandtab
" set ignorecase " case when searching
" set autowrite  " automaticcaly write files when changing when multiple files open
" set nonumber   " line numbers
" set ruler      " turn col and row position on in bottom right (see ruf for formatting)
" set showmode   " show command and insert mode
" set noflash    " alpine-ish only
" ----------------------------------------------------------------------

" Designed for Vim 8+

if has("eval") " vim-tiny lacks 'eval'
  let skip_defaults_vim = 1
endif

" General Settings
set nocompatible
let mapleader=" "
set nobackup
set nowritebackup
set noswapfile
set viminfo='20,<1000,s1000
set undodir=~/.local/state/vim/undo
set backupdir=~/.local/state/vim/backup
set directory=~/.local/state/vim/swap
set viminfofile=~/.local/state/vim/info/main.viminfo
set autowrite
filetype indent on
set expandtab
set smarttab
set smartindent
set autoindent
set tabstop=2
set softtabstop=2
set shiftwidth=2
set cinoptions+=:0
set cinoptions+=:0
set ignorecase
set smartcase
set nonumber
set norelativenumber
set signcolumn=number
set ruler
set showmode
set rulerformat=%30(%=%.50F\ [%{strlen(&ft)?&ft:'none'}]\ %l:%c\ %p%%%)
set updatetime=50
set noesckeys
set ttimeout
set ttimeoutlen=0
set fileformat=unix
set encoding=utf-8
set fileencoding=utf-8
set nospell
set textwidth=72 " enough for line numbers + gutter within 80 standard
set noflash
set hidden
set hlsearch
set incsearch
set wrapscan
set spellcapcheck=
set nowrap
set linebreak
set icon
set ttyfast
set history=100
set shortmess=aoOtTI " avoid most 'Hit Enter ...' messages
set wildmenu
set wildoptions=fuzzy
set omnifunc=syntaxcomplete#Complete
set visualbell t_vb=
set showmatch
if v:version >= 800
  set nofixendofline
  set listchars=space:*,trail:*,nbsp:*,extends:>,precedes:<,tab:\|>
  set foldmethod=manual
  set nofoldenable
endif
if $PLATFORM == 'mac' " requires PLATFORM env variable set
  set backspace=indent,eol,start
endif
" set colorcolumn+=1
" if has("eval")
"   " disable bracket matching and folding
"   let g:loaded_matchparen=1
" endif
set noshowmatch

" Formatoptions defaults, changed per filetype by plugins
set formatoptions-=t   " don't auto-wrap text using text width
set formatoptions+=c   " autowrap comments using textwidth with leader
set formatoptions-=r   " don't auto-insert comment leader on enter in insert
set formatoptions-=o   " don't auto-insert comment leader on o/O in normal
set formatoptions+=q   " allow formatting of comments with gq
set formatoptions-=w   " don't use trailing whitespace for paragraphs
set formatoptions-=a   " disable auto-formatting of paragraph changes
set formatoptions-=n   " don't recognized numbered lists
set formatoptions+=j   " delete comment prefix when joining
set formatoptions-=2   " don't use the indent of second paragraph line
set formatoptions-=v   " don't use broken 'vi-compatible auto-wrapping'
set formatoptions-=b   " don't use broken 'vi-compatible auto-wrapping'
set formatoptions+=l   " long lines not broken in insert mode
set formatoptions+=m   " multi-byte character line break support
set formatoptions+=M   " don't add space before or after multi-byte char
set formatoptions-=B   " don't add space between two multi-byte chars
set formatoptions+=1   " don't break a line after a one-letter word

" Highlighting
if exists("syntax_on")
  syntax reset
endif
if has("syntax")
  syntax enable
endif
filetype plugin on
set background=dark
set t_Co=16
set t_md=
highlight DiffAdd ctermfg=0 ctermbg=2
highlight DiffChange ctermfg=0 ctermbg=3
highlight DiffDelete ctermfg=0 ctermbg=1
highlight DiffText ctermfg=0 ctermbg=11 cterm=bold
highlight Visual ctermfg=NONE ctermbg=NONE cterm=inverse
highlight Search ctermfg=0 ctermbg=11
highlight IncSearch ctermfg=0 ctermbg=15 cterm=NONE
highlight IncSearch ctermfg=0 ctermbg=15 cterm=NONE
highlight LineNr ctermfg=8
highlight CursorLineNr ctermfg=7
highlight Comment ctermfg=8
highlight ColorColumn ctermfg=7 ctermbg=8
highlight Folded ctermfg=7 ctermbg=8
highlight FoldColumn ctermfg=7 ctermbg=8
highlight PmenuSel ctermfg=0 ctermbg=15
highlight SpellCap ctermfg=1 ctermbg=NONE
highlight SpellBad ctermfg=1 ctermbg=NONE
highlight SpellRare ctermfg=1 ctermbg=NONE
highlight StatusLine ctermfg=15 ctermbg=8 cterm=bold
highlight StatusLineNC ctermfg=15 ctermbg=8 cterm=NONE
highlight VertSplit ctermfg=7 ctermbg=8 cterm=NONE
highlight SignColumn ctermbg=NONE
highlight Error ctermfg=1 ctermbg=NONE
highlight ErrorMsg ctermfg=1 ctermbg=NONE
highlight Todo ctermfg=11 ctermbg=NONE
highlight WarningMsg ctermfg=2 ctermbg=NONE
highlight Warning ctermfg=2 ctermbg=NONE
highlight MatchParen ctermfg=15 ctermbg=4 cterm=bold
highlight markdownCode ctermfg=6
highlight link markdownCodeDelimiter Comment
highlight link markdownCodeBlock markdownCode
highlight markdownListMarker ctermfg=5
highlight link markdownOrderedListMarker markdownListMarker
highlight link markdownHeadingDelimiter Title
highlight markdownBlockquote ctermfg=8
highlight MarkdownQuote ctermfg=12
highlight markdownItalic ctermfg=12
highlight link markdownItalicDelimiter Comment
highlight markdownBold ctermfg=9
highlight link markdownBoldDelimiter Comment
highlight markdownBoldItalic ctermfg=9
highlight link markdownBoldItalicDelimiter Comment
highlight markdownLinkText ctermfg=2
highlight markdownAutomaticLink ctermfg=10
highlight markdownUrl ctermfg=10
highlight markdownUrlTitle ctermfg=2
highlight markdownUrlDelimiter ctermfg=10
highlight markdownRule ctermfg=15

" Plugin highlights
highlight ALEError ctermfg=1 ctermbg=NONE cterm=NONE
highlight ALEWarning ctermfg=1 ctermbg=NONE cterm=NONE
highlight ALEInfo ctermfg=1 ctermbg=NONE cterm=NONE
highlight ALEStyleError ctermfg=1 ctermbg=NONE cterm=NONE
highlight ALEStyleWarning ctermfg=1 ctermbg=NONE cterm=NONE
highlight ALEVirtualTextError ctermfg=1 ctermbg=NONE cterm=NONE
highlight ALEVirtualTextWarning ctermfg=1 ctermbg=NONE cterm=NONE
highlight ALEVirtualTextInfo ctermfg=1 ctermbg=NONE cterm=NONE
highlight ALEVirtualTextStyleError ctermfg=1 ctermbg=NONE cterm=NONE
highlight ALEVirtualTextStyleWarning ctermfg=1 ctermbg=NONE cterm=NONE

" Color overrides
autocmd FileType markdown,pandoc highlight Title ctermfg=yellow ctermbg=NONE
autocmd FileType markdown,pandoc highlight Operator ctermfg=black ctermbg=NONE
autocmd FileType yaml highlight yamlBlockMappingKey ctermfg=NONE
autocmd FileType markdown,pandoc match MarkdownQuote "^>.*$"
highlight TrailingWhitespace ctermfg=NONE ctermbg=8
match TrailingWhitespace /\s\+$/

" Cursor
" let &t_SI = "\e[3 q"
" let &t_SR = "\e[3 q"
" let &t_EI = "\e[3 q"
" autocmd VimEnter * silent !echo -ne "\e[3 q"

" Plugin Management (github.com/junegunn/vim-plug)
if filereadable(expand("~/.vim/autoload/plug.vim"))
  call plug#begin('~/.local/share/vim/plug')
  Plug 'dense-analysis/ale'
  Plug 'conradirwin/vim-bracketed-paste'
  Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries', 'for': 'go'}
  Plug 'ARM9/arm-syntax-vim'
  " Plug 'jiangmiao/auto-pairs'
  " Plug 'nvie/vim-flake8'
  " Plug 'vim-pandoc/vim-pandoc'
  " Plug 'vim-pandoc/vim-pandoc-syntax'
  call plug#end()

  " ale
  let g:ale_sign_error = 'E'
  let g:ale_sign_warning = 'W'
  let g:ale_echo_msg_error_str = 'E'
  let g:ale_echo_msg_warning_str = 'W'
  let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
  let g:ale_floating_window_border = repeat([''], 8)
  let g:ale_set_signs = 0
  let g:ale_linters = {'python': ['flake8'], 'go': ['golangci-lint', 'gofmt', 'gobuild']}

  " vim-go
  let g:go_fmt_fail_silently = 0
  let g:go_fmt_command = 'goimports'
  let g:go_fmt_autosave = 1
  let g:go_gopls_enabled = 1
  let g:go_highlight_types = 1
  let g:go_highlight_fields = 1
  let g:go_highlight_functions = 1
  let g:go_highlight_function_calls = 1
  let g:go_highlight_operators = 1
  let g:go_highlight_extra_types = 1
  let g:go_highlight_variable_declarations = 1
  let g:go_highlight_variable_assignments = 1
  let g:go_highlight_build_constraints = 1
  let g:go_highlight_diagnostic_errors = 1
  let g:go_highlight_diagnostic_warnings = 1
  let g:go_auto_sameids = 0
  " let g:go_asmfmt_autosave = 1
  " let g:go_auto_type_info = 1 " forces 'Press ENTER' too much
  " let g:go_metalinter_command='golangci-lint'
  " let g:go_metalinter_command='golint'
  " let g:go_metalinter_autosave=1

  " vim-pandoc-syntax
  " let g:pandoc#formatting#mode = 'h' " A'
  " let g:pandoc#formatting#textwidth = 72
else
  autocmd VimLeavePre *.go !gofmt -w %
  " autocmd VimLeavePre *.asm,*arm,*armasm,*s,*S !asmfmt -w %
endif

" Filetype-specific settings
autocmd FileType markdown,pandoc setlocal textwidth=0
autocmd FileType yaml setlocal shiftwidth=2
autocmd FileType sh,bash setlocal shiftwidth=2
autocmd FileType c setlocal shiftwidth=2
autocmd FileType go setlocal shiftwidth=2
autocmd FileType asm setlocal shiftwidth=4
autocmd FileType vim setlocal shiftwidth=2 expandtab
autocmd FileType markdown,pandoc noremap j gj
autocmd FileType markdown,pandoc noremap k gk
autocmd FileType markdown,pandoc noremap 0 g0
autocmd FileType markdown,pandoc noremap $ g$
autocmd FileType markdown,pandoc setlocal wrap
autocmd FileType markdown,pandoc setlocal shiftwidth=2
autocmd FileType markdown,pandoc setlocal conceallevel=2
autocmd FileType markdown,pandoc let g:tex_conceal = 'abdgms'
autocmd FileType sh,bash,go setlocal noexpandtab

" Force some files to be specific file type
" autocmd BufNewFile,BufRead $SNIPPETS/md/* setlocal ft=pandoc
autocmd BufNewFile,BufRead $SNIPPETS/md/* setlocal filetype=markdown
autocmd BufNewFile,BufRead $SNIPPETS/sh/* setlocal filetype=sh
" autocmd BufNewFile,BufRead $SNIPPETS/bash/* setlocal filetype=bash
autocmd BufNewFile,BufRead $SNIPPETS/bash/* setlocal filetype=sh
autocmd BufNewFile,BufRead $SNIPPETS/go/* setlocal filetype=go
autocmd BufNewFile,BufRead $SNIPPETS/c/* setlocal filetype=c
autocmd BufNewFile,BufRead $SNIPPETS/html/* setlocal filetype=html
autocmd BufNewFile,BufRead $SNIPPETS/css/* setlocal filetype=css
autocmd BufNewFile,BufRead $SNIPPETS/js/* setlocal filetype=javascript
autocmd BufNewFile,BufRead $SNIPPETS/python/* setlocal filetype=python
autocmd BufNewFile,BufRead $SNIPPETS/perl/* setlocal filetype=perl
autocmd BufNewFile,BufRead user-data setlocal filetype=yaml
autocmd BufNewFile,BufRead meta-data setlocal filetype=yaml
autocmd BufNewFile,BufRead *.ddl setlocal filetype=sql
autocmd BufNewFile,BufRead keg setlocal filetype=yaml
" autocmd BufNewFile,BufRead *.bash* setlocal filetype=bash
autocmd BufNewFile,BufRead *.bash* setlocal filetype=sh
autocmd BufNewFile,BufRead *.{peg,pegn} setlocal filetype=config
autocmd BufNewFile,BufRead *.gotmpl setlocal filetype=go
autocmd BufNewFile,BufRead *.profile setlocal filetype=sh
autocmd BufNewFile,BufRead *.crontab setlocal filetype=crontab
autocmd BufNewFile,BufRead *ssh/config setlocal filetype=sshconfig
autocmd BufNewFile,BufRead .dockerignore setlocal filetype=gitignore
autocmd BufNewFile,BufRead *.s,*.S setlocal filetype=arm
autocmd BufNewFile,BufRead *gitconfig setlocal filetype=gitconfig
autocmd BufNewFile,BufRead /tmp/psql.edit.* setlocal syntax=sql
autocmd BufNewFile,BufRead *.go setlocal spell spellcapcheck=0
autocmd BufNewFile,BufRead *.c setlocal spell spellcapcheck=0
autocmd BufNewFile,BufRead *.python setlocal spell spellcapcheck=0
autocmd BufNewFile,BufRead *.vhd,vhdl setlocal spell spellcapcheck=0
autocmd BufNewFile,BufRead commands.yaml setlocal spell
autocmd BufNewFile,BufRead *.txt setlocal spell
autocmd BufNewFile,BufRead *.gpg setlocal noswapfile nobackup noundofile viminfo=""
autocmd BufNewFile,BufRead *.passwordstore/* setlocal noswapfile nobackup noundofile viminfo=""
autocmd BufNewFile,BufRead *.password-store/* setlocal noswapfile nobackup noundofile viminfo=""
autocmd BufNewFile,BufRead /tmp/pass* setlocal noswapfile nobackup noundofile viminfo=""
autocmd BufNewFile,BufRead /private/*/pass* setlocal noswapfile nobackup noundofile viminfo=""
autocmd BufNewFile,BufRead /tmp/gopass* setlocal noswapfile nobackup noundofile viminfo=""
autocmd BufNewFile,BufRead /private/*/gopass* setlocal noswapfile nobackup noundofile viminfo=""
autocmd BufNewFile,BufRead /dev/shm/gopass* setlocal noswapfile nobackup noundofile viminfo=""

" fix bork bash detection
if has("eval")
function! s:DetectBash()
  if getline(1) == '#!/bin/bash' || getline(1) == '#!/usr/bin/bash' || getline(1) == '#!/usr/bin/env bash'
    set filetype=bash
    set shiftwidth=2
  endif
endfunction
" autocmd BufNewFile,BufRead * call s:DetectBash()
endif

" force loclist to always close when buffer does (affects vim-go, etc.)
augroup CloseLoclistWindowGroup
  autocmd!
  autocmd QuitPre * if empty(&buftype) | lclose | endif
augroup END

" start at last place you were editing
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g'\"" | endif

" Mappings
autocmd FileType go nmap <leader>m ilog.Print("made")<CR><ESC>
autocmd FileType go nmap <leader>n iif err != nil {return err}<CR><ESC>

" make Y consistent with D and C (yank til end)
map Y y$

inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

cnoremap <C-j> <C-n>
cnoremap <C-k> <C-p>

" disable search highlighting with <C-L> when refreshing screen
nnoremap <C-L> :nohl<CR><C-L>

" displays all the syntax rules for current position
if has("syntax")
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
    echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunction
endif

" functions keys
map <F1> :set number!<CR> :set relativenumber!<CR>
nmap <F2> :call <SID>SynStack()<CR>
set pastetoggle=<F3>
map <F4> :set list!<CR>
map <F5> :set cursorline!<CR>
map <F7> :set spell!<CR>
map <F12> :set foldmethod=indent<CR>
map <F9> :setlocal autoread<CR>:let b:current_file = @%<CR>:w!<CR>:execute '!vsg -f ' . b:current_file ' --fix'<CR><CR>:edit<CR>:setlocal noautoread<CR>

" indent in visual mode
vnoremap < <gv
vnoremap > >gv

" format shell on save
" if has("eval")
" function! s:FormatShell()
"   let l:pos = getcurpos()
"   silent execute '%!shfmt'
"   call setpos('.', l:pos)
" endfunction
" autocmd FileType sh autocmd BufWritePre <buffer> call s:FormatShell()
" endif

" format shell on save
if has("eval")
function! s:FormatShell()
  let l:save = winsaveview()
  let l:tmpfile = tempname()
  let l:current = join(getline(1, '$'), "\n")
  call writefile(split(l:current, "\n"), l:tmpfile)

  let l:cmd = 'shfmt < ' . shellescape(l:tmpfile)
  let l:formatted = system(l:cmd)
  if v:shell_error == 0
    call setline(1, split(l:formatted, "\n"))
  endif

  call winrestview(l:save)
  call delete(l:tmpfile)
endfunction
autocmd FileType sh autocmd BufWritePre <buffer> call s:FormatShell()
endif

" format perl on save (TODO: fix broken stderr)
if has("eval")
function! s:Perltidy()
  let l:pos = getcurpos()
  silent execute '%!perltidy -i=2 -et=2 -l=72 -pt=2 -sbt=2 -bt=2 -bbt=2 -nfpva -nlop -msc=1 -ci=0 -ole=unix -nvc -se -q'
  call setpos('.', l:pos)
endfunction
" autocmd FileType perl autocmd BufWritePre <buffer> call s:Perltidy()
endif

" format assembly on save
if has("eval")
function! s:FormatAsm()
  let l:pos = getcurpos()
  silent execute '%!asmfmt'
  call setpos('.', l:pos)
endfunction
autocmd FileType asm,arm autocmd BufWritePre <buffer> call s:FormatAsm()
endif

" format vhdl on save (when vhdl is updated to take stdin)
if has("eval")
function! s:FormatVhdl()
  let l:pos = getcurpos()
  silent execute '%!vsg --stdin --fix'
  call setpos('.', l:pos)
endfunction
" autocmd FileType vhd,vhdl autocmd BufWritePre <buffer> call s:FormatVhdl()
endif

" fill in empty markdown links with duck.com search
" autocmd BufWritePost *.md silent !toduck %

" fill in :unicode: with unicode
autocmd BufWritePost *.md silent !tounicode %
