# Defined in /home/stan/.config/fish/config.fish @ line 13
function rmdDoc
	cp ~/Documents/School/templates/tmTemplateDoc.rmd $argv
	vim $argv
end
