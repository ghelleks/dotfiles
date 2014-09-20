" INSTALLATION
" $ mkdir -p ~/.vim/tmp
" $ mkdir -p ~/.vim/backup
" $ mkdir -p ~/.vim/swap
" $ git clone https://github.com/altercation/vim-colors-solarized.git ~/.vim/bundle/vim-colors-solarized
" $ git clone https://github.com/bling/vim-airline.git ~/.vim/bundle/vim-airline
" then install https://github.com/Lokaltog/powerline-fonts

call pathogen#infect()
call pathogen#helptags()

" use my aliases
" set shell=/bin/bash\ --rcfile\ ~/.bash_profile\ -i
set ruler

set tags=.git/tags;

set nocompatible                      " just in case system-wide vimrc has set this otherwise
set backupdir=~/.vim/tmp/backup,.     " keep backup files out of the way
set directory=~/.vim/tmp/swap,.       " keep swap files out of the way
set hlsearch                          " highlight search strings
set incsearch                         " incremental search ("find as you type")
set ignorecase                        " ignore case when searching
set smartcase                         " except when search string includes a capital letter
set number                            " show line numbers in gutter
set laststatus=2                      " always show status line
set ww=h,l,<,>,[,]                    " allow h/l/left/right to cross line boundaries
set autoread                          " if not changed in Vim, automatically pick up changes after "git co" etc
set hidden                            " allows you to hide buffers with unsaved changes without being prompted
set wildmenu                          " show options as list when switching buffers etc
set history=1000                      " longer search and command history (default is 20)
set scrolloff=3                       " start scrolling 3 lines before edge of viewport
set cursorline                        " highlight current line
set showmatch                         " show matching brackets
set showcmd                           " extra info in command line
set nojoinspaces                      " don't autoinsert two spaces after '.', '?', '!' for join command
set wildignore+=*.o                   " patterns to ignore during file-navigation
if exists("+autochdir")
  set noautochdir                       " don't automatically change the working directory, because that's crazy-making
endif

command Trim %s/\s\+$//

