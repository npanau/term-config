# Taille de l'historique
HISTFILESIZE=1000000000000

# Aliases
source ~/.bash_alias

# Prompt line
source ~/.bash_prompt

# Git autocomplete
source ~/.git-completion.sh

export PATH=/opt/homebrew/bin:$PATH
export PATH=/usr/local/sbin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$PATH:/usr/local/sbin


[ -s "/Users/nico/.scm_breeze/scm_breeze.sh" ] && source "/Users/nico/.scm_breeze/scm_breeze.sh"


export ANSIBLE_VAULT_PASSWORD_FILE="$HOME/Seafile/Perso/.deploy-ansible-vault-password"
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"
