"=======================================
" vimrc CONFIGURATION
"=======================================
" Maintainer
"   - beankuu@gmail.com

" 0.Vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    "Visual
    Plugin 'itchyny/lightline.vim'          "Statusline plugin
    Plugin 'bling/vim-bufferline'           "Command line Buffer
    Plugin 'flazz/vim-colorschemes'         "ColorScneme
    Plugin 'scrooloose/nerdtree'            "File Browser [{Space}]
    Plugin 'majutsushi/tagbar'              "File Structure overview [{F8}]
    Plugin 'iamcco/markdown-preview.vim'    "Markdown Preview [:MarkdownPreview]
    Plugin 'xuhdev/vim-latex-live-preview'  "LaTex Preview
    "Helper
    Plugin 'plasticboy/vim-markdown'        "Markdown Syntax Highlight
    Plugin 'lervag/vimtex'                  "LaTeX support
    Plugin 'w0rp/ale'                       "Linter
    Plugin 'airblade/vim-gitgutter'         "Git diff
    "Commands
    Plugin 'junegunn/fzf'                   "Fuzzy finder
    Plugin 'Valloric/YouCompleteMe'         "Code Completion [GoToInclude/...]
    Plugin 'SirVer/ultisnips'               "Snippets [c-s]
    Plugin 'mattn/emmet-vim'                "Emmet Snippets [c-y]
    Plugin 'tpope/vim-commentary'           "Commenting [gcc/gc]
    Plugin 'tpope/vim-fugitive'             "Git Wrapper [Gedit]
    Plugin 'tpope/vim-surround'             "Surroundings [cs]
    Plugin 'tpope/vim-repeat'               "Repeat command [.+tab]
    Plugin 'tommcdo/vim-lion'               "Aligning Text [gl/GL]
    Plugin 'vimwiki/vimwiki'                "Wiki for Vim [\ww]
call vundle#end()
syntax enable
filetype plugin indent on

" 1. Basic Settings
" indent,tab = 4 spaces
set softtabstop=4   " tab inserts 4 spaces
set tabstop=4       " show existing tab with 4 spaces width
set shiftwidth=4    " when indenting with '>', use 4 spaces width
set expandtab       " On pressing tab, insert 4 spaces

set nu              "number at left
set hlsearch        "highlight search
set encoding=utf-8  "force encoding to utf-8


" 2. Plugin Settings

" vim-colorschemes
colorscheme material

" NerdTree
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
