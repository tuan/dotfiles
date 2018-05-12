let mapleader=" "

set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=/home/linuxbrew/.linuxbrew/opt/fzf

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'easymotion/vim-easymotion'
Plugin 'tpope/vim-surround'
Plugin 'haya14busa/incsearch.vim'
Plugin 'haya14busa/incsearch-fuzzy.vim'
Plugin 'haya14busa/incsearch-easymotion.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'leafgarland/typescript-vim'
Plugin 'Quramy/tsuquyomi'
Plugin 'Shougo/vimproc.vim'
" Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'prettier/vim-prettier'
Plugin 'crusoexia/vim-monokai'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'
Plugin 'airblade/vim-gitgutter'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
" start of easymotion fuzzy search integration
imap jj <Esc>
set tabstop=2 shiftwidth=2 expandtab
set number
set relativenumber
set showcmd
colorscheme monokai
autocmd InsertEnter,InsertLeave * set cul!

function! s:config_easyfuzzymotion(...) abort
	return extend(copy({
				\   'converters': [incsearch#config#fuzzyword#converter()],
				\   'modules': [incsearch#config#easymotion#module({'overwin': 1})],
				\   'keymap': {"\<CR>": '<Over>(easymotion)'},
				\   'is_expr': 0,
				\   'is_stay': 1
				\ }), get(a:, 1, {}))
endfunction

noremap <silent><expr> <Space>/ incsearch#go(<SID>config_easyfuzzymotion())
" end of easymotion fuzzy search integration

" copy and paste from clipboard
noremap <leader>p "*]p
noremap <leader>y "+y

" prettier
nmap <Leader>py <Plug>(Prettier)

" nerdtree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <leader>r :NERDTreeFind<cr>

"airline
let g:airline_theme = 'molokai'
let g:airline#extensions#tabline#enabled = 1

"prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue Prettier

"Tsu
autocmd FileType typescript setlocal completeopt+=menu,preview
nmap <Leader>gd <Plug>(TsuquyomiDefinition)

"fzf
nmap <Leader>b :Buffers<CR>
nmap <Leader>f  :Files<CR>

"git
let g:gitgutter_enabled = 1
