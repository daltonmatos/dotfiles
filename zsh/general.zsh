
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"
export LANG=en_US.UTF-8
# Customize to your needs...
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/i686-pc-linux-gnu/gcc-bin/4.5.3:/usr/i686-pc-linux-gnu/x86_64-pc-linux-gnu/gcc-bin/4.5.3:/usr/games/bin:/home/daltonmatos/src/less.js/bin/:~/.local/bin


setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
autoload -U compinit promptinit
compinit

zstyle ':completion::complete:*' use-cache 1
