" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"" Plugins start
Plugin 'flazz/vim-colorschemes'
Plugin 'itchyny/lightline.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'plasticboy/vim-markdown'

Plugin 'lervag/vimtex'
Plugin 'xuhdev/vim-latex-live-preview'
Plugin 'junegunn/fzf'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-projectionist'
Plugin 'justmao945/vim-clang'
Plugin 'mattn/emmet-vim'
Plugin 'w0rp/ale'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
Plugin 'honza/vim-snippets'
Plugin 'amiorin/vim-project'
""Plugins end

call vundle#end()
syntax enable
filetype plugin indent on

" vim-colorschemes
colorscheme material

" NerdTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-n> :NERDTreeToggle<CR>
let g:NERDTREEWinPos = "Left"

" lightline
set laststatus=2
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
" tab = 4 spaces
filetype plugin indent on
set tabstop=4 " show existing tab with 4 spaces width
set shiftwidth=4 " when indenting with '>', use 4 spaces width
set expandtab " On pressing tab, insert 4 spaces

" number at left
set nu
