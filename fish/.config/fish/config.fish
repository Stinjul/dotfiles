set -x PATH $PATH /usr/local/bin $HOME/.local/bin /opt/bin
set -gx MANPAGER "nvim -c 'set ft=man' -"
set -gx EDITOR "nvim"
set -gx TERMINAL "kitty"

set -g theme_display_user yes
set -g theme_display_hostname yes
set -g theme_color_scheme terminal-dark
set -g TEXINPUT .:/home/stan/Documents/School/templates/:$TEXINPUT

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

alias pipUpdate 'pip list --outdated --format=freeze | grep -v '^\-e' | cut -d = -f 1  | xargs -n1 pip install -U'
