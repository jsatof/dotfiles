# /etc/skel/.bashrc
#
# This file is sourced by all *interactive* bash shells on startup,
# including some apparently interactive shells such as scp and rcp
# that can't tolerate any output.  So make sure this doesn't display
# anything or bad things will happen !

#export PS1="[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\W\[\033[00m]\$ "
export PS1="$(resize &>/dev/null)$(tput bold)$(tput setaf 2)\W \$$(tput sgr0) "

# Test for an interactive shell.  There is no need to set anything
# past this point for scp and rcp, and it's important to refrain from
# outputting anything in those cases.
if [[ $- != *i* ]] ; then
	# Shell is non-interactive.  Be done now!
	return
fi

export GTK_THEME=Adwaita:dark

# set editor
export VISUAL=vim
export EDITOR="$VISUAL"
export TERM="rxvt-unicode"
alias agent="eval '$(ssh-agent -s)' && ssh-add ~/.ssh/id_ed25519"

alias ls="ls --color=auto"
alias df="df -h"
alias du="du -h"
alias b="meson compile -C build"
alias feh="feh --bg-fill $HOME/pictures/wp/nier_replicant.jpg"
alias monitors="xrandr --output DVI-D-0 --primary --mode 1920x1080 --rate 144.00 --output HDMI-0 --mode 1920x1080 --rate 75.00 --right-of DVI-D-0"
