execute pathogen#infect()

syntax on
filetype plugin indent on

" Set theme
colorscheme space-vim-dark
hi Comment cterm=italic
" Enable statusline 
set laststatus=2
" display current git branch
set statusline+=%{fugitive#statusline()}
" Open NERDTree automatically when vim starts up
autocmd vimenter * NERDTree
" Close NERDTree when all windows get closed
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" number of spaces of tab
set tabstop=2
" number of spaces of tab when in edit mode
set softtabstop=2
" turn tabs into spaces
set expandtab
" show line numbers
set number
" highlight current line
set cursorline
" visual autocomplete for command menu
set wildmenu
" A buffer becomes hidden when it is abandoned
set hid
" Highlight search results
set hlsearch
" Makes search act like search in modern browsers
set incsearch
" Don't redraw while executing macros (good performance config)
set lazyredraw
" For regular expressions turn magic on
set magic
" Show matching brackets when text indicator is over them
set showmatch
" Vim's spell checker
" set spell spelllang=en

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_theme = 'badwolf'

" ansible-vim tweaks
let g:ansible_unindent_after_newline = 1
let g:ansible_attribute_highlight = "ob"
let g:ansible_name_highlight = 'd'
let g:ansible_extra_keywords_highlight = 1

" show hidden files in NERDTree
" let g:NERDTreeShowHidden = 1
" custom symbols
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

" leader is comma
let mapleader = ","
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
" toggle undotree
nnoremap <leader>u :UndotreeToggle<CR>
" change cwd in NERDTree
nnoremap <leader>d :NERDTree %<CR>
" toggle NERDTree pane
nnoremap <leader>hn :NERDTreeToggle<CR>
" git status
nnoremap <leader>gs :Gstatus<CR>
" git diff
nnoremap <leader>gd :Gdiff<CR>
" list active buffers
nnoremap <leader>b :buffers<CR>
" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" avoid ex mode at all costs!
nnoremap Q <nop>
" jk is escape
inoremap jk <esc>
" move vertically by visual line
nnoremap j gj
nnoremap k gk
" move to beginning/end of line
nnoremap B ^
nnoremap E $
" fast saving
nmap <leader>w :w!<CR>
" quit without saving
nmap <leader>qq :q!<CR>
