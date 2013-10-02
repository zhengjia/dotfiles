dir=~/dotfiles
files="bashrc bash_profile vimrc vim gitignore ackrc gitconfig"

for file in $files; do
  ln -s $dir/$file ~/.$file
done
