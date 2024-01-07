
# Uses gpg-agent as ssh-agent, makes it possible to have your ssh key as a GPG authentication key
# https://incenp.org/notes/2015/gnupg-for-ssh-authentication.html
# Only use gpg as a ssh-agent if we are not on a remote system
if [ -z "${SSH_TTY}" ]; then
  export SSH_AUTH_SOCK="$(gpgconf --list-dirs agent-ssh-socket)"
fi
