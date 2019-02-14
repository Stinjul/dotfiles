set -x MANPAGER "nvim -c 'set ft=man' -"
set -x EDITOR "nvim"
set -x TERMINAL "kitty"
set -x BROWSER "firefox"
set -x VIRTUAL_ENV_DISABLE_PROMPT 1
set -x TEXINPUT .:/home/stan/Documents/School/templates/:$TEXINPUT

set -g theme_display_user no
set -g theme_display_hostname no
set -g theme_color_scheme terminal-dark
set -g theme_nerd_fonts yes

fish_vi_key_bindings

alias texclean='~/scripts/clean-latex.sh'
alias pipes='~/scripts/pipes.sh'
function rmdDoc
    cp ~/Documents/School/templates/tmTemplateDoc.rmd $argv
    nvim $argv
end
funcsave rmdDoc

alias toggle 'mpc toggle'
alias next 'mpc next'
alias prev 'mpc prev'
alias stop 'mpc stop'
alias shuffle 'mpc shuffle'
alias playMain 'mpc load Main ; mpc shuffle ; mpc play'

alias musicPlayer 'ncmpcpp -s visualizer -S playlist'

#alias pipUpdate 'pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U'
