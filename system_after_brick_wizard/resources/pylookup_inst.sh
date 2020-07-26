#!/bin/bash
PYLOOKUPHOME=$HOME/Documents/code/pylookup
rm -rf $PYLOOKUPHOME || true
git clone https://github.com/tsgates/pylookup.git $PYLOOKUPHOME
VER3=$(python3 --version 2>&1 | grep -o "[0-9].[0-9].[0-9]*.*")
ZIP3=python-${VER3}-docs-html.zip
URL3=https://docs.python.org/3/archives/${ZIP3}
DJZIP=django-docs-3.0-en.zip
DJURL=https://media.djangoproject.com/docs/${DJZIP}
pushd $PYLOOKUPHOME
function download_zip (){
	if [ ! -e $1 ] ; then  
		echo "Downloading $2"
		wget $2
		unzip $1
	fi
}
download_zip "$ZIP3" "$URL3"

echo "Downloading $DJURL"
wget $DJURL
unzip $DJZIP -d ${DJZIP%.zip}

$HOME/.pyenv/versions/2.7.14/bin/python2 pylookup.py -d pylookup.db -u ${ZIP3%.zip} -u ${DJZIP%.zip}
popd
sudo cp ./resources/var-scripts/pylookup/pyre /usr/local/bin || true
sudo cp ./resources/var-scripts/pylookup/pyjau /usr/local/bin || true
