source ${ZPLUG_HOME}/init.zsh

zplug "zplug/zplug", hook-build:"zplug --self-manage", at:"2.4.2"
#zplug "babarot/enhancd", at:"v2.5.1"
#zplug "dandavison/delta", from:gh-r, as:command, use:"*x86_64*-linux-gnu*"
#zplug "monochromegane/hoi", as:command, from:github, at:"v0.1.4", use:"README.md"
#zplug "monochromegane/hoi", as:command, from:gh-r, use:"*darwin_amd64*"

if ! zplug check; then
    zplug install
fi

zplug load
