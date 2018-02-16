runtime! plugin/sensible.vim

if !exists('*NotJsFt')
  function g:NotJsFt()
    let ext = expand('%:e')
    return(!(ext == 'js' || ext == 'jsx'))
  endfunction
endif

if !exists('*CloseHiddenBuffers')
  function! CloseHiddenBuffers()
    " figure out which buffers are visible in any tab
    let visible = {}
    for t in range(1, tabpagenr('$'))
      for b in tabpagebuflist(t)
        let visible[b] = 1
      endfor
    endfor
    " close any buffer that's loaded and not visible
    for b in range(1, bufnr('$'))
      if bufloaded(b) && !has_key(visible, b)
        exe 'bd ' . b
      endif
    endfor
  endfun
endif

if !exists('*GetBranch')
  function! GetBranch()
    let branch = fugitive#head()
    if empty(branch)
      return branch
    else
      return branch . " \uF408"
    endif
  endfun
endif

" let g:tmp = ''

if !exists('*WriteFileName')
  function g:WriteFileName()
    redir @+> |  echo @% | redir END
  endfunction
endif

set nocompatible

call plug#begin('~/.local/share/nvim/plugged')


" Plug 'Shougo/dein.vim'
Plug 'Shougo/vimproc.vim', {'do' : 'make'}

" Plug 'Shougo/unite.vim'

"Detach process==============
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
"============================


"INTERFACES ADDONS===========
Plug 'shougo/denite.nvim', {'do' : ':UpdateRemotePlugins'}
Plug '5t111111/denite-rails'
Plug 'itchyny/lightline.vim'

Plug 'yggdroot/indentline'

Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTree']}
Plug 'Xuyuanp/nerdtree-git-plugin', {'on': ['NERDTreeToggle', 'NERDTree']}
Plug 'taiansu/nerdtree-ag' "New plugin
Plug 'sjl/gundo.vim', {'on': 'GundoToggle'}
Plug 'mhinz/vim-startify'
"============================



"SYNTAX SUPPORT==============
" Configure
Plug 'w0rp/ale'
" Plug 'valloric/matchtagalways'
Plug 'gregsexton/matchtag'

Plug 'sheerun/vim-polyglot'

Plug 'irrationalistic/vim-tasks'
Plug 'kchmck/vim-coffee-script', {'for': 'coffee'}
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript', {'for': ['javascript', 'javascript.jsx']}
Plug 'maksimr/vim-jsbeautify'
Plug 'vim-ruby/vim-ruby', {'on_ft': 'ruby'}
Plug 'chrisbra/csv.vim'
"============================


"SEARCH======================
Plug 'haya14busa/incsearch.vim'
Plug 'othree/eregex.vim'
Plug 'gabesoft/vim-ags'
Plug 'eugen0329/vim-esearch'
Plug 'wincent/ferret'
Plug 'rking/ag.vim' "New plugin
" Plug 'brooth/far.vim'
" Plug 'dyng/ctrlsf.vim'
"============================


"AUTOCOMPLETE================
Plug 'danchoi/ri.vim',{'for': ['ruby']} "Docs viewer

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/vim-lsp'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
            "\{'if': 'NotJsFt() == 1'})

Plug 'Shougo/deoplete-rct'
", {'on_ft': ['ruby']}
Plug 'alexgenco/neovim-ruby', {'on_ft': ['ruby']}
Plug 'fishbullet/deoplete-ruby', {'on_ft': ['ruby']}

Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
      "\{'on_ft': ['javascript', 'javascript.jsx']})
Plug 'othree/jspc.vim'
      "\{'on_ft': ['javascript', 'javascript.jsx']})

" call dein#add('valloric/youcompleteme',
"       \{'on_ft': ['javascript', 'javascript.jsx', 'jsx']})
"============================

"INTEGRATION=================
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-rails'
Plug 'thoughtbot/vim-rspec'
Plug 'tpope/vim-cucumber'

             " \{'on_ft': ['ruby', '']})
             " \{'on_ft': ['ruby', '']})

"Autoread changes, matchit and more.
Plug 'tpope/vim-sensible'

