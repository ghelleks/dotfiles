# enable vi-like editing commands
set -o vi

# set kerberos
export KRB5_CONFIG=$HOME/Code/dotfiles/krb5.conf

# make the prompt awesome
export PROMPT_COMMAND='printf "\033]0;%s@%s:%s\033\\" "${USER}" "${HOSTNAME%%.*}" "${PWD/#$HOME/~}"'

# make ls awesome
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

# add our own ~/bin
export PATH=$PATH:~/bin

# make rbenv work
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"


