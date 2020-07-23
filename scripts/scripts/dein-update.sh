#!/usr/bin/env bash

nvim -u ~/.vimrc -c "try | call dein#update() | finally | qall! | endtry" -V1 -es
