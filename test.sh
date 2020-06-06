#!/usr/bin/env bash

# Use privileged mode and avoid $CDPATH
set -p
set -e

if [[ ! -d ./_vader.vim ]]; then
	git clone https://github.com/junegunn/vader.vim ./_vader.vim
# Uncomment the else clause sometimes to make sure I'm up to date.
# else
# 	cd "$(pwd)/_vader.vim"
# 	git remote update -p && git merge --ff-only "@{u}"
# 	cd -
fi

if [[ ! -d ./_vtou ]]; then
	git clone https://github.com/kana/vim-textobj-user ./_vtou
# Uncomment the else clause sometimes to make sure I'm up to date.
# else
# 	cd "$(pwd)/_vtou"
# 	git remote update -p && git merge --ff-only "@{u}"
# 	cd -
fi


: "${VADER_TEST_VIM:=vim}"
$VADER_TEST_VIM -es --clean -Nu vimrc -c '+Vader! test/basics.vader'

$VADER_TEST_VIM -es --clean -Nu no-mappings-vimrc \
	-c '+Vader! test/mappings.vader'
