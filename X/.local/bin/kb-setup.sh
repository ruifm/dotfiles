#!/usr/bin/env sh

[ -r ~/.Xkeymap ] && xkbcomp ~/.Xkeymap "$DISPLAY"
if [ "$(hostname)" = "halley" ]; then
    setxkbmap -layout no
else
    setxkbmap -layout es
fi
setxkbmap -option "caps:swapescape"
xcape -e "Control_L=Escape"
if [ "$(hostname)" != "halley" ]; then
    xmodmap ~/.Xmodmap
fi
xset r rate 250 30

xkb_id=$(xinput --list --id-only "SONiX USB DEVICE" 2> /dev/null) || exit 0

[ -n "$xkb_id" ] && setxkbmap -device "$xkb_id" -layout us