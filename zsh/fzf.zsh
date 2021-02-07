export FZF_DEFAULT_OPTS="--multi"

if [ -f '/usr/share/fzf/key-bindings.zsh' ]; then
  source /usr/share/fzf/key-bindings.zsh
fi

if [ -f '/usr/share/fzf/completion.zsh' ]; then
  source /usr/share/fzf/completion.zsh
fi
