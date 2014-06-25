shopt -s histappend

rake() {
  if [[ -e ./Gemfile ]] && which bundle; then
    #echo "using bundle exec"
    bundle exec rake "$@"
  else
    #echo "not using bundle exec"
    command rake "$@"
  fi
}

# cd into current directory in finder
function ff { osascript -e 'tell application "Finder"'\
 -e "if (${1-1} <= (count Finder windows)) then"\
 -e "get POSIX path of (target of window ${1-1} as alias)"\
 -e 'else' -e 'get POSIX path of (desktop as alias)'\
 -e 'end if' -e 'end tell'; };\
function cdff { cd "`ff $@`"; };

if [[ -s /Users/zjia/.rvm/scripts/rvm ]] ; then source /Users/zjia/.rvm/scripts/rvm ; fi

# in 10.8 bashrc isn't sourced
[[ -r ~/.bashrc ]] && source ~/.bashrc

[[ -r ~/.bash_env ]] && source ~/.bash_env
[[ -r ~/.bash_alias ]] && source ~/.bash_alias
