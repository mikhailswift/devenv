if command -v numlockx >/dev/null 2>&1; then
  numlockx &
fi

if command -v gnome-keyring-daemon >/dev/null 2>&1; then
  gnome-keyring-daemon --start --components=secrets
fi

if command -v xss-lock >/dev/null 2>&1; then
  xss-lock -l -- lock.sh &
fi

if [ -f ~/.Xresources ]; then
  xrdb -merge -I$HOME ~/.Xresources
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

exec i3
