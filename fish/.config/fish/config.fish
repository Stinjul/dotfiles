set -x PATH $PATH /usr/local/bin $HOME/.local/bin /opt/bin

set -g theme_display_user yes
set -g theme_display_hostname yes
set -g theme_color_scheme terminal-dark
set -g TEXINPUT .:/home/stan/Documents/School/templates/:$TEXINPUT

alias texclean='~/scripts/clean-latex.sh'
alias pipes='~/scripts/pipes.sh'
function rmdDoc
	cp ~/Documents/School/templates/tmTemplateDoc.rmd $argv
	vim $argv
end
funcsave rmdDoc

alias toggle 'mpc toggle'
alias next 'mpc next'
alias prev 'mpc prev'
alias stop 'mpc stop'
alias shuffle 'mpc shuffle'
alias playMain 'mpc load Main ; mpc shuffle ; mpc play'

alias musicPlayer 'ncmpcpp -s visualizer -S playlist'
