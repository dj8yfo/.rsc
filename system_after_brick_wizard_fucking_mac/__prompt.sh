#!/bin/bash 

function prompt_install() {
	cd $HOME/Documents/.conf/system_after_brick_wizard_fucking_mac || true
	echo "----------------------------------"
	echo "Are you sure you're gonna install the $1 piece?"
	wrd=''
	read  wrd   # Timed read.

	if [ $wrd = 'yes' ];
	then
		echo 'Proceeding...'
		return 0
	else
		echo 'Skipping XXX'
		return 1
	fi
	echo "----------------------------------"
	echo
}
