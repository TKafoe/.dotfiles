autoload -Uz compinit
compinit

# Load Angular CLI autocompletion.
source <(ng completion script)

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Created by `pipx` on 2025-06-05 12:03:44
export PATH="$PATH:/Users/tomkafoe/.local/bin"

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init - zsh)"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/tomkafoe/dev/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/tomkafoe/dev/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/tomkafoe/dev/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/tomkafoe/dev/google-cloud-sdk/completion.zsh.inc'; fi

export PATH=$HOME/dev/flutter/bin:$PATH

# Aliases
alias pnvim='poetry run nvim .'
alias ptest='poetry run pytest tests'
alias ptestf='poetry run pytest --lf -vv'
alias tna='tmux new-session -A -t'

notify() {
    cat  # Pass through everything to terminal
    curl -s -d "${1:-Command finished!}" localhost/cmd_done
}
