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
git clone https://github.com/ideasman42/triskweline-code-font.git
cp -rv triskweline-code-font /usr/share/fonts
pushd /usr/share/fonts/triskweline-code-font/bdf
mkfontscale
mkfontdir
dpkg-reconfigure fontconfig-config
fc-cache -f
xset +fp /usr/share/fonts/triskweline-code-font/bdf/
popd; popd

# check succhess with __  xfontsel __
