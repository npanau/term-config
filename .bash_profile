# Taille de l'historique
HISTFILESIZE=1000000000000

# Aliases
source ~/.bash_alias

# Prompt line
source ~/.bash_prompt

# Git autocomplete
source ~/.git-completion.sh

#todo.txt
##todo-cli files in ~/Dropbox/todo/
#export TODOTXT_DEFAULT_ACTION=ls
#source ~/Dropbox/todo/todo_completion
#complete -F _todo t
#PATH=$PATH:"/Users/nico/Dropbox/todo"

export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH


[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

[ -s "/Users/nico/.scm_breeze/scm_breeze.sh" ] && source "/Users/nico/.scm_breeze/scm_breeze.sh"
