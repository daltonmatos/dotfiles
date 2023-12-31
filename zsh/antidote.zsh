
[[ -r $ZDOTDIR/.zstyles ]] && . $ZDOTDIR/.zstyles

[[ -d ${ANTIDOTE_CLONE_DIR} ]] ||
  git clone --depth 1 --quiet https://github.com/mattmc3/antidote ${ANTIDOTE_CLONE_DIR}

source ${ANTIDOTE_CLONE_DIR}/antidote.zsh
antidote load
