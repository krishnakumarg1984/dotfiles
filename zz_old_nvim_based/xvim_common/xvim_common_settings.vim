set noexrc
filetype plugin indent on
if !has('g:syntax_on')|syntax enable|endif


" set clipboard+=unnamedplus
" set foldopen=block,hor,insert,jump,mark,percent,quickfix,search,tag,undo
set copyindent          " copy the previous indentation on autoindenting
set preserveindent
set autoread                        " Autoread when a file is changed from outside
set backspace=indent,eol,start
set belloff=all
set cmdheight=2                 " Height of command-line (easy-readable)
set complete=.,w,b,u,t,i,kspell ". till i is the default. . = current buffer. w  = any other windows, b = any other buffers opened, u = unopened buffers, t = tags, i = current and included files
set complete+=U,s,k,d,]
set completeopt+=longest,menu,menuone,noselect,preview
set completeopt+=noinsert
set cpoptions+=J
set diffopt=filler,foldcolumn:0,context:4
set display+=lastline
set fileformat=unix          " Default fileformat
set fileformats=unix,dos,mac
set fillchars=vert:│,fold:\ ,diff:⣿
set isfname-={,}
set foldenable
" set foldcolumn=4
set foldlevelstart=99
set formatoptions+=ronl1j
set formatlistpat+=\\\|^\\s*(\\(\\d\\+\\\|[a-z]\\))\\s\\+
set formatlistpat+=\\\|^\\s*\\(\\d\\+\\\|[a-z]\\)[:).]\\s\\+
set formatlistpat=^\\s*[-*]\\s\\+
set helpheight=12
set hidden
set history=100            "make history remember 100 :-commands and searches
set hlsearch
set ignorecase  " Ignore case search for normal letters
set incsearch
set infercase   " Ignore case on insert completion
set isfname-={,}
set keywordprg=:help
set laststatus=2
set lazyredraw
set linespace=0                 " No extra spaces between rows
set listchars=tab:▸\
set magic                       " Make regex a little easier to type
set nojoinspaces
set nolist
set noshowmode                    " Display the current mode
set nostartofline               " The cursor is kept in the same column (if possible)
set nrformats-=octal
set number
set numberwidth=5               " Width of the line-no. column
" set path=.,**
set path=$PWD/**
" set path+=**
set previewheight=20
set pumheight=15                " Set popup menu max height
set relativenumber
set report=0                    " Threshold for reporting number of lines changed.
set scrolljump=5       " How many lines to scroll at a time, make scrolling appears faster (i.e. when you move the cursor close to the vertical limits of display, how many more lines to reveal ?)
set scrolloff=3        " Minimal number of screen lines to keep above and below the cursor
set shortmess=aoOtT
set showbreak=…
set showmatch
set smartcase
set matchtime=2
set sidescroll=3       " The minimal number of columns to scroll horizontally
set sidescrolloff=5    " The minimal number of screen columns to keep to the left and to the right of the cursor
set smartcase   " Do case-sensitive search if pattern contains upper case letters
set splitbelow                  " Splitting a window will put the new window below the current one
set splitright                  " Splitting a window will put the new windowright the current one
set suffixesadd=.py,.m,.mat,.gv,.tex      "Find will work harder for these filetypes
set synmaxcol=300   "Boost performance in rendering long lines
set tabpagemax=15      " Maximum number of tab pages to be opened by the |-p| command line argument or the ":tab all" command. |tabpage|
set tags=tags;,.tags;
set timeout       " time out on mappings and keycodes (stronger of the two conditions)
set timeoutlen=1000
set title
set titleold="Terminal"
set ttimeoutlen=0 " A non-negative number here will make the delay to be timeoutlen
set ttyfast
set undofile
set updatecount=0               " After typing this many characters the swap file will be written to disk.  When zero, no swap file will be created at all (see chapter on recovery |crash-recovery|).  "
set updatetime=250              " milliseconds elapsed before which swap file will be written to disk (250 ms is recommende by gitgutter plugin)
set viewoptions=cursor,folds,slash,unix
set wildchar=<TAB> " Character for CLI expansion (TAB-completion)
set wildmenu
set wildmode=longest,list:full
" set winminheight=4              " Windows can be 0 line high
set virtualedit=block
silent! set shortmess+=F
silent! set shortmess+=cI

" Ignore the following stuff when tab completing
set wildignore+=.hg,.git,*.jpeg,*.gif,*.bmp,*.pdf,*.class,*.dmg,*.DS_Store,*.lnk,*.ini,*.mod
set wildignore+=*/tmp/*,*.so,*.db,*.sqlite
set wildignore+=*.pyc,*.a,*.dll,*.bak,*.exe,*.jpg,*.png

" Disable output and VCS files
set wildignore+=*.o,*.out,*.rbc,*.rbo,*.gem,CVS/*

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore build dir
set wildignore+=build/*,media/*

" Ignore node modules
set wildignore+=node_modules/*,bower_components/*

" Disable temp and backup files
set wildignore+=*.swp,*~,._*
set wildignore+=.svn,*.obj,*.luac,*.dats,__pycache__
set wildignore+=types_*taghl,tags

if has('linebreak')
    set linebreak               " Wrap lines at convenient point (only affects the on-screen display, not actual content in file)
    let &showbreak='↪ '
    set breakat=\ \ ;:,!?
    if exists('+breakindent')
        silent! set breakindent
    endif
endif

set t_ZH=[3m
set t_ZR=[23m

highlight clear SignColumn      " SignColumn should match background,SignColumn column where |signs| are displayed
highlight Comment cterm=italic

hi link HelpBar Normal
hi link HelpStar Normal

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

autocmd InsertEnter * :set norelativenumber
autocmd InsertLeave * :set relativenumber

if has('cmdline_info')
    set ruler                   " Show the ruler
    set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
    set showcmd
endif


" Vim needs a more POSIX compatible shell than fish for certain functionality
" to work, such as :%!, compressed help pages and many third-party addons.  If
" you use fish as your login shell or launch Vim from fish, you need to set
" shell to something else in your ~/.vimrc.
" Seriously... god dammit Vim.
if &shell =~# 'fish$'
    set shell=/usr/bin/sh
endif

" " Only show cursorline in the current window and in normal mode.
" augroup cline
"     autocmd!
"     autocmd WinLeave,InsertEnter * setlocal nocursorline
"     autocmd WinEnter,InsertLeave * setlocal cursorline
" augroup END

augroup completedone
    autocmd!
    autocmd CompleteDone * silent! pclose!
augroup END

highlight OverLength ctermfg=0 ctermbg=3
match OverLength /\%121v/


" if (has("termguicolors"))|| has('termguicolors')
"     " set Vim-specific sequences for RGB colors
"     let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"     let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"     set termguicolors
" else
"     set t_Co=256
" endif

set t_Co=256
" set termguicolors

" let ayucolor="dark"
set background=dark

" colorscheme alduin
" colorscheme badwolf
" colorscheme challenger_deep
" colorscheme dracula
" colorscheme gruvbox
" colorscheme lucius
" colorscheme meta5
" colorscheme minimalist
" colorscheme molokai_dark
" colorscheme onedark
" colorscheme palenight
" colorscheme Papercolor
" colorscheme railscasts
" colorscheme tender
colorscheme hybrid_material

" nnoremap gqip mmgqip`m
" Convert line to "Title Case" (capitalize first letter of each word)
" nnoremap <leader>,t :silent s/\<\(\w\)\(\S*\)/\u\1\L\2/g<cr>

nnoremap <Leader>x /\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgn
nnoremap <Leader>X ?\<<C-R>=expand('<cword>')<CR>\>\C<CR>``cgN

nnoremap J      mzJ`z
nnoremap dp     dp]c
nnoremap do     do]c
nnoremap '      `

nnoremap <leader>q gqip
nnoremap : ;
nnoremap ; :
nnoremap Y y$

nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

nnoremap & :&&<Enter>
xnoremap & :&&<Enter>

nnoremap <Space> za

" Use sane regexes
nnoremap / /\v
vnoremap / /\v
nnoremap ? ?\v
vnoremap ? ?\v

" Move across wrapped lines like regular lines
noremap 0 ^
" Go to the first non-blank character of a line
noremap ^ 0
" Just in case you need to go to the very beginning of a line

cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Visual line repeat
xnoremap . :normal .<CR>
xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

function! ExecuteMacroOverVisualRange()
    echo '@'.getcmdline()
    execute ":'<,'>normal @".nr2char(getchar())
endfunction

:map k gk
:map j gj
:map <Up> gk
:map <Down> gj

nnoremap <expr> j v:count ? 'j' : 'gj'
nnoremap <expr> k v:count ? 'k' : 'gk'
nnoremap gV     `[V`]

cnoremap <c-n>  <down>
cnoremap <c-p> <up>

:noremap <Leader>f :filetype detect<CR>

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv
xnoremap > >gv
xnoremap < <gvoremap w!! w !sudo tee > /dev/null %

vnoremap y myy`y
vnoremap Y myY`y

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

inoremap <c-c> <ESC>

"" Close buffer
noremap <leader>c :bd<CR>

" nmap <leader>l :set list!<CR>

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
" nnoremap n nzzzv
" nnoremap N Nzzzv

"" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

" Disable some mappings
noremap  <f1>   <nop>
inoremap <f1>   <nop>
nnoremap Q      <nop>

" Navigate folds
nnoremap          zf zMzvzz
nnoremap <silent> zj :silent! normal! zc<cr>zjzvzz
nnoremap <silent> zk :silent! normal! zc<cr>zkzvzz[z
"
" " Backspace and return for improved navigation
" nnoremap        <bs> <c-o>zvzz
" nnoremap <expr> <cr> empty(&buftype) ? '<c-]>zvzz' : '<cr>'


"" Abbreviations
"*****************************************************************************
"" no one is really happy until you have this shortcuts
" cnoreabbrev W! w!
" cnoreabbrev Q! q!
" cnoreabbrev Qall! qall!
" cnoreabbrev Wq wq
" cnoreabbrev Wa wa
" cnoreabbrev wQ wq
" cnoreabbrev WQ wq
" cnoreabbrev W w
" cnoreabbrev Q q
" cnoreabbrev Qall qall
cnoreabbrev <expr> w getcmdtype() == ":" && getcmdline() == 'w' ? 'up' : 'w'

source ~/ft_settings.vim

augroup disableTempUndo
    autocmd!
    autocmd BufWritePre /tmp/* setlocal noundofile
augroup END

let g:netrw_liststyle=3 " Use tree-mode as default view
let g:netrw_browse_split=4 " Open file in previous buffer
let g:netrw_preview=1 " preview window shown in a vertically split
let g:netrw_winsize=20
let g:netrw_sort_options = 'i'
let g:netrw_sort_sequence = '[\/]$,*'
let g:netrw_keepdir=0
let g:netrw_list_hide='\.un\~$'
let g:netrw_banner       = 0
let g:netrw_keepdir      = 0

command! -nargs=* Wrap set wrap linebreak nolist

" autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

if exists('$TMUX')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    " " let &t_SI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=1\x7\<Esc>\\"
    " " let &t_EI = "\<Esc>Ptmux;\<Esc>\<Esc>]50;CursorShape=0\x7\<Esc>\\"
    let &t_SI = "\<Esc>Ptmux;\<Esc>\e[6 q\<Esc>\e]12;3\x7\<Esc>\\"
    let &t_EI = "\<Esc>Ptmux;\<Esc>\e[2 q\<Esc>\e]12;14\x7\<Esc>\\"
else
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"
    let &t_SI = "\e[6 q\e]12;3\x7"
    let &t_EI = "\e[2 q\e]12;14\x7"
    " silent !echo -ne "\e[2 q\e]12;14\x7"
endif

augroup FileChangedAlert
    " Helps if you have to use another editor on the same file
    autocmd! FileChangedShell * echoerr "File has been changed outside of Vim."
augroup END


augroup reload_vimrc
    autocmd!
    autocmd! BufWritePost $MYVIMRC,$MYGVIMRC nested source %
    au FocusLost * :wa
augroup END


"" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstart
    autocmd!
    autocmd BufEnter * :syntax sync maxlines=200
augroup END

"" Remember cursor position
augroup vimrc-remember-cursor-position
    autocmd!
    autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" " Set a nicer foldtext function
" function! NeatFoldText()
"     let line = ' ' . substitute(getline(v:foldstart), '^\s*"\?\s*\|\s*"\?\s*{{' . '{\d*\s*', '', 'g') . ' '
"     let lines_count = v:foldend - v:foldstart + 1
"     let lines_count_text = '| ' . printf("%10s", lines_count . ' lines') . ' |'
"     let foldchar = matchstr(&fillchars, 'fold:\zs.')
"     let foldtextstart = strpart('+' . repeat(foldchar, v:foldlevel*2) . line, 0, (winwidth(0)*2)/3)
"     let foldtextend = lines_count_text . repeat(foldchar, 8)
"     let foldtextlength = strlen(substitute(foldtextstart . foldtextend, '.', 'x', 'g')) + &foldcolumn
"     return foldtextstart . repeat(foldchar, winwidth(0)-foldtextlength) . foldtextend
" endfunction

" set foldtext=NeatFoldText()

  " highlight FoldColumn  gui=bold    guifg=grey65     guibg=Grey90
" highlight Folded      gui=italic  guifg=Black      guibg=Grey90
" highlight LineNr      gui=NONE    guifg=grey60     guibg=Grey90

" Disable a lot of unnecessary internal plugins
" let g:loaded_2html_plugin = 1
let g:loaded_getscriptPlugin = 1
let g:loaded_gzip = 1
let g:loaded_logipat = 1
let g:loaded_rrhelper = 1
let g:loaded_spellfile_plugin = 1
let g:loaded_tarPlugin = 1
let g:loaded_vimballPlugin = 1
let g:loaded_zipPlugin = 1

au FocusGained,BufEnter * :checktime

if &diff
    colorscheme gruvbox
    let g:golden_ratio_autocommand = 0
endif

au FilterWritePre * if &diff | colorscheme gruvbox | endif

imap <C-h> <BS>
cmap <C-h> <BS>
