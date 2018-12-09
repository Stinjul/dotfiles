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
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4


" Autocomplete
set wildmode=longest,list,full
set wildmenu


" Figure out the system Python for Neovim.
" From https://github.com/neovim/neovim/issues/1887#issuecomment-280653872
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
else
    let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
endif


" Deoplete
let g:deoplete#enable_at_startup = 1
" Tab scroll
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Close preview after insertion
augroup DeopleteTab
    autocmd!
    autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
augroup END


" LC-neovim
let g:LanguageClient_serverCommands = {
    \ 'sh': ['bash-language-server', 'start'],
    \ 'javascript': ['javascript-typescript-stdio'],
    \ 'javascript.jsx': ['javascript-typescript-stdio'],
    \ 'python': ['pyls']
    \ }
let g:LanguageClient_autoStart = 1
let g:LanguageClient_diagnosticsDisplay = {
  \1: {'name': 'Error', 'texthl': 'Normal', 'signText': '✖', 'signTexthl': 'Error',},
  \2: {'name': 'Warning', 'texthl': 'Normal', 'signText': '⚠', 'signTexthl': 'Todo',},
  \3: {'name': 'Information', 'texthl': 'Normal', 'signText': 'ℹ', 'signTexthl': 'Todo',},
  \4: {'name': 'Hint', 'texthl': 'Normal', 'signText': 'ℹ', 'signTexthl': 'Todo',},
  \}

" grammarous
let g:grammarous#show_first_error=1
map <F7> :GrammarousCheck --lang=
"let g:grammarous#disabled_categories = {'*' : ['TYPOS']}
let g:grammarous#disabled_rules = {'*' : ['MORFOLOGIK_RULE_NL_NL']}
"let g:grammarous#enable_spell_check=0


" Colorizer
let g:colorizer_auto_filetype='css,html'


" Enable relativenumber only on focused window
set number relativenumber
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave    * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter      * set norelativenumber
augroup END


" Toggle spellcheck
map <F6> :setlocal spell! spelllang=en_gb,nl<CR>


" No newline comment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


" disable pandoc auto-spellcheck (why)
let g:pandoc#modules#disabled = ["spell"]


" refresh mupdf
"command RefreshMuPDF silent !xdotool key --window $(xdotool search --pid $(ps -C mupdf -o pid=)) r
command RefreshMuPDF silent !xdotool key --window $(xdotool search --name %:t:r.pdf ) r


" SudoWrite
command -nargs=0 Sw w !sudo tee % > /dev/null


" Airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
let g:airline_theme='myterm'
let g:airline_symbols.branch = ''
let g:airline_symbols.notexists = ''
set noshowmode


" Colors
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
augroup BibCmds
    autocmd!
    autocmd FileType bib inoremap ;a @article{<Enter>author<Space>=<Space>"<++>",<Enter>year<Space>=<Space>"<++>",<Enter>title<Space>=<Space>"<++>",<Enter>journal<Space>=<Space>"<++>",<Enter>volume<Space>=<Space>"<++>",<Enter>pages<Space>=<Space>"<++>",<Enter>}<Enter><++><Esc>8kA,<Esc>i
    autocmd FileType bib inoremap ;b @book{<Enter>author<Space>=<Space>"<++>",<Enter>year<Space>=<Space>"<++>",<Enter>title<Space>=<Space>"<++>",<Enter>publisher<Space>=<Space>"<++>",<Enter>}<Enter><++><Esc>6kA,<Esc>i
    autocmd FileType bib inoremap ;c @incollection{<Enter>author<Space>=<Space>"<++>",<Enter>title<Space>=<Space>"<++>",<Enter>booktitle<Space>=<Space>"<++>",<Enter>editor<Space>=<Space>"<++>",<Enter>year<Space>=<Space>"<++>",<Enter>publisher<Space>=<Space>"<++>",<Enter>}<Enter><++><Esc>8kA,<Esc>i
augroup END


"""LATEX
augroup LatexCmds
    autocmd!
    " Word count:
    autocmd FileType tex map <F3> :w !detex \| wc -w<CR>
    autocmd FileType tex inoremap <F3> <Esc>:w !detex \| wc -w<CR>
    " Compile document using luatex:
    autocmd FileType tex inoremap <F5> <Esc>:w<Enter>:!lualatex<space><c-r>%<Enter>:RefreshMuPDF<Enter>:startinsert<Enter>
    autocmd FileType tex nnoremap <F5> :w<Enter>:!lualatex<space><c-r>%<Enter>:RefreshMuPDF<Enter>
augroup END


"MARKDOWN
augroup MarkdownCmds
    autocmd!
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
augroup END
