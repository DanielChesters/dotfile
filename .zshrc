# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

POWERLEVEL9K_MODE='awesome-fontconfig'
autoload -Uz compinit && compinit

source <(antibody init)
antibody bundle < ~/.zsh_plugins.txt

source /usr/share/fzf/key-bindings.zsh
source /usr/share/fzf/completion.zsh

#alias hdmi-off="xrandr --output HDMI-1 --off"
#alias hdmi-on="xrandr --output DVI-D-0 --auto --primary --output HDMI-1 --auto --right-of DVI-D-0"
alias dual-monitor-on="xrandr --output DP-2 --scale 0.5x0.5 --left-of eDP-1 --output eDP-1"
alias weather="curl wttr.in/Choisy-le-Roi"
#alias rpimpc="MPD_HOST=raspberrypi.local mpc"
alias sysupdate="yay -Syu && yay -Yc"
alias ls="exa"
alias set_a2dp_sink="pactl set-card-profile bluez_card.38_18_4C_49_FB_B6 a2dp_sink"

export TERM=xterm-256color
#export PATH="`ruby -e 'puts Gem.user_dir'`/bin:$HOME/.npm-global/bin:$HOME/bin:/usr/local/bin:$PATH"
export ANDROID_HOME=/home/daniel/Programs/android-sdk/

export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export LESS_TERMCAP_ue=$'\E[0m'

export LESS="-FSRXI"
export EDITOR=nvim
if [ $TILIX_ID ] || [ $VTE_VERSION ]; then
        source /etc/profile.d/vte.sh
fi

#fortune | cowsay -f $(/bin/ls /usr/share/cows | shuf -n1)

# added by travis gem
export GPG_TTY=$(tty)
gpg-connect-agent updatestartuptty /bye >/dev/null
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="/run/user/$UID/gnupg/S.gpg-agent.ssh"
fi

#eval $(thefuck --alias)
# Options section
setopt correct                                                  # Auto correct mistakes
setopt extendedglob                                             # Extended globbing. Allows using regular expressions with *
setopt nocaseglob                                               # Case insensitive globbing
setopt rcexpandparam                                            # Array expension with parameters
setopt nocheckjobs                                              # Don't warn about running processes when exiting
setopt numericglobsort                                          # Sort filenames numerically when it makes sense
setopt nobeep                                                   # No beep
setopt appendhistory                                            # Immediately append history instead of overwriting
setopt histignorealldups                                        # If a new command is a duplicate, remove the older one
setopt autocd                                                   # if only directory path is entered, cd there.
setopt auto_pushd
setopt pushd_ignore_dups
setopt pushdminus

# Completion.
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'       # Case insensitive tab completion
zstyle ':completion:*' rehash true                              # automatically find new executables in path 
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"         # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' menu select
zstyle ':completion:*' select-prompt '%SScrolling active: current selection at %p%s'
zstyle ':completion:*:descriptions' format '%U%F{cyan}%d%f%u'

# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zcache

# automatically load bash completion functions
autoload -U +X bashcompinit && bashcompinit

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/daniel/.sdkman"
[[ -s "/home/daniel/.sdkman/bin/sdkman-init.sh" ]] && source "/home/daniel/.sdkman/bin/sdkman-init.sh"
export PATH=$PATH:~/.local/bin

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

source /home/daniel/.config/broot/launcher/bash/br
eval "$(direnv hook zsh)"

[[ -e /usr/share/doc/pkgfile/command-not-found.zsh ]] && source /usr/share/doc/pkgfile/command-not-found.zsh
