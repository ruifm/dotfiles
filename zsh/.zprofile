if [[ ! $DISPLAY && $XDG_VTNR -eq 1 ]]; then
  exec startx -- -keeptty
fi
