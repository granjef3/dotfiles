#!/bin/zsh
ALIAS_CMD="alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'"
PROFILE="$HOME/.zshrc"

echo ".fileinit -- using alias cmd $ALIAS_CMD"
echo ".fileinit -- using profile $PROFILE"

git init --bare $HOME/.cfg

eval $ALIAS_CMD && echo ".fileinit -- config command now available"

config config --local status.showUntrackedFiles no && echo ".fileinit -- hiding untracked files (you want this!)"
config config --local alias.update 'add -u' && echo ".fileinit -- added config update = config add -u alias"

if ! grep -q "$ALIAS_CMD" "$PROFILE" ; then
  echo $ALIAS_CMD >> $HOME/.zshrc && echo ".fileinit -- added alias";
fi

ORIGIN_URL="git@github.com:granjef3/dotfiles.git"

if config remote | grep -wq origin ; then
  echo ".fileinit -- updating origin remote since already exists..."
  config remote set-url origin $ORIGIN_URL
else
  echo ".fileinit -- adding origin remote"
  config remote add origin $ORIGIN_URL
fi
