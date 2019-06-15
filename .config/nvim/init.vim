call plug#begin('~/.vim/plugged')

set number " Line Numbers

let g:impact_transbg=1 " fix colors w/o mux?

let &colorcolumn=join(range(101,999),",")

Plug 'sheerun/vim-polyglot'
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'mustache/vim-mustache-handlebars'
Plug 'vim-latex/vim-latex'

Plug 'davidhalter/jedi-vim'
" Linter plugin
"Plug 'w0rp/ale'
"let g:ale_lint_on_text_changed = 'never'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'ervandew/supertab'
"Plug 'tpope/vim-vividchalk'
Plug 'roxma/vim-tmux-clipboard'
"Plug 'dkprice/vim-easygrep'
"Plug 'christoomey/vim-tmux-navigator'  " Navigate between tmux panes and vim splits
Plug 'ntpeters/vim-better-whitespace'
Plug 'cloudhead/neovim-fuzzy' " fzzy finder
Plug 'hashivim/vim-terraform'
Plug 'haishanh/night-owl.vim'

let g:terraform_align=1

"Plug 'jdkanani/vim-material-theme'
Plug 'andrewstuart/vim-kubernetes'
" Ruby
Plug 'vim-ruby/vim-ruby'

let g:terraform_align=1
let g:terraform_fmt_on_save=1

"Plug 'fishbullet/deoplete-ruby'

"let g:deoplete#enable_at_startup = 1

call plug#end()

nmap <silent> <leader>T :TestFile<CR>

set nocompatible      " We're running Vim, not Vi!
syntax on             " Enable syntax highlighting
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
set expandtab         " Expand tabs to spaces
set showmatch   		  " Show matches
set ts=2 	      			" Tab is 2 spaces
set shiftwidth=2      " Indents are 2 spaces
let mapleader = " " 	" Leader is space bar
map <Leader>n :NERDTreeTabsToggle<CR>
set clipboard=unnamed " TMUX/VIM COPY PASTE
set encoding=utf8
set mouse=a
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
autocmd VimEnter * NERDTreeTabsToggle
" Clear search/highlights by ctrl+L
nnoremap <silent> <C-l> :nohlsearch<CR><C-l>
nnoremap <C-p> :FuzzyOpen<CR>

autocmd BufEnter * EnableStripWhitespaceOnSave

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

" Show 80 char mark
let &colorcolumn=join(range(99,999),",")
highlight ColorColumn ctermbg=235 guibg=#2c2d27

nnoremap ,z zMzvzz

" all below is from https://dougblack.io/words/a-good-vimrc.html
set foldenable 				  " Code Folding
set foldlevelstart=5    " only fold 5 levels or greater
set foldmethod=indent   " fold based on indent level
set cursorline          " highlights current
set wildmenu            " visual autocomplete for command menu
" set lazyredraw          " redraw only when we need to. -- i thought i needed
" this but it turns out vim-go was just slow AF so i don't use it anymore
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
au BufRead,BufNewFile *.yaml.gotmpl setfiletype yaml

" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

""""" enable the theme
syntax enable
"colorscheme night-owl
colorscheme stereokai
set termguicolors

