"=======================================



" vimrc CONFIGURATION
"=======================================
" Maintainer
"   - beankuu@gmail.com
" Inspired by
"   - https://github.com/ntcarlson/dotfiles [formatting]
"
"---------------------------------------
" Contents
" 1. Basic Settings
" 2. vim-plug
" 3. vim-plug-settings
" 4. keymap [empty]
"---------------------------------------

"========================================
" 0. Prerequisite
" - pynvim -> for deoplete
"
"========================================
" 1. Basic Settings
syntax enable
filetype plugin on
filetype indent on
set mouse=a
set autoread
set wildmenu
set wildmode=longest,list,full
set scrolloff=4
set nu              "number at left
set hlsearch        "highlight search
set encoding=utf-8 nobomb  "force encoding to utf-8, no byte-order-mark

"# Indentation
set softtabstop=4   " tab inserts 4 spaces
set tabstop=4       " show existing tab with 4 spaces width
set shiftwidth=4    " when indenting with '>', use 4 spaces width
set expandtab       " On pressing tab, insert 4 spaces
set autoindent
set smartindent

"# longline
set nowrap
set linebreak
set sidescroll=0
set sidescrolloff=2

"# Fold
set foldenable
set foldmethod=syntax
set foldnestmax=3

"# Beep
set noerrorbells
set visualbell
set t_vb=

"========================================
" 2.vim-plug [PlugInstall, PlugUpdate, PlugClean, PlugUpgrade, PlugStatus, ...]
call plug#begin('~/.vim/plugged')
    "Visual
"    Plug 'wfxr/minimap.vim', {'do': ':!cargo install --locked code-minimap'}		"minimap for vim [{Minimap}{MinimapClose}]
    Plug 'severin-lemaignan/vim-minimap'   "minimap for vim [Minimap, MinimapClose]
    Plug 'itchyny/lightline.vim'        "Statusline plugin
    Plug 'ryanoasis/vim-devicons'	"coloured icons (for vim-bufferline)
    Plug 'bling/vim-bufferline'     "Command line Buffer
    Plug 'flazz/vim-colorschemes'       "ColorScneme
    Plug 'scrooloose/nerdtree'          "File Browser [{Space}]
    Plug 'majutsushi/tagbar'            "File Structure overview [{F8}], Requires{ctag}
"    Plug 'godlygeek/tabular'
   
   "Documents 
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'}   "Markdown Preview [:MarkdownPreview]
    Plug 'xuhdev/vim-latex-live-preview', { 'for': 'tex'}  "LaTex Preview
    Plug 'shime/vim-livedown'             "Livedown Markdown Plugin
    Plug 'vim-pandoc/vim-pandoc'          "pandoc document integration

    "Helper
    Plug 'plasticboy/vim-markdown'        "Markdown Syntax Highlight
    Plug 'moorereason/vim-markdownfmt'
    Plug 'vim-pandoc/vim-pandoc-syntax'   "pandoc syntax support
    Plug 'lervag/vimtex'                  "LaTeX support
    Plug 'w0rp/ale'                       "Linter
    Plug 'airblade/vim-gitgutter'         "Git diff
    Plug 'liuchengxu/vim-clap',{'do': ':Clap install-binary!'} "interactive finder and dispatcher
    Plug 'junegunn/fzf'                   "Fuzzy finder
    Plug 'ap/vim-css-color'
    
    "Commands
    if has('nvim')
        Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
    else
        Plug 'Shougo/deoplete.nvim'
        Plug 'roxma/nvim-yarp'
        Plug 'roxma/vim-hug-neovim-rpc'
    endif
    Plug 'SirVer/ultisnips'               "Snippets [c-s]
    Plug 'mattn/emmet-vim'                "Emmet Snippets [c-y]
    Plug 'tpope/vim-commentary'           "Commenting [gcc/gc]
    Plug 'tpope/vim-fugitive'             "Git Wrapper [Gedit]
    Plug 'tpope/vim-surround'             "Surroundings [cs]
    Plug 'tpope/vim-repeat'               "Repeat command [.+tab]
    Plug 'tommcdo/vim-lion'               "Aligning Text [gl/GL]
    Plug 'vimwiki/vimwiki'                "Wiki for Vim [\ww]
call plug#end()

"========================================
" 3. Plug Settings

"# vim-minimap
let g:minimap_auto_start = 0

"# vim-colorschemes
colorscheme OceanicNext
"colorscheme Atelier_SeasideLight
"colorscheme antares

"# NerdTree
" Starting NERDTree by pressing <SPACE>
let NERDTreeMapActivateNode = '<SPACE>' 
" Open NERDTree if vim'ed directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
" NERDTree at left side
let g:NERDTREEWinPos = "Left"

"# lightline
" always show lightline
set laststatus=2
" lightline config
let g:lightline ={
	\ 'colorscheme': 'wombat',
	\ 'active': {
	\	'left': [ [ 'mode','paste'],
	\		  [ 'readonly', 'filename', 'modified', 'charvaluehex' ] ]
	\ },
	\ 'component': {
	\	'charvaluehex': '0x%B'
	\ },
	\ }

"# tagbar
nmap <F8> :TagbarToggle<CR>

"# ultisnips
" change TAB(default) into c-s, prevent collision from YouCompleteMe
let g:UltiSnipsExpandTrigger="<c-s>"

"# deoplete
let g:deoplete#enable_at_startup = 1

" 4. Key Remapping
" Empty for now!


