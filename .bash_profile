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

# persistent SSH sessions via tmux
if [ ! -z "$SSH_AUTH_SOCK" -a "$SSH_AUTH_SOCK" != "$HOME/.ssh/ssh_auth_sock" ] ; then
    unlink "$HOME/.ssh/ssh_auth_sock" 2>/dev/null
    ln -s "$SSH_AUTH_SOCK" "$HOME/.ssh/ssh_auth_sock"
    export SSH_AUTH_SOCK="$HOME/.ssh/ssh_auth_sock"
fi

# add our own ~/bin
export PATH=$PATH:~/bin

if [ ! `command -v rbenv >/dev/null 2>&1` ]; then
  # make rbenv work
  echo Setting up rbenv.
  export PATH="$HOME/.rbenv/bin:$PATH"
  eval "$(rbenv init -)"
fi


