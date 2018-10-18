
# Arch Linux
alias ainst='sudo pacman -S --needed'
alias asearch='pacman -Ss'
alias auinst='sudo pacman -R'
alias newvenv='mkvirtualenv -p /usr/bin/python2'
alias srv='sudo systemctl'

alias _i='ainst'
alias _u='auinst'
alias _s='asearch'
alias _u='sudo pacman -Rs'
alias _info='pacman -Qe'
alias _files='pacman -Ql'
alias _sync='sudo pacman -Syuw'
alias _upgrade='sudo pacman -Syu'

alias py='ipython'
alias dfh='df -hP | sed -e "s/Sist. Arq./Sist.Arq./" | column -t'
alias gf='git flow'

# Tmux aliases
alias tl='tmux ls'
alias ta='tmux attach -t'

alias json='python -mjson.tool'

alias randpwd='dd if=/dev/random bs=1 count=64 2>/dev/null | tr -dc "[:alpha:]"'

alias prettyxml='xmllint --format - < '

alias avrasm2='wine ~/bin/AvrAssembler2/avrasm2.exe $*'
alias avrasm32='wine ~/bin/AvrAssembler/avrasm32.exe $*'
alias myip='curl https://httpbin.org/ip'

alias _p='compdef _pass pass'

