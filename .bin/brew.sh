#!/bin/zsh

if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

export PATH="$HOME/.homebrew/bin:$PATH"


if [[ "$env" == "dev" ]] ; then
	echo "env: $env"
	brew bundle --file=~/.Brewfile.dev
else
	brew bundle --global
fi