" Autolaod root configs
" Plug 'airblade/vim-rooter'
Plug 'tpope/vim-eunuch'
" Auto tab detection
Plug 'ciaranm/detectindent'
Plug 'tpope/vim-sleuth'
Plug 'kabbamine/vcoolor.vim'
Plug 'kmdsbng/vim-ruby-eval'
Plug 'metakirby5/codi.vim'
Plug 'szw/vim-maximizer'
" Plug 'ervandew/screen' cannot install!!!
"============================



"EDIT ADDONS=================
Plug 'matze/vim-move'
Plug 'terryma/vim-multiple-cursors'
"Plug 'scrooloose/nerdcommenter'

Plug 'svermeulen/vim-easyclip'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-endwise'
      "\{'on_ft': ['ruby', 'vim']})
Plug 'tpope/vim-repeat'

Plug 'tmhedberg/simpylfold'
Plug 'raimondi/delimitmate'
"call dein#add('matchit.zip',
"\{'on_ft': ['ruby']})
Plug 'kana/vim-textobj-user'
Plug 'nelstrom/vim-textobj-rubyblock'
      "\{'on_ft': ['ruby']})

Plug 'chrisbra/nrrwrgn'

"Get known how its works
"Plug 'junegunn/vim-easy-align'

"Moving args
Plug 'andrewradev/sideways.vim'
"============================



"TAGS========================
Plug 'ludovicchabant/vim-gutentags'
"============================



"NAVIGATION==================
Plug 'kshenoy/vim-signature'
Plug 'easymotion/vim-easymotion'
Plug 'haya14busa/incsearch-easymotion.vim'
" Plug 'vifm/vifm.vim'
" Plug 'vifm/neovim-vifm'
"============================



"GIT EXTENSIONS==================
Plug 'tpope/vim-fugitive' "Get known more
Plug 'airblade/vim-gitgutter'
Plug 'zenbro/mirror.vim'
Plug 'chemzqm/vim-easygit'
"============================



"SNIPPETS====================
Plug 'mattn/emmet-vim' "Get known more
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'epilande/vim-react-snippets'
"============================



"DENITE SOURCES==============
Plug 'chemzqm/denite-extra'
Plug 'chemzqm/denite-git'
"============================



"THEMES======================
Plug 'ryanoasis/vim-devicons'
Plug 'nanotech/jellybeans.vim'
Plug 'joshdick/onedark.vim'
Plug 'keitanakamura/neodark.vim'
Plug 'mhartington/oceanic-next'

" Plug 'sjl/badwolf'
" Plug 'w0ng/vim-hybrid'
" Plug 'jpo/vim-railscasts-theme'
" Plug 'chriskempson/vim-tomorrow-theme'
" Plug 'alessandroyorba/alduin'
" Plug 'cocopon/iceberg.vim'
" Plug 'andreasvc/vim-256noir'
" Plug 'morhetz/gruvbox'
" Plug 'reedes/vim-colors-pencil'
" Plug 'ajh17/spacegray.vim'
" Plug 'jacoborus/tender'
" Plug 'rakr/vim-one'
"============================


call plug#end()


" and a lot more plugins.....

" if (has("termguicolors"))
"  set termguicolors
" endif

colorscheme onedark
highlight default link deniteMatchedChar None
highlight default link deniteMatchedRange None


set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set mouse=a
" set clipboard=unnamed USE MAIN CLIPBOARD

set directory=~/.vim/swapfiles/

" Folding settings
set foldmethod=indent   "fold based on indent
set foldnestmax=5       "deepest fold is 3 levels
" set nofoldenable        "dont fold by default
set foldenable
set foldlevelstart=3

" set cursorline! " highlight current cursor position
set lazyredraw " improve rendering
set synmaxcol=128
syntax sync minlines=256
set encoding=utf8

" set bufhidden=delete


" POSIBLY DELETE---
"filetype plugin on
"filetype indent on

"turn on syntax highlighting

filetype plugin indent on
syntax enable
"syntax on

" POSIBLY DELETE-------



call denite#custom#map(
      \ 'insert',
      \ '<C-j>',
      \ '<denite:move_to_next_line>',
      \ 'noremap'
      \)
call denite#custom#map(
      \ 'insert',
      \ '<C-k>',
      \ '<denite:move_to_previous_line>',
      \ 'noremap'
      \)

call denite#custom#source(
      \ 'file_rec', 'sorters', ['sorter_rank'])


