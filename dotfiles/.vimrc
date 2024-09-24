"***
"" Install vim-plug
"***
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"***
"" Plugins
"***

"" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/bundle')

"" Helpers
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'airblade/vim-gitgutter'
Plug 'edkolev/promptline.vim'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'bronson/vim-trailing-whitespace'
Plug 'cohama/lexima.vim'
Plug 'yegappan/mru'
"" Linting, Completion and Snippets
Plug 'dense-analysis/ale'
Plug 'ycm-core/YouCompleteMe', { 'do': 'python3 install.py' }
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
"" Colors
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasr/molokai'
Plug 'romainl/Apprentice'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'morhetz/gruvbox'
"" Syntax
Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.sh --style dictionary' }
Plug 'ekalinin/dockerfile.vim'
Plug 'martinda/jenkinsfile-vim-syntax'
Plug 'hashivim/vim-terraform'
" Plug 'juliosueiras/vim-terraform-completion'
Plug 'hashivim/vim-vagrant'
Plug 'jvirtanen/vim-hcl'
Plug 'nfnty/vim-nftables'
Plug 'davidhalter/jedi-vim'

"" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" Required:
filetype plugin indent on

"***
" Basic Setup
"***

"" Encoding
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=utf-8
set ttyfast

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
"" Number of spaces of tab
set tabstop=2
"" Number of spaces of tab when in edit mode
set softtabstop=2
"" Number of spaces to indent
set shiftwidth=2
"" Turn tabs into spaces
set expandtab

"" Map leader to ,
let mapleader = ","

" A buffer becomes hidden when it is abandoned
set hidden

"" Searching
"" Highlight search results
set hlsearch
"" Makes search act like search in modern browsers
set incsearch
set ignorecase
set smartcase

"" Disable swapping and backups
set nobackup
set noswapfile

set fileformats=unix,dos,mac

"" Shell
if exists('$SHELL')
  set shell=$SHELL
else
  set shell=/bin/sh
endif

"" Session management
let g:session_directory = "~/.vim/sessions"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"" Automatically source vimrc on save.
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

"***
"" Visual Settings
"***

syntax on
colorscheme gruvbox
set term=xterm-256color
set termguicolors
set t_Co=256
set background=dark
set ruler
"" show line numbers
set number
"" highlight current line
set cursorline
"" highlight current column
set cursorcolumn
"" visual autocomplete for command menu
set wildmenu
"" Don't redraw while executing macros (good performance config)
set lazyredraw
"" For regular expressions turn magic on
set magic
" Show matching brackets when text indicator is over them
set showmatch
"" Comments appear in italic
hi Comment cterm=italic
"" Enable statusline
set laststatus=2
set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

"" Search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"" vim-airline
let g:airline_theme = 'badwolf'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  "" powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

"" Start NERDTree. If a file is specified, move the cursor to its window.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
"" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"***
"" Plugin configuration
"***

"" NERDTree
let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['node_modules','\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:NERDTreeWinSize = 31
let g:NERDTreeGitStatusIndicatorMapCustom = {
\ "Modified"  : "✹",
\ "Staged"    : "✚",
\ "Untracked" : "✭",
\ "Renamed"   : "➜",
\ "Unmerged"  : "═",
\ "Deleted"   : "✖",
\ "Dirty"     : "✗",
\ "Clean"     : "✔︎",
\ 'Ignored'   : '☒',
\ "Unknown"   : "?"
\ }
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,.cache,*.tgz,.vagrant,.npm,.git,*node_modules/

"" Ale
"" Show loclist or quickfix window. set to 'on_save' for Ultisnips!
let g:ale_open_list = 'on_save'
"" Linting
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_lint_on_text_changed = 'never'
"" Fixing
let g:ale_fix_on_save = 1
"" Completion
" set omnifunc=ale#completion#OmniFunc
let g:ale_completion_enabled = 0
let g:ale_completion_autoimport = 1
"" Linters
let g:ale_linters = {
  \ 'ansible': ['ansible-language-server', 'ansible_lint'],
  \ 'yaml': ['yamllint']
  \ }
let g:ale_linters_explicit = 1

"" Utilsnips
let g:UltiSnipsExpandTrigger="<C-j>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"

"" MRU
let MRU_Max_Entries = 10

"" Promptline
let g:promptline_theme = 'powerlineclone'
let g:promptline_preset = {
  \'b' : [ promptline#slices#python_virtualenv(), promptline#slices#host(), '$USER' ],
  \'a' : [ promptline#slices#vcs_branch() ],
  \'c' : [ promptline#slices#cwd() ],
  \'options': {
    \'left_sections' : [ 'b', 'a', 'c' ],
    \'left_only_sections' : [ 'b', 'a', 'c' ]}}

"" fzf.vim
" set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

"***
"" Mappings
"***

"" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
"" jk is escape
inoremap jk <esc>
"" move vertically by visual line
nnoremap j gj
nnoremap k gk
"" move to beginning/end of line
nnoremap B ^
nnoremap E $
"" Ale
" nmap <silent> <C-k> <Plug>(ale_previous_wrap)
" nmap <silent> <C-j> <Plug>(ale_next_wrap)
"" NerdTree
"" Toggle pane
nnoremap <leader>nh :NERDTreeToggle<CR>
"" Search tree
nnoremap <leader>nf :NERDTreeFind<CR>
"" Change CWD
nnoremap <leader>nd :NERDTree %<CR>
"" Fugitive
"" git status
nnoremap <leader>gs :Git<CR>
"" git diff
nnoremap <leader>gd :Gdiff<CR>
"" fzf and ripgrep
nnoremap <leader>f :Files<Cr>
nnoremap <leader>b :Buffers<Cr>
nnoremap <leader>g :Rg<Cr>
"" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
"" toggle undotree
nnoremap <leader>u :UndotreeToggle<CR>
"" fast saving
nmap <leader>w :w!<CR>
"" quit without saving
nmap <leader>qq :q!<CR>
"" CWD
nnoremap <leader>cd :lcd %:p:h<CR>:pwd<CR>
"" Buffers
"" List active buffers
" nnoremap <leader>b :buffers<CR>
"" Close all the buffers
map <leader>ba :bufdo bd<CR>
"" Move around buffers
map <leader>l :bnext<CR>
map <leader>h :bprevious<CR>
"" MRU
nnoremap <leader>rf :MRU<CR>
"" avoid ex mode at all costs!
nnoremap Q <nop>

"***
" Commands
"***

"" Remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

"***
"" Syntax
"***

"" ansible-vim
let g:ansible_name_highlight = 'd'
let g:ansible_attribute_highlight = "ob"
let g:ansible_unindent_after_newline = 1
let g:ansible_extra_keywords_highlight = 1
au BufRead,BufNewFile */group_vars/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */host_vars/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */infra_vars/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */provision_vars/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */roles/*.yml set filetype=yaml.ansible

"" Terraform
"" manage indentation syntax
let g:terraform_align = 1
"" custom commentary commentstring
autocmd FileType terraform setlocal commentstring=#%s
"" run terraform fmt on save
let g:terraform_fmt_on_save = 1
"" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
let g:terraform_completion_keys = 1
"" (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
let g:terraform_registry_module_completion = 0
