dir=~/dotfiles
files="bashrc bash_profile bash_env vimrc vim gitignore ackrc gitconfig tmux.conf ctags emacs gemrc"

for file in $files; do
  if [[ ! -L ~/.$file ]]; then
    ln -s $dir/$file ~/.$file
  fi
done

git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
