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
cp -vr bitmap/ /usr/share/fonts
cd /usr/share/fonts/bitmap
sudo mkfontscale
sudo mkfontdir
xset fp+ /usr/share/fonts/bitmap
fc-cache -fv
popd; popd

sudo rm /etc/fonts/conf.d/70-no-bitmaps.conf
sudo ln -s /etc/fonts/conf.avail/70-yes-bitmaps.conf /etc/fonts/conf.d/70-yes-bitmaps.conf

# check succhess with __  xfontsel -print__