call denite#custom#filter('matcher_ignore_globs', 'ignore_globs',
      \ [ '.git/', '.ropeproject/', '__pycache__/',
      \   'venv/', 'images/', '*.min.*', 'img/', 'fonts/',
      \   'node_modules/', 'log/'])

call denite#custom#var("file_rec", "command",
      \ [ "find", "-L", ":directory",
      \ "-path", "*/node_modules/*", "-prune", "-o",
      \ "-path", "*/.svn/*", "-prune", "-o",
      \ "-path", "*/log/*", "-prune", "-o",
      \ "-path", "*/.git/*", "-prune", "-o",
      \ "-path", "*/tmp/*", "-prune", "-o",
      \ '-type', 'l', '-print', '-o',
      \ '-type', 'f', '-print'])

" TRY REPLACE WITH RIPGREP!!!!
call denite#custom#var('grep', 'command', ['ag'])

call denite#custom#var('grep', 'default_opts',
      \ [ '--nopager', '--nocolor', '--nogroup', '--column'])
      " \ ['--ackrc', $HOME.'/.ackrc', '-H',
call denite#custom#var('grep', 'recursive_opts', [])
call denite#custom#var('grep', 'pattern_opt', ['--match'])
call denite#custom#var('grep', 'separator', ['--'])
call denite#custom#var('grep', 'final_opts', [])

" call denite#custom#var('grep', 'default_opts',
"       \ ['--context=3'])
" call denite#custom#var('grep', 'final_opts', ['--context=3'])

"call denite#custom#var('grep', 'command', ['rg'])
"call denite#custom#var('grep', 'default_opts',
      "\ ['--vimgrep', '--no-heading'])
"call denite#custom#var('grep', 'recursive_opts', [])
"call denite#custom#var('grep', 'pattern_opt', ['--regexp'])
"call denite#custom#var('grep', 'separator', ['--'])
"call denite#custom#var('grep', 'final_opts', [])

"=========================================================================
"CONFFIGS
"set t_Co=256
set list
set number
"set listchars=tab:▷⋅,trail:⋅,nbsp:⋅
"set listchars=tab:>·,trail:*,extends:>,precedes:<,space:␣
set listchars=tab:>·,trail:*,nbsp:⋅

let g:move_key_modifier = 'C'
let g:eregex_default_enable = 0
nmap <Leader>md :mksession! $vdefsession<esc>

set nocompatible
if has("autocmd")
  filetype indent plugin on
endif

set hidden
set confirm

"undo settings
set undodir=~/.vim/undofiles
set undofile
set colorcolumn=+1 "mark the ideal max text width

"Live substitute
set inccommand=split

"visual search
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

set modifiable
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby setl omnifunc=syntaxcompelete#Complete
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS


" Enable jsx syntax for js
let g:jsx_ext_required = 0

let g:ycm_seed_identifiers_with_syntax = 1
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 70
let g:deoplete#file#enable_buffer_path=1


let g:rubycomplete_buffer_loading = 1
let g:rubycomplete_classes_in_global = 1
let g:rubycomplete_rails = 1
let g:deoplete#sources = {}
" let g:deoplete#sources.ruby = ['around', 'buffer', 'member', 'file', 'ultisnips']


let g:deoplete#omni#functions = {}
" let g:deoplete#sources._    = ['around', 'buffer', 'file', 'ultisnips']
let g:deoplete#omni#functions.ruby = 'rubycomplete#Complete'
let g:deoplete#omni#functions.javascript = [
  \ 'tern#Complete',
  \ 'jspc#omni'
\]

" Ale configuration
let g:ale_linters = {
\   'javascript': [],
\   'ruby': ['rubocop'],
\}

" Disable ale by default
let g:ale_enabled = 1

" search configs
let g:esearch = {
  \ 'adapter':    'ack',
  \ 'backend':    'nvim',
  \ 'out':        'win',
  \ 'batch_size': 500,
  \ 'use':        ['visual', 'last'],
  \}
let g:esearch#adapter#ack#options = '--context=3 --ackrc=/Users/bliareg/.ackrc'
let g:ags_enable_async = 1
let g:ags_agexe = 'ag'
let g:FerretExecutable = 'ack'
" let g:far#source = 'ack'

"line movement options---
let g:move_auto_indent = 0
let g:UltiSnipsExpandTrigger="<C-j>"


