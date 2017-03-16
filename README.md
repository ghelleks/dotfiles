* **.vimrc**: based on https://github.com/liliakai/dotfiles. 
  * see comments for dependencies
  * uses [airline] for sweet status bars
  * uses command-t for editing lots of buffers at once
  * has special rules for markdown and prose editing
  * on OS X, requires 256-color [Terminal.app settings].
* **.bash_profile**
  * use our own krb5.conf
  * fancy prompts
  * vi editing of the command line
* **.gitconfig**
* **.screenrc**
  * enable 256 colors
  * persistent ssh connections
* **.ssh/config**: enabled forwarding agent
* **.ssh/rc**: allows for persistent ssh connections, requires .bashrc stuff
* **Archive Mail Message.scpt**: associate with Control-A for gmail-like archiving in Mail.app
* **.toprc**
* **osx-default.sh**: defaults for OS X, currently enabling Kerberos in Chrome
* **.dircolors**: "brew install coreutils" to make this work on OS X
* **google-contacts-lookup.sh**: Helper script to turn goobook output into
  RFC822-compliant email addresses. Intended to be called from Mutt.

[airline]: https://github.com/bling/vim-airline
[Terminal.app settings]: https://github.com/altercation/solarized/tree/master/osx-terminal.app-colors-solarized/xterm-256color
