" Dein stuff
if &compatible
    set nocompatible
endif

set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')
    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')

    " Filtypes
    "" Gentoo files
    call dein#add('gentoo/gentoo-syntax')
    "" R
    "" replaced by polyglot
    " call dein#add('jalvesaq/Nvim-R')
    "" Fish
    "" replaced by polyglot
    " call dein#add('dag/vim-fish')
    "" Pandoc markdown and RMarkdown
    call dein#add('vim-pandoc/vim-pandoc')
    call dein#add('vim-pandoc/vim-pandoc-syntax')
    call dein#add('vim-pandoc/vim-rmarkdown')
    "" Powershell
    "" replaced by polyglot
    " call dein#add('PProvost/vim-ps1')
    "" Sxhkd
    call dein#add('kovetskiy/sxhkd-vim')
    "" Ansible YML
    "call dein#add('pearofducks/ansible-vim')
    "" C# extended support
    "" replaced by polyglot
    "call dein#add('OrangeT/vim-csharp')

    " Git stuff
    call dein#add('tpope/vim-fugitive')
    call dein#add('airblade/vim-gitgutter')

    " Statusline
    call dein#add('vim-airline/vim-airline')
    call dein#add('vim-airline/vim-airline-themes')

    " Languageserver and autocompletion
    call dein#add('neoclide/coc.nvim', {'merged': 0, 'rev': 'release'})
    "" LSP symbol and tag viewer
    call dein#add('liuchengxu/vista.vim')
    "" C# langserver
    "" replaced by coc-omnisharp
    " call dein#add('OmniSharp/omnisharp-vim')
    "" Multilanguage support
    call dein#add('sheerun/vim-polyglot')

    " Snippets
    call dein#add('honza/vim-snippets')

    " Misc
    "" Denite (like fzf, ctrlp, unite, ...)
    
    "" Argumant wrapping
    call dein#add('FooSoft/vim-argwrap')
    "" Grammar checker
    call dein#add('rhysd/vim-grammarous')
    "" Surrounding tags manipulation
    call dein#add('machakann/vim-sandwich')
    "" (R)markdown table manipulation
    call dein#add('dhruvasagar/vim-table-mode', {"on_ft" : ['md', 'rmd', 'markdown', 'rmarkdown']})
    "" Discord status
    call dein#add('ananagame/vimsence')
    "" Read local editor config files
    call dein#add('editorconfig/editorconfig-vim')

    call dein#end()
    call dein#save_state()
endif

if dein#check_install()
    call dein#install()
endif

" (Neo)vim settings
if has('win32')
    "set shell=powershell.exe
    "set shellcmdflag=-NoProfile\ -NoLogo\ -NonInteractive\ -Command
else
    set shell=/bin/bash
endif
set backspace=indent,eol,start
set autoindent
set smartindent
set history=50
set ruler
set showcmd
set incsearch
set cul
set more
set scrolloff=3
set vb t_vb=
set backup
set updatetime=300
filetype plugin indent on
syntax enable

"Show certain chars
set listchars=nbsp:␣,tab:>␣,trail:~
set list

" Tabs
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4

" Autocomplete
set wildmode=longest,list,full
set wildmenu

" Leader
let mapleader=","

" Colors
colorscheme peachpuff
hi VertSplit ctermfg=3
set fillchars+=vert:┃
hi StatusLine ctermfg=233
hi StatusLineNC ctermfg=233
hi SpellBad ctermbg=9
hi SpellCap ctermbg=12
hi SpellLocal ctermbg=14
hi SpellRare ctermbg=13

" Enable relativenumber only on focused window
set number relativenumber
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave    * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter      * set norelativenumber
augroup END


" Toggle spellcheck
map <F6> :setlocal spell! spelllang=en_gb,nl<CR>

" Figure out the system Python for Neovim.
" From https://github.com/neovim/neovim/issues/1887#issuecomment-280653872
if exists("$VIRTUAL_ENV")
    let g:python3_host_prog=substitute(system("which -a python3 | head -n2 | tail -n1"), "\n", '', 'g')