"Multple cursor options
let g:multi_cursor_exit_from_insert_mode = 0
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-N>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'

"Custom surround actions
let g:surround_{char2nr("F")} = "{/*\r*/}" " React jsx comment

" Custom VCoolor colorpicker
let g:vcoolor_custom_picker = 'yad --title "Oo" --color --init-color=' " For linux

"=========================================================================

"SHORTCUTS
" let g:mapleader = "\\"
nmap ,m :Denite rails:model<esc>
nmap ,c :Denite rails:controller<esc>
nmap ,h :Denite rails:helper<esc>
nmap ,v :Denite rails:view<esc>

nmap <C-f> :Denite file_rec<esc>
nmap <D-f> :Denite file_rec<esc>
nmap th :Denite register<esc>
nmap ts :Denite grep -no-quit -auto-resume<esc>
nmap tb :Denite buffer<esc>
nmap tc :Denite command<esc>
nmap tf :Denite filetype<esc>
nmap tl :Denite line<esc>

map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
map z/ <Plug>(incsearch-easymotion-/)
map z? <Plug>(incsearch-easymotion-?)
map zg/ <Plug>(incsearch-easymotion-stay)

nnoremap <leader>/ :call eregex#toggle()<CR>

"map <Leader> <Plug>(easymotion-prefix)
nmap F <Plug>(easymotion-lineanywhere)
nmap f <Plug>(easymotion-overwin-f2)

"Change args order
nmap , :SidewaysRight<esc>
nmap ,[ :SidewaysLeft<esc>

nmap ,2 :SidewaysRight<esc>
nmap ,1 :SidewaysLeft<esc>
nmap ,1 :SidewaysLeft<esc>

"Nerd tree
nmap tr :NERDTreeToggle<esc>
nmap tn :NERDTree<esc>

"Git commads
nmap gs :Gstatus<esc>
nmap gmm :Gcommit -m ""
nmap gm :Gcommit<esc>
nmap gpl :Gpull
nmap gpp :Gpush
nmap gv :Gitv<esc>
nmap gh :Git checkout
nmap gb :Git branch
nmap gfe :Git fetch
nmap gme :Git merge
nmap gd :Gdiff

"Undo tree
nmap tug :GundoToggle<esc>

"Edit specific rails files
nmap r :e config/routes.rb<esc>
nmap s :Eschema <esc>
nmap d :e config/database.yml<esc>
nmap g :e Gemfile<esc>

"Output some info
nmap ]n :call WriteFileName() <esc>
nmap ]p :!ls %:p <esc>

nmap <Leader>m :mksession $vsessions/
nmap <Leader>md :mksession! $vdefsession<esc>

"Add lines
nmap 'o o<esc>
nmap "O O<esc>

"Buffers"
nmap gr :bn<esc>
nmap gR :bp<esc>
"nmap gc :bd<esc>

"Insert from normal mode
nmap ,<Enter> i<Enter><esc>
nmap ,<Tab> i<Tab><esc>
nmap ,<Space> i <esc>

"Stop highlighting
nmap <C-l> :noh <esc>

"Syntastic checkers
nmap <Leader>rs :SyntasticCheck rubocop<esc>

"visual search mappings
vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR>

" inoremap <A-h> <C-o>h
" inoremap <A-j> <C-o>j
" inoremap <A-k> <C-o>k
" inoremap <A-l> <C-o>l<esc>



nmap <C-t> :tabnew<esc>
nmap <C-s> :w<esc>
nmap <M-s> :w<esc>
nmap Q :clo<esc>
nmap <C-q> :bd!<esc>
nmap <leader>q :quitall!<esc>

