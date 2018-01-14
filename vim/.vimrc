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

set number relativenumber
augroup numbertoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave	* set relativenumber
	autocmd BufLeave,FocusLost,InsertEnter		* set norelativenumber
augroup END

if has("vms")
	set nobackup
else
	set backup
endif

if &t_Co > 2 || has("gui_running")
	syntax on
	set hlsearch
endif

inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d
