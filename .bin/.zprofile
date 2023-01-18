arch -arm64 uname -m # Apple SiliconでないMacの場合、arm64アーキテクチャがないため、エラーに
if [[ $? == 0 ]]; then
  # Apple Silicon
  echo "arm64"
  eval "$($HOME/.homebrew/bin/brew shellenv)"
else
  # Intel Mac
  echo "x86_64"
  eval "$(/usr/local/bin/brew shellenv)"
fi

eval "$(rbenv init -)"

PATH=$PATH:$HOME/.nodebrew/current/bin