"GitGutter shortcuts
nmap ,gd :GitGutterLineHighlightsToggle<esc>
nmap \] :GitGutterNextHunk<esc>
nmap \[ :GitGutterPrevHunk<esc>
nmap ,gp :GitGutterPreviewHunk<esc>
nmap ,gu :GitGutterUndoHunk<esc>

nmap ta :ALEToggle<esc>

nmap X <Plug>MoveMotionEndOfLinePlug

" Clipboard shortcuts
vmap <C-c> "+y<esc>
nmap <C-c> "+p<esc>

" autocmd FileType javascript vnoremap <buffer>  \l :call RangeJsBeautify()<cr>
autocmd FileType json vnoremap <buffer> \l :call RangeJsonBeautify()<cr>
autocmd FileType jsx vnoremap <buffer> \l :call RangeJsBeautify()<cr>
autocmd FileType javascript vnoremap <buffer>  \l :call RangeJsBeautify()<cr>
autocmd FileType html vnoremap <buffer> \l :call RangeHtmlBeautify()<cr>
autocmd FileType css vnoremap <buffer> \l :call RangeCSSBeautify()<cr>

" Tabline config
let g:tabber_wrap_when_shifting = 1

let g:python_host_prog = '/usr/bin/python'
let g:python3_host_prog = '/usr/local/bin/python3'

autocmd BufWritePost ~/.bash_profile !bash
autocmd BufWritePost ~/.bashrc !bash

map <ScrollWheelUp> <C-Y>
map <S-ScrollWheelUp> <C-Y>
map <ScrollWheelDown> <C-E>
map <S-ScrollWheelDown> <C-E>

"Bookmarks
let g:startify_bookmarks = [
      \'/Users/bliareg/projects',
      \'/Users/bliareg/projects/exam',
      \'/Users/bliareg/projects/quality_dashboard',
      \'/Users/bliareg/projects/eqas',
      \'/Users/bliareg/projects/steuervermittler',
      \'/Users/bliareg/projects/first-up',
      \'/Users/bliareg/projects/therapy-hub',
      \]

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ],
      \ 'right': [ [ 'lineinfo' ],
      \            [ 'percent' ],
      \            [ 'fileformat', 'fileencoding', 'filetype' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'GetBranch',
      \   'filetype': 'MyFiletype',
      \   'fileformat': 'MyFileformat',
      \ },
      \ 'colorscheme': 'jellybeans'
      \ }
let g:lightline.separator = { 'left': "\uE0C8", 'right': "\uE0CA" }
let g:lightline.subseparator = { 'left':  "|", 'right': "|" }
let g:lightline.tabline_separator = { 'left': "\uE0B0", 'right': "\uE0B2" }
let g:lightline.tabline_subseparator = g:lightline.subseparator



  function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
  endfunction

  function! MyFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
  endfunction


let g:webdevicons_enable_denite = 0
let g:webdevicons_enable_unite = 0

" inoremap <C-w>p :MaximizerToggle<CR>
" let g:maximizer_default_mapping_key = 'tm'


"Rspec config
"let g:rspec_command = "Dispatch rspec {spec}"

if !exists('*EncryptFile')
  function g:EncryptFile()
    exe "%!openssl enc -aes-256-cbc -a -pass pass:".g:encrypt_password
  endfunction
endif

if !exists('*DecryptFile')
  function g:DecryptFile()
    exe "%!openssl enc -aes-256-cbc -d -a -pass pass:".g:encrypt_password
  endfunction
endif

if exists('g:auto_encrypt') && g:auto_encrypt
  set noundofile
  autocmd BufRead * call DecryptFile()
  autocmd BufWritePre * call EncryptFile()
  autocmd BufWritePost * call DecryptFile()
endif

"INSTALL REQUIRMENTS
"ccrypt - brew install openssl
"gem install rdoc
"rvm docs generate-ri
"bundle list | tr -d '*(,)' | awk '{print $1, "--version", $2}' | xargs -n3 gem rdoc --ri --no-rdoc


"LSP
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'language_server-ruby',
        \ 'cmd': {server_info->['language_server-ruby']},
        \ 'whitelist': ['all'],
        \ })
endif


nmap р h
nmap о j
nmap л k
nmap д l

nmap Р H
nmap О J
nmap Л K
nmap Д L

nmap ш i
nmap Ш I

nmap к r
nmap К R

nmap ф a
nmap Ф A

nmap у e
nmap У E

nmap ц w
nmap Ц W

nmap пп gg
nmap П G

nmap ч x
nmap Ч X

nmap н y
nmap нн yy

nmap м v

nmap в d
nmap В D
nmap вв dd



"packages
"gem install neovim
"gem install rdoc
"gem install fastri
"gem install rcodetools
"gem install rubocop

"pip install neovim
"pip3 install neovim

"npm install -g neovim
"npm install -g tern
"npm install -g js-beautify
