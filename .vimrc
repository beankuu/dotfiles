"=======================================
" vimrc CONFIGURATION
"=======================================
" Maintainer
"   - beankuu@gmail.com

" 0.vim-plug
call plug#begin('~/.vim/plugged')
    "Visual
    Plug 'itchyny/lightline.vim'          "Statusline plugin
    Plug 'bling/vim-bufferline'           "Command line Buffer
    Plug 'flazz/vim-colorschemes'         "ColorScneme
    Plug 'scrooloose/nerdtree'            "File Browser [{Space}]
    Plug 'majutsushi/tagbar'              "File Structure overview [{F8}]
   
   "Documents 
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'}   "Markdown Preview [:MarkdownPreview]
    Plug 'xuhdev/vim-latex-live-preview'  "LaTex Preview
    Plug 'shime/vim-livedown'             "Livedown Markdown Plugin
    Plug 'vim-pandoc/vim-pandoc'          "pandoc document integration

    "Helper
    Plug 'plasticboy/vim-markdown'        "Markdown Syntax Highlight
    Plug 'vim-pandoc/vim-pandoc-syntax'   "pandoc syntax support
    Plug 'lervag/vimtex'                  "LaTeX support
    Plug 'w0rp/ale'                       "Linter
    Plug 'airblade/vim-gitgutter'         "Git diff
    Plug 'liuchenxu/vim-clap'             "interactive finder and dispatcher

    "Commands
    Plug 'junegunn/fzf'                   "Fuzzy finder
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

" 1. Basic Settings
syntax enable
filetype plugin indent on
set nu              "number at left
set hlsearch        "highlight search
set encoding=utf-8  "force encoding to utf-8


"# indent,tab = 4 spaces
set softtabstop=4   " tab inserts 4 spaces
set tabstop=4       " show existing tab with 4 spaces width
set shiftwidth=4    " when indenting with '>', use 4 spaces width
set expandtab       " On pressing tab, insert 4 spaces

" 2. Plug Settings

"# vim-colorschemes
colorscheme OceanicNext
"colorscheme Atelier_SeasideLight
"colorscheme antares

"# NerdTree
"" Starting NERDTree by pressing <SPACE>
let NERDTreeMapActivateNode = '<SPACE>' 
"" Open NERDTree if vim'ed directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
"" NERDTree at left side
let g:NERDTREEWinPos = "Left"

" lightline
"" always show lightline
set laststatus=2
"" lightline config
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

" tagbar
nmap <F8> :TagbarToggle<CR>

" ultisnips
"" change TAB(default) into c-s, prevent collision from YouCompleteMe
let g:UltiSnipsExpandTrigger="<c-s>"

" deoplete
let g:deoplete#enable_at_startup = 1

