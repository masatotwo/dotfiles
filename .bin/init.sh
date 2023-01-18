#!/bin/zsh

if [ "$(uname)" != "Darwin" ] ; then
	echo "Not macOS!"
	exit 1
fi

# Install xcode
if ! type "xcode-select" > /dev/null; then
  xcode-select --install > /dev/null
fi

# Install brew
# 複数ユーザで問題が起こらないよう、/usr/localではなく~/.homebrew/にhomebrewをインストールする。
# https://qiita.com/rinchsan/items/de021e32fc3967741f67
# https://tech.gootablog.com/article/homebrew-userhomedir/
if [ ! -d ${HOME}/.homebrew/bin ] ; then
  mkdir ${HOME}/.homebrew
  curl -L https://github.com/Homebrew/brew/tarball/master | tar xz --strip 1 -C ${HOME}/.homebrew
  # /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# ~ の展開でハマった
# @see https://note.com/skaneda/n/n2958ca235c29
# Install oh-my-zsh
if [ ! -d ~/.oh-my-zsh ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
fi
# Install oh-my-zsh theme
if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel9k ] ; then
  git clone https://github.com/bhilburn/powerlevel9k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel9k
fi
# Install zsh plugins
if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting ] ; then
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi
if [ ! -d ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions ] ; then
  git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi