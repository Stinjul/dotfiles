#!/bin/env bash
shopt -s globstar
grep -Ril "CONFIG_CHECK" /var/db/pkg/**/*.ebuild | xargs -I{} ebuild {} setup clean | less #grep --color=always 'CONFIG_[A-Za-z_]*'
