
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help"
export LANG=en_US.UTF-8
# Customize to your needs...
export PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/opt/bin:/usr/i686-pc-linux-gnu/gcc-bin/4.5.3:/usr/i686-pc-linux-gnu/x86_64-pc-linux-gnu/gcc-bin/4.5.3:/usr/games/bin:/home/daltonmatos/src/less.js/bin/:~/.local/bin


setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.

autoload -U compinit promptinit
compinit
export TERMINAL="xfce4-terminal"

zstyle ':completion::complete:*' use-cache 1
