shopt -s histappend

alias r='rails'
alias be='bundle exec'
alias rc='r c'
alias rs='rails s'
alias rsd='rails s --debugger'

# Git
alias gc='git commit -a -m'
alias gs='git status'
alias gpush='git push'
alias gpull='git pull'
alias ga='git add --all'
alias gd='git diff'
alias gco='git checkout'

alias ghistory='git rev-list --all | xargs git grep'
alias greset='git reset --hard HEAD'
alias ggraph="git log --graph --pretty=format:'%Cred%h%Creset %aN -%C(yellow)%d%Creset %s %Cgreen(%cr)%Creset' --abbrev-commit --date=relative"
alias gunstage="git reset HEAD"
alias gdeletebranch='git branch --merged | grep -v "\*" | xargs -n 1 git branch -d'

alias c='cd ..'
alias la='ls -la'
alias ls="ls -GFp"

alias r='rails'

alias pg="ps -ef | grep"
alias openport='sudo lsof -i -P | grep -i "listen"'
alias gpushup="git push --set-upstream origin" # plus name_of_branch
alias pp="bundle exec pry -r ./config/environment"

# alias vi='/Applications/MacVim.app/Contents/MacOS/Vim'

alias gitshort='git log --pretty=oneline --abbrev-commit'
alias pgstart='pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start'

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
