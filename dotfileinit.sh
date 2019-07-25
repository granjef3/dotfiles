git init --bare $HOME/.cfg && echo "created git repo"

alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config config --local alias.update 'add -u'
echo "alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'" >> $HOME/.zshrc && echo "added alias"

source $HOME/.zshrc
config remote add origin git@github.com:granjef3/dotfiles.git && echo "added remote. Done!"
