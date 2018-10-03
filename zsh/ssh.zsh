
# Uses gpg-agent as ssh-agent, makes it possible to have your ssh key as a GPG authentication key
# https://incenp.org/notes/2015/gnupg-for-ssh-authentication.html
# Only use gpg as a ssh-agent if we are not on a remote system
if [ -z "${SSH_TTY}" ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi

_ssx_via(){
  COMMAND=${1}
  gateway=${2}
  shift; shift
  $COMMAND -o "ProxyCommand=ssh ${gateway} -W %h:%p" -o "StrictHostKeyChecking=no" $*
}

_ssh_via(){
  _ssx_via 'ssh' $*
}

_scp_via(){
  _ssx_via 'scp' $*
}


alias ssh-via=_ssh_via
alias scp-via=_scp_via
