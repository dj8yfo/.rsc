#!/bin/bash
ROOT_UID=0     # Only users with $UID 0 have root privileges.
E_WRONG_USER=65    # Not root?
if [ "$UID" -ne "$ROOT_UID" ]
then
    echo; echo "Only root can run this script."; echo
    exit $E_WRONG_USER
else
    echo
    echo "You should know better than to run this script, root."
    echo "Even root users get the blues... "
    echo
fi

pushd "$HOME/Downloads"
git clone https://github.com/Tecate/bitmap-fonts.git
pushd bitmap-fonts
cp -avr bitmap/ /usr/share/fonts
xset fp+ /usr/share/fonts/bitmap
fc-cache -fv
popd; popd

# check succhess with __  xfontsel __
