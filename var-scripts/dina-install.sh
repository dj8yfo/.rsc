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
wget -O Dina.zip 'https://www.dcmembers.com/jibsen/download/61/?wpdmdl=61&refresh=5b7193954297c1534170005'
unzip -d /usr/share/fonts/Dina Dina.zip
pushd /usr/share/fonts/Dina/BDF
mkfontscale
mkfontdir
dpkg-reconfigure fontconfig-config
fc-cache -f
xset +fp /usr/share/fonts/Dina/BDF/
popd; popd

# check succhess with __  xfontsel __
