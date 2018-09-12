execute pathogen#infect()
execute pathogen#helptags()

set shell=/bin/bash
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

"Show certain chars
set listchars=nbsp:␣

" Tabs
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" Autocomplete
set wildmode=longest,list,full
set wildmenu

" Deoplete
let g:deoplete#enable_at_startup = 1

" Colorizer
let g:colorizer_auto_color=1

" Enable relativenumber only on focused window
set number relativenumber
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave    * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter      * set norelativenumber
augroup END

" Toggle spellcheck
map <F6> :setlocal spell! spelllang=en_gb,en_us,nl<CR>

" No newline comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

"disable pandoc auto-spellcheck (why)
let g:pandoc#modules#disabled = ["spell"]

"refresh mupdf
command RefreshMuPDF silent !xdotool key --window $(xdotool search --pid $(ps -C mupdf -o pid=)) r

"SudoWrite
command -nargs=0 Sw w !sudo tee % > /dev/null

"Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='term'
set noshowmode

"Colors
hi VertSplit ctermfg=3
set fillchars+=vert:┃
hi StatusLine ctermfg=233
hi StatusLineNC ctermfg=233
hi SpellBad ctermbg=9
hi SpellCap ctermbg=12
hi SpellLocal ctermbg=14
hi SpellRare ctermbg=13


" Luke smith .vimrc stuff
" https://github.com/LukeSmithxyz/voidrice/blob/master/.vimrc

" Navigating with guides
    inoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
    vnoremap <Space><Tab> <Esc>/<++><Enter>"_c4l
    map <Space><Tab> <Esc>/<++><Enter>"_c4l
inoremap ;gui <++>

""".bib
    autocmd FileType bib inoremap ;a @article{<Enter>author<Space>=<Space>"<++>",<Enter>year<Space>=<Space>"<++>",<Enter>title<Space>=<Space>"<++>",<Enter>journal<Space>=<Space>"<++>",<Enter>volume<Space>=<Space>"<++>",<Enter>pages<Space>=<Space>"<++>",<Enter>}<Enter><++><Esc>8kA,<Esc>i
    autocmd FileType bib inoremap ;b @book{<Enter>author<Space>=<Space>"<++>",<Enter>year<Space>=<Space>"<++>",<Enter>title<Space>=<Space>"<++>",<Enter>publisher<Space>=<Space>"<++>",<Enter>}<Enter><++><Esc>6kA,<Esc>i
    autocmd FileType bib inoremap ;c @incollection{<Enter>author<Space>=<Space>"<++>",<Enter>title<Space>=<Space>"<++>",<Enter>booktitle<Space>=<Space>"<++>",<Enter>editor<Space>=<Space>"<++>",<Enter>year<Space>=<Space>"<++>",<Enter>publisher<Space>=<Space>"<++>",<Enter>}<Enter><++><Esc>8kA,<Esc>i

"""LATEX
    " Word count:
    autocmd FileType tex map <F3> :w !detex \| wc -w<CR>
    autocmd FileType tex inoremap <F3> <Esc>:w !detex \| wc -w<CR>
    " Compile document using luatex:
    autocmd FileType tex inoremap <F5> <Esc>:w<Enter>:!lualatex<space><c-r>%<Enter>:RefreshMuPDF<Enter>:startinsert<Enter>
    autocmd FileType tex nnoremap <F5> :w<Enter>:!lualatex<space><c-r>%<Enter>:RefreshMuPDF<Enter>

"MARKDOWN
    autocmd Filetype markdown,rmd inoremap ;n ---<Enter><Enter>
    autocmd Filetype markdown,rmd inoremap ;b ****<++><Esc>F*hi
    autocmd Filetype markdown,rmd inoremap ;s ~~~~<++><Esc>F~hi
    autocmd Filetype markdown,rmd inoremap ;e **<++><Esc>F*i
    autocmd Filetype markdown,rmd inoremap ;h ====<Space><++><Esc>F=hi
    autocmd Filetype markdown,rmd inoremap ;i ![](<++>)<++><Esc>F[a
    autocmd Filetype markdown,rmd inoremap ;a [](<++>)<++><Esc>F[a
    autocmd Filetype markdown,rmd inoremap ;1 #<Space><Enter><++><Esc>kA
    autocmd Filetype markdown,rmd inoremap ;2 ##<Space><Enter><++><Esc>kA
    autocmd Filetype markdown,rmd inoremap ;3 ###<Space><Enter><++><Esc>kA
    autocmd Filetype markdown,rmd inoremap ;l --------<Enter>
    autocmd Filetype markdown map <F5> :!pandoc<space><C-r>%<space>-o<space><C-r>%.pdf<Enter><Enter>
    "autocmd Filetype rmd map <F5> :w<Enter>:!echo<space>"require(rmarkdown);<space>render('<c-r>%',intermediates_dir<space>=<space>'~/Documents/School/templates/')"<space>\|<space>R<space>--vanilla<enter>:RefreshMuPDF<Enter>
    "autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
    autocmd Filetype rmd map <F5> :w<Enter>:!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>:RefreshMuPDF<Enter>
    autocmd Filetype rmd inoremap ;r ```{r,<space>echo=TRUE}<CR>```<CR><CR><esc>2kO

