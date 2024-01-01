
# Env adicionada pelo vim quando abre um terminal,
# Dessa forma conseguimos abrir um terminal dentro do vim já caindo
# no current directory
[[ ! -z ${CHG_PWD} ]] && cd ${CHG_PWD}


if [ ! -z ${VIM_TERMINAL} ];then

VIM_BIN=$(which vim)


function vim(){

  ${VIM_BIN} --servername ${VIM_SERVERNAME} --remote-send '<ESC><C-W>:15new<CR>'

  FILE=${CHG_PWD}/${1}

  if [ -z ${@} -o ${1} == "-" ];then
    # Editing from stdin
    FILE=$(mktemp /tmp/read-from-stdin.XXX)
    cat > ${FILE}
  fi

  ${VIM_BIN} --servername ${VIM_SERVERNAME} --remote-send ":e ${FILE}<CR>"
  ${VIM_BIN} --servername ${VIM_SERVERNAME} --remote-send ":set sb&<CR>"
}


function gvim(){
  vim $*
}

fi
