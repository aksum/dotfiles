" vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"***
" Plugins
"***

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/bundle')

" Declare the list of plugins.
Plug 'tpope/vim-surround'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'bronson/vim-trailing-whitespace'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
" Plug 'mhinz/vim-signify'
Plug 'ConradIrwin/vim-bracketed-paste'
Plug 'cohama/lexima.vim'
Plug 'yegappan/mru'
Plug 'w0rp/ale'
Plug 'lifepillar/vim-mucomplete'
Plug 'sirver/ultisnips'
Plug 'honza/vim-snippets'
" Plug 'sheerun/vim-polyglot'
" PlugInstall and PlugUpdate will clone fzf in ~/.fzf and run the install script
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Colors
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'romainl/Apprentice'
Plug 'junegunn/seoul256.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
" Syntax
Plug 'pearofducks/ansible-vim', { 'do': 'cd ./UltiSnips; ./generate.py' }
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'ekalinin/dockerfile.vim'
Plug 'martinda/jenkinsfile-vim-syntax'
Plug 'hashivim/vim-terraform'
Plug 'hashivim/vim-vagrant'
Plug 'jvirtanen/vim-hcl'
"Plug 'jelera/vim-javascript-syntax'
"Plug 'davidhalter/jedi-vim'
"Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

"***
" Basic Setup
"***

" Fix backspace indent
set backspace=indent,eol,start

" Tabs. May be overriten by autocmd rules
" Number of spaces of tab
set tabstop=2
" Number of spaces of tab when in edit mode
set softtabstop=2
" Number of spaces to indent
set shiftwidth=2
" Turn tabs into spaces
set expandtab

" Map leader to ,
let mapleader = ","

" A buffer becomes hidden when it is abandoned
set hid

" Searching
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch
set ignorecase
set smartcase

" Directories for swp files
set nobackup
set noswapfile

" Session management
let g:session_directory = "~/.vim/sessions"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"***
" Visual
"***

" Set term
set term=xterm-256color
" Set theme
" Apprentice
colorscheme apprentice
set background=light
" Seoul256
"let g:seoul256_background = 234
"let g:seoul256_srgb = 1
"color seoul256

set ruler
" show line numbers
set number
" highlight current line
set cursorline
" visual autocomplete for command menu
set wildmenu
" Don't redraw while executing macros (good performance config)
set lazyredraw
" For regular expressions turn magic on
set magic
" Show matching brackets when text indicator is over them
set showmatch
" Comments appear in italic
hi Comment cterm=italic
" Enable statusline
set laststatus=2
" Display current git branch
set statusline+=%{fugitive#statusline()}

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Airline
let g:airline_theme = 'badwolf'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_skip_empty_sections = 1

" Open NERDTree automatically when vim starts up
autocmd vimenter * NERDTree
" Close NERDTree when all windows get closed
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"***
" Settings
"***

" Vim's spell checker
" set spell spelllang=en
" Delete trailing whitespace on save
" autocmd BufWritePre * :%s/\s\+$//e

" NERDTree
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
" Show hidden files in NERDTree
" let g:NERDTreeShowHidden = 1
" Custom symbols
let g:NERDTreeIndicatorMapCustom = {
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
" Toggle pane
nnoremap <leader>nh :NERDTreeToggle<CR>
" Search tree
nnoremap <leader>nf :NERDTreeFind<CR>
" Change CWD
nnoremap <leader>nd :NERDTree %<CR>
" Ignore
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite,.cache,*.tgz,.vagrant,.npm,.git

" Promptline
let g:promptline_theme = 'badwolf'

" Ale
let g:ale_open_list = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_completion_enabled = 0
let g:airline#extensions#ale#enabled = 1
"let g:ale_linters = {'ansible': ['ansible-lint', 'yamllint']}
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

" Utilsnips
let g:UltiSnipsExpandTrigger="<c-a>"
let g:UltiSnipsJumpForwardTrigger="<c-a>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" MRU
let MRU_Max_Entries = 400
nnoremap <leader>rf :MRU<CR>

" MUcomplete
set completeopt-=preview
set completeopt+=menuone,noselect
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion
let g:mucomplete#chains = {}
let g:mucomplete#chains.default = ['ulti', 'path', 'omni', 'keyn', 'dict', 'uspl']
let g:mucomplete#enable_auto_at_startup = 1

" Automatically source vimrc on save.
autocmd! bufwritepost $MYVIMRC source $MYVIMRC

"***
" Syntax
"***

" ansible-vim
let g:ansible_unindent_after_newline = 1
let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'd'
let g:ansible_extra_keywords_highlight = 1
au BufRead,BufNewFile */group_vars/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */host_vars/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */infra_vars/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
au BufRead,BufNewFile */roles/*.yml set filetype=yaml.ansible

" python
au BufRead,BufNewFile *.py
    \ set tabstop=4       |
    \ set softtabstop=4   |
    \ set shiftwidth=4    |
    \ set textwidth=79    |
    \ set expandtab       |
    \ set autoindent      |
    \ set fileformat=unix

" Terraform
" manage indentation syntax
let g:terraform_align = 1
" custom commentary commentstring
autocmd FileType terraform setlocal commentstring=#%s
" run terraform fmt on save
let g:terraform_fmt_on_save = 1

"***
" Mappings
"***

" Split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" jk is escape
inoremap jk <esc>

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" Fugitive
" git status
nnoremap <leader>gs :Gstatus<CR>
" git diff
nnoremap <leader>gd :Gdiff<CR>

" fzf and ripgrep
nnoremap <leader>f :Files<Cr>
nnoremap <leader>b :Buffers<Cr>
nnoremap <leader>g :Rg<Cr>

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" toggle undotree
nnoremap <leader>u :UndotreeToggle<CR>

" fast saving
nmap <leader>w :w!<CR>
" quit without saving
nmap <leader>qq :q!<CR>

" CWD
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

" Buffers
" List active buffers
" nnoremap <leader>b :buffers<CR>
" Close all the buffers
map <leader>ba :bufdo bd<CR>
" Move around buffers
map <leader>l :bnext<CR>
map <leader>h :bprevious<CR>

" avoid ex mode at all costs!
nnoremap Q <nop>
