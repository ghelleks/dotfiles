# enable vi-like editing commands
set -o vi

# make the prompt awesome
export PROMPT_COMMAND='printf "\033]0;%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'

export PATH=$PATH:~/bin

export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"


