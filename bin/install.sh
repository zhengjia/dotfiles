dir=~/dotfiles
files="bashrc bash_profile bash_env bash_alias vimrc vim gitignore ackrc gitconfig tmux.conf ctags emacs gemrc"

for file in $files; do
  if [[ ! -L ~/.$file ]]; then
    ln -fs $dir/$file ~/.$file
  fi
done

git clone http://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
