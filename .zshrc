POWERLEVEL9K_MODE='awesome-fontconfig'
autoload -Uz compinit && compinit

source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt

source /usr/share/fzf/key-bindings.zsh

alias hdmi-off="xrandr --output HDMI-1 --off"
alias hdmi-on="xrandr --output DVI-D-0 --auto --primary --output HDMI-1 --auto --right-of DVI-D-0"
alias weather="curl wttr.in/Versailles"
alias rpimpc="MPD_HOST=raspberrypi.local mpc"
alias sysupdate="yay -Syu && yay -Yc"
alias ls="exa"

export TERM=xterm-256color
export PATH="`ruby -e 'puts Gem.user_dir'`/bin:$HOME/.npm-global/bin:$HOME/bin:/usr/local/bin:$PATH"
export ANDROID_HOME=/home/daniel/Programs/android-sdk/

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export LESS_TERMCAP_ue=$'\E[0m'

export LESS="-FSRXI"

if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

fortune | cowsay -f $(/bin/ls /usr/share/cows | shuf -n1)

# added by travis gem
[ -f /home/daniel/.travis/travis.sh ] && source /home/daniel/.travis/travis.sh

export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
fi

eval $(thefuck --alias)

[ -f /home/$USER/.cache/wal/sequences ] && cat /home/$USER/.cache/wal/sequences 
