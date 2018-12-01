# Defined in /home/stan/.config/fish/config.fish @ line 15
function rmdDoc
	cp ~/Documents/School/templates/tmTemplateDoc.rmd $argv
	nvim $argv
end
