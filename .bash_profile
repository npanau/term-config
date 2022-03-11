# Taille de l'historique
HISTFILESIZE=1000000000000

# Aliases
source ~/.bash_alias

# Prompt line
source ~/.bash_prompt

# Git autocomplete
source ~/.git-completion.sh

export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH


[ -s "/Users/nico/.scm_breeze/scm_breeze.sh" ] && source "/Users/nico/.scm_breeze/scm_breeze.sh"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
