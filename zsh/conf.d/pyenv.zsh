export PYENV_ROOT=$HOME/.pyenv

STATIC_FILE=${HOME}/.pyenv.static.zsh
PYENV_BIN=${PYENV_ROOT}/bin/pyenv


if [[ ! -d ${PYENV_ROOT} ]];then
  echo "Installing pyenv..."
  git clone https://github.com/pyenv/pyenv .pyenv
  git clone https://github.com/pyenv/pyenv-update .pyenv/plugins/pyenv-update
fi

if [[ ! -f ${STATIC_FILE} ]];then
  touch ${STATIC_FILE}
  ${PYENV_BIN} init --path >> ${STATIC_FILE}
  ${PYENV_BIN} init - >> ${STATIC_FILE}
fi

export PATH=${PYENV_ROOT}/bin:${PATH}
source ${STATIC_FILE}
