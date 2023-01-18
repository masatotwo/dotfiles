#!/bin/zsh

if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

export PATH="$HOME/.homebrew/bin:$PATH"

brew bundle --global