" statusline
" cf the default statusline: %<%f\ %h%m%r%=%-14.(%l,%c%V%)\ %P
" format markers:
"   %< truncation point
"   %n buffer number
"   %f relative path to file
"   %m modified flag [+] (modified), [-] (unmodifiable) or nothing
"   %r readonly flag [RO]
"   %y filetype [ruby]
"   %= split point for left and right justification
"   %-35. width specification
"   %l current line number
"   %L number of lines in buffer
"   %c current column number
"   %V current virtual column number (-n), if different from %c
"   %P percentage through buffer
"   %) end of width specification
set statusline=%<\ %n:\ %1*\ %{fugitive#head(6)}\ %0*\ %f\ %m%r%y%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1


" all languages
set shiftwidth=2                  " spaces per tab (when shifting)
set shiftround                    " always indent by multiple of shiftwidth
set tabstop=2                     " spaces per tab
set expandtab                     " always use spaces instead of tabs
set smarttab                      " <tab>
set list                          " show whitespace
set listchars=nbsp:¬,tab:>-,extends:»,precedes:«,trail:•,eol:$
set noautoindent
set textwidth=0

" Quickfix listing
autocmd BufReadPost quickfix setlocal so=0 | setlocal nolist

" automatic, language-dependent indentation, syntax coloring and other
" functionality
filetype indent plugin on
syntax on
autocmd BufNewFile,BufReadPost *.ino set syntax=cpp " arduino
autocmd BufNewFile,BufReadPost *.md  set filetype=markdown

" for markdown, we want word wrapping and stuff. for code, we don't
if &ft == "markdown"
  set textwidth=78
  set formatoptions+=t
endif

" colorscheme
color solarized
set background=light
let g:solarized_termcolors=256
let g:solarized_visibility = 'low'
highlight MatchParen   cterm=bold      ctermfg=226
highlight Pmenu                                      ctermbg=8
highlight PmenuSel     cterm=bold      ctermfg=10    ctermbg=4
highlight PmenuThumb                   ctermfg=6
highlight Search       cterm=none      ctermfg=0     ctermbg=3
highlight StatusLine   cterm=none      ctermfg=0     ctermbg=3
highlight StatusLineNC cterm=none      ctermfg=7     ctermbg=4
highlight ToDo         cterm=underline ctermfg=3     ctermbg=none
highlight LineNr                       ctermfg=238
highlight VertSplit    cterm=none      ctermfg=4     ctermbg=4
highlight OverLength ctermbg=darkred ctermfg=white guibg=#FFD9D9
match OverLength /\%81v.*/

" Command-T
let g:CommandTMatchWindowReverse   = 1
let g:CommandTMaxHeight            = 10
let g:CommandTMaxFiles             = 50000
let g:CommandTMaxCachedDirectories = 10
let g:CommandTScanDotDirectories   = 1
map <leader>r :CommandTFlush<CR>
map <leader>f :CommandTBuffer<CR>
if &term =~ "screen" || &term =~ "xterm"
  let g:CommandTCancelMap     = ['<ESC>', '<C-c>']
  let g:CommandTSelectNextMap = ['<C-n>', '<C-j>', '<ESC>OB']
  let g:CommandTSelectPrevMap = ['<C-p>', '<C-k>', '<ESC>OA']
endif
"let g:CommandTAcceptSelectionMap = '<C-t>'
"let g:CommandTAcceptSelectionTabMap = '<CR>'
set wildignore+=vendor/rails/**,vendor/gems/**

" set up :Ack command as replacement for :grep
function! AckGrep(command)
  cexpr system("ack-grep " . a:command)
  cw " show quickfix window already
endfunction
command! -nargs=+ -complete=file Ack call AckGrep(<q-args>)
map <leader>a :Ack<space>
map <leader>g :Ack<space><C-r><C-w>

function! s:ToggleVisibility()
  if g:solarized_visibility != 'high'
    let g:solarized_visibility = 'high'
  else
    let g:solarized_visibility = 'low'
  endif
  color solarized
endfunction
map <leader>w :call <SID>ToggleVisibility()<CR>

" Normal mode mappings
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-kPlus> <C-w>+
nnoremap <C-kMinus> <C-w>-
nnoremap <silent> <leader>j :call SwapWithNext()<CR>
nnoremap <silent> <leader>k :call SwapWithPrevious()<CR>

" Tab through buffers 
map <Tab> :bn<CR>
map <S-Tab> :bp<CR>

" move increment/decrement so we can rebind them below
nnoremap <C-j> <C-a>
nnoremap <C-k> <C-x>

map <C-x> :bd<CR>
nmap <C-a> ^
nmap <C-e> $
imap <C-a> <C-o>^
imap <C-e> <C-o>$
map <C-c> :tabclose<CR>
map <C-s> :w<CR>

" Convert ruby hash rockets to 1.9 syntax
nmap <leader>rh :%s/\v(:)@<!:([a-zA-Z_][a-zA-Z_0-9]*)(\s*)\=\>\s?/\2:\3/gc<cr>

nmap <leader>c :'<,'>Align
map <leader>m :'<,'>Align

set backspace=2

autocmd WinEnter * setlocal cursorline
autocmd WinLeave * setlocal nocursorline

" disable arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" re-wrap paragraphs with \q
nnoremap <leader>q gq}

" go !
" Some Linux distributions set filetype in /etc/vimrc.
" Clear filetype flags before changing runtimepath to force Vim to reload them.
filetype off
filetype plugin indent off
set runtimepath+=/usr/local/go/misc/vim
filetype plugin indent on
syntax on

" this needs to be set here, for some reason
if version >= 730
  set rnu " relative line numbers
endif

" rather than create duplicate buffers, tell Command-T to jump to the one we already have open
"set switchbuf=usetab
function! s:GotoOrOpen(command, ...)
  for file in a:000
    if bufwinnr(file) != -1
      exec "sb " . file
    else
      exec a:command . " " . file
    endif
  endfor
endfunction

command! -nargs=+ GotoOrOpen call s:GotoOrOpen(<f-args>)

let g:CommandTAcceptSelectionCommand = 'GotoOrOpen e'
let g:CommandTAcceptSelectionTabCommand = 'GotoOrOpen tabe'
let g:CommandTAcceptSelectionSplitCommand = 'GotoOrOpen sp'
let g:CommandTAcceptSelectionVSplitCommand = 'GotoOrOpen vs'
