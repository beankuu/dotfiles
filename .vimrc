" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

Plugin 'plasticboy/vim-markdown'
Plugin 'iamcco/markdown-preview.vim'
Plugin 'lervag/vimtex'
Plugin 'xuhdev/vim-latex-live-preview'


Plugin 'junegunn/fzf'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-projectionist'
Plugin 'justmao945/vim-clang'
Plugin 'mattn/emmet-vim'
Plugin 'w0rp/ale'
Plugin 'airblade/vim-gitgutter'
Plugin 'majutsushi/tagbar'
Plugin 'honza/vim-snippets'
Plugin 'flazz/vim-colorschemes'
Plugin 'amiorin/vim-project'

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