else
    if has('win32')
        let g:python3_host_prog=substitute(system("where python"), "\n", '', 'g')
    else
        let g:python3_host_prog=substitute(system("which python3"), "\n", '', 'g')
    endif
endif

" Fix python reindent
autocmd FileType python setlocal equalprg=

" CoC
let g:coc_global_extensions = ['coc-html', 'coc-css', 'coc-snippets', 'coc-prettier', 'coc-eslint', 'coc-tsserver', 'coc-json', 'coc-python', 'coc-highlight', 'coc-lists', 'coc-stylelint', 'coc-r-lsp', 'coc-ccls', 'coc-omnisharp', 'coc-yaml', 'coc-java', 'coc-metals']

" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'


nmap <leader>qf <Plug>(coc-fix-current)


" OmniSharp
let g:OmniSharp_server_stdio = 1
"let g:OmniSharp_proc_debug = 1
"let g:OmniSharp_loglevel = 'debug'


" Vista
let g:vista_default_executive = 'ctags'
let g:vista_fzf_preview = ['right:50%']

let g:vista_executive_for = {
  \ 'javascript': 'ctags',
  \ 'javascript.jsx': 'coc',
  \ 'python': 'coc',
  \ }


" grammarous
"let g:grammarous#show_first_error=1
map <F7> :GrammarousCheck --lang=
"let g:grammarous#disabled_categories = {'*' : ['TYPOS']}
let g:grammarous#disabled_rules = {'*' : ['MORFOLOGIK_RULE_NL_NL']}
"let g:grammarous#enable_spell_check=0


" argwrap
nnoremap <silent> <leader>a :ArgWrap<CR>


" disable pandoc auto-spellcheck (why)
let g:pandoc#modules#disabled = ["spell"]


" Airline
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_powerline_fonts = 1
let g:airline_theme='myterm'
let g:airline_symbols.branch = ''
let g:airline_symbols.notexists = ''
let g:airline#extensions#wordcount#filetypes =
            \ ['asciidoc', 'help', 'mail', 'markdown', 'org', 'rst', 'tex', 'text', 'rmd']
let g:airline#extenions#coc#enabled = 1
set noshowmode


" Table Mode
let g:table_mode_corner_corner='+'
let g:table_mode_header_fillchar='='

" Editorconfig
let g:Editorconfig_exclude_patterns = ['fugitive://.*']

" refresh mupdf
"command RefreshMuPDF silent !xdotool key --window $(xdotool search --pid $(ps -C mupdf -o pid=)) r
command RefreshMuPDF silent !xdotool key --window $(xdotool search --name %:t:r.pdf ) r

"""LATEX
augroup LatexCmds
    autocmd!
    " Compile document using luatex:
    autocmd FileType tex inoremap <F5> <Esc>:w<Enter>:!lualatex<space><c-r>%<Enter>:RefreshMuPDF<Enter>:startinsert<Enter>
    autocmd FileType tex nnoremap <F5> :w<Enter>:!lualatex<space><c-r>%<Enter>:RefreshMuPDF<Enter>
augroup END

"MARKDOWN
augroup MarkdownCmds
    autocmd!
    autocmd Filetype markdown map <F5> :!pandoc<space><C-r>%<space>-o<space><C-r>%.pdf<Enter><Enter>
    "autocmd Filetype rmd map <F5> :w<Enter>:!echo<space>"require(rmarkdown);<space>render('<c-r>%',intermediates_dir<space>=<space>'~/Documents/School/templates/')"<space>\|<space>R<space>--vanilla<enter>:RefreshMuPDF<Enter>
    "autocmd Filetype rmd map <F5> :!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>
    autocmd Filetype rmd map <F5> :w<Enter>:!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>:RefreshMuPDF<Enter>
    autocmd Filetype rmd inoremap ;r ```{r,<space>echo=TRUE}<CR>```<CR><CR><esc>2kO
augroup END
