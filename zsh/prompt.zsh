
# Antigen init
source $(dirname ${ZDOTDIR}/.zshrc)/antigen/antigen.zsh
# Load the oh-my-zsh's library.
antigen use oh-my-zsh

#POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k

POWERLEVEL9K_PROMPT_ON_NEWLINE=true
POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX=""
POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX="\uF054 "
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(custom_archlogo dir_writable dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status command_execution_time)
POWERLEVEL9K_CONTEXT_TEMPLATE="%n"

POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=1

POWERLEVEL9K_SSH_ICON=$' \uF041'
POWERLEVEL9K_BATTERY_ICON=$'\uF011'
POWERLEVEL9K_EXECUTION_TIME_ICON=$'\uF017'
POWERLEVEL9K_HOME_ICON=$'\uF015'
POWERLEVEL9K_HOME_SUB_ICON=$'\uF015'
POWERLEVEL9K_HOME_FOLDER_ABBREVIATION=""

POWERLEVEL9K_BATTERY_ICON=$'\uF011'
POWERLEVEL9K_VCS_UNSTAGED_ICON=$'\uF09E'
POWERLEVEL9K_PYTHON_ICON=$'\uE63C'

POWERLEVEL9K_STATUS_VERBOSE=true
POWERLEVEL9K_STATUS_OK_IN_NON_VERBOSE=true
POWERLEVEL9K_OK_ICON=$'\uF00C'
POWERLEVEL9K_FAIL_ICON=$'\uF00D'
POWERLEVEL9K_LOCK_ICON=$'\uF023'
POWERLEVEL9K_VCS_GIT_GITHUB_ICON=$'\uF09B'
POWERLEVEL9K_VCS_BRANCH_ICON=$'\uE625'
POWERLEVEL9K_SHOW_CHANGESET=true

POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=""
POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=""
POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=$'\uE0C6'
POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=$'\uE0C7'
POWERLEVEL9K_WHITESPACE_BETWEEN_LEFT_SEGMENTS=" "

POWERLEVEL9K_SHORTEN_STRATEGY="truncate_from_right"
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3

POWERLEVEL9K_DIR_HOME_FOREGROUND='255'
POWERLEVEL9K_DIR_HOME_SUBFOLDER_FOREGROUND='255'
POWERLEVEL9K_DIR_DEFAULT_FOREGROUND='255'

POWERLEVEL9K_CUSTOM_ETH_INFO_BACKGROUND="004"
POWERLEVEL9K_CUSTOM_ETH_INFO_FOREGROUND="255"

# Load the theme.
#antigen theme candy
antigen theme bhilburn/powerlevel9k powerlevel9k

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle sudo
antigen bundle git
antigen bundle heroku
antigen bundle pip
antigen bundle command-not-found #depends on extra/pkgfile
antigen bundle git-prompt
antigen bundle git-flow
antigen bundle pip
antigen bundle python
antigen bundle docker
antigen bundle docker-compose
antigen bundle colorize #depends on package community/pygmentize
antigen bundle systemd
antigen bundle Tarrasch/zsh-autoenv
antigen bundle t413/zsh-background-notify
antigen bundle pass

antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-completions src

# Tell antigen that you're done.
antigen apply

POWERLEVEL9K_CUSTOM_ARCHLOGO="archlinux_logo"
POWERLEVEL9K_ARCHLINUX_LOGO=$'\uf303'
function archlinux_logo(){
  echo "$(print_icon 'ARCHLINUX_LOGO')"
}
