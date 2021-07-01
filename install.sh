#!/bin/bash

dotdir=$(cd $(dirname $0) && pwd)

if [ "$(which brew)" ]; then
  brew bundle check || brew bundle
fi

for filename in $(find $dotdir -name "*.symlink"); do
  ln -sf $filename ~/.$(basename $filename | sed "s/\.symlink//")
done

if [[ "$(which code)" && $(uname -s) = "Darwin" ]]; then
  ln -sv "$dotdir/vscode/settings.json" "$HOME/Library/Application Support/Code/User/settings.json"
  ln -sv "$dotdir/vscode/keybindings.json" "$HOME/Library/Application Support/Code/User/keybindings.json"
fi