#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/Xresources
sysmodmap=/etc/X11/xinit/Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

# start some nice programs

if [ -n "`/etc/X11/chooser.sh`" ]; then
 command="`/etc/X11/chooser.sh`"
else
 failsafe="yes"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?* ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

if which dbus-launch >/dev/null && test -z "$DBUS_SESSIONS_BUS_ADDRESS" ; then
	eval `dbus-launch --sh-syntax --exit-with-session`
fi

gentoo-pipewire-launcher &
xset s off
xset -dpms

while type dwm >/dev/null ; do
	slstatus &
	picom --config $HOME/.config/picom/picom.conf &
	feh --bg-fill $HOME/pictures/wp/nier_ui.png
	xinput --set-prop "Logitech G700s Rechargeable Gaming Mouse" "libinput Accel Speed" -0.65
	xrandr --output DisplayPort-0 --mode 1920x1080 --rate 144.00 --output HDMI-A-0 --mode 1920x1080 --rate 75.00 --right-of DisplayPort-0 --rotate right
	dwm && continue || break
done

exit
#!/bin/bash
