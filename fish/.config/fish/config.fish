set -x PATH $PATH /usr/local/bin

set -g theme_display_user yes
set -g theme_display_hostname yes
set -g theme_color_scheme terminal-dark

alias texclean='~/scripts/clean-latex.sh'
alias pipes='~/scripts/pipes.sh'

alias toggle 'mpc toggle'
alias next 'mpc next'
alias prev 'mpc prev'
alias stop 'mpc stop'
alias shuffle 'mpc shuffle'
alias playMain 'mpc load Main ; mpc shuffle ; mpc play'

alias musicPlayer 'ncmpcpp -s visualizer -S playlist'
