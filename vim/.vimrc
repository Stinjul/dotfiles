execute pathogen#infect()
execute pathogen#helptags()

set nocompatible
set backspace=indent,eol,start
set autoindent
set history=50
set ruler
set showcmd
set incsearch
set cul
set more
set scrolloff=3
set vb t_vb=
set backup
syntax on

" Autocomplete
set wildmode=longest,list,full
set wildmenu

" Enable relativenumber only on focused window
set number relativenumber
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave	* set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter		* set norelativenumber
augroup END

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" Toggle spellcheck
map <F6> :setlocal spell! spelllang=en_gb,en_us,nl<CR>

" No newline comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
