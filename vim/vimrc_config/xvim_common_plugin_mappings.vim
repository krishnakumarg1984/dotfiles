command! PU PlugUpdate | PlugUpgrade


" For JavaScript files, use `eslint` (and only eslint)
let g:ale_linters = {
            \   'javascript': ['eslint'],
            \   'tex': ['chktex, lacheck'],
            \ }

" Mappings in the style of unimpaired-next
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

" " some other plugin which sets quickfix errors, etc.
" " This can be useful if you are combining ALE with
" let g:ale_lint_on_filetype_changed = 1    " default
" Set this if you want to.
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_format = '[%linter%] [%severity%] %s'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_keep_list_window_open = 0
let g:ale_lint_on_enter = 1               " default
let g:ale_lint_on_save = 1                " default
let g:ale_lint_on_text_changed = 'never'
let g:ale_list_window_size = 4
let g:ale_open_list = 0
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_sign_column_always = 1
let g:ale_statusline_format = ['Errors: %d', 'Warnings: %d', '']

let g:ale_linters = {
            \   'tex': ['chktex','lacheck','alex','vale'],
            \   'latex': ['alex','chktex','lacheck','proselint','redpen','vale','write-good'],
            \}


let g:grepper       = {}
let g:grepper.tools = ['git', 'rg', 'grep']

" Search for the current word
nnoremap <Leader>* :Grepper -cword -noprompt<CR>

" Search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

function! SetupCommandAlias(input, output)
    exec 'cabbrev <expr> '.a:input
                \ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:input.'")'
                \ .'? ("'.a:output.'") : ("'.a:input.'"))'
endfunction
call SetupCommandAlias("grep", "GrepperGrep")

" Open Grepper-prompt for a particular Grep-alike tool
nnoremap <Leader>g :Grepper -tool git<CR>
nnoremap <Leader>G :Grepper -tool rg<CR>


let g:better_whitespace_enabled=1
" let g:strip_whitespace_on_save=1

nnoremap <leader>s :ToggleWorkspace<CR>
" let g:workspace_autosave_always = 1

let g:indentguides_ignorelist = ['text']

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap <leader>ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap <leader>ga <Plug>(EasyAlign)

nnoremap <leader>gu :GundoToggle<CR>
" nnoremap <leader>gu :UndotreeToggle<CR>


xnoremap iz :<c-u>FastFoldUpdate<cr><esc>:<c-u>normal! ]zv[z<cr>
xnoremap az :<c-u>FastFoldUpdate<cr><esc>:<c-u>normal! ]zV[z<cr>

let g:matchup_transmute_enabled=0
let g:matchup_matchparen_deferred = 1
let g:matchup_override_vimtex = 1
let g:matchup_matchparen_status_offscreen = 0


let g:sandwich#recipes = deepcopy(g:sandwich#default_recipes)
runtime macros/sandwich/keymap/surround.vim
let g:columnmove_strict_wbege = 0

" For conceal markers.
if has('conceal')
    set conceallevel=2 concealcursor=niv
endif

if has('timers')
    " Blink 2 times with 50ms interval
    noremap <expr> <plug>(slash-after) 'zz'.slash#blink(2, 50)
endif


"" Open current line on GitHub
nnoremap <Leader>o :.Gbrowse<CR>

let g:gutentags_ctags_tagfile = '.tags'
let g:gutentags_generate_on_new = 0
let g:gutentags_file_list_command = {
            \ 'markers': {
            \   '.git': 'git ls-files',
            \   '.hg': 'hg files',
            \ },
            \}


" if !executable('zeal') || exists('g:loaded_zeal') | finish | endif

" let g:loaded_zeal = 1

let g:rsi_no_meta = 1

let g:tq_online_backends_timeout = 0.4

let g:goyo_linenr = 1

autocmd! User GoyoEnter Limelight 0.8
autocmd! User GoyoLeave Limelight!

" nmap <Leader>L <Plug>(Limelight)
" xmap <Leader>L <Plug>(Limelight)

let g:qf_auto_open_quickfix = 0

let g:vimtex_compiler_latexmk = {
    \ 'options' : [
    \   '-pdf',
    \   '-shell-escape',
    \   '-verbose',
    \   '-file-line-error',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}


let g:vimtex_fold_enabled = 1
let g:vimtex_fold_types = {
      \ 'sections' : {'parse_levels': 1},
      \}
let g:vimtex_format_enabled = 1
let g:vimtex_view_automatic = 0
let g:vimtex_view_forward_search_on_start = 0
let g:vimtex_toc_config = {
      \ 'split_pos' : 'full',
      \ 'mode' : 2,
      \ 'fold_enable' : 1,
      \ 'hotkeys_enabled' : 1,
      \ 'hotkeys_leader' : '',
      \ 'refresh_always' : 0,
      \}
let g:vimtex_quickfix_open_on_warning = 0
let g:vimtex_quickfix_autoclose_after_keystrokes = 3
let g:vimtex_complete_img_use_tail = 1
let g:vimtex_complete_bib = {
      \ 'simple' : 1,
      \ 'menu_fmt' : '@year, @author_short, @title',
      \}

let g:vimtex_echo_verbose_input = 0

if has('win32') || has('win64')
    let g:vimtex_view_general_viewer = 'SumatraPDF'
    let g:vimtex_view_general_options
                \ = '-reuse-instance -forward-search @tex @line @pdf'
                \ . ' -inverse-search "nvim-qt --servername ' . v:servername
                \ . ' --remote-send \"^<C-\^>^<C-n^>'
                \ . ':drop \%f^<CR^>:\%l^<CR^>:normal\! zzzv^<CR^>'
                \ . ':execute ''drop '' . fnameescape(''\%f'')^<CR^>'
                \ . ':\%l^<CR^>:normal\! zzzv^<CR^>'
                \ . ':call remote_foreground('''.v:servername.''')^<CR^>^<CR^>\""'
else
    let g:vimtex_view_method = 'zathura'
endif

if has('nvim') && exists('g:GuiLoaded')
  let g:vimtex_compiler_progname = 'nvr'
endif
