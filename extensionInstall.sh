#!/usr/bin/env bash

installExtensionCommand=undefined
if groups | egrep -wq "sudo|adm|admin|root|wheel";then
	installExtensionCommand="sudo unopkg add --shared"
else
	installExtensionCommand="unopkg add"
fi

for extension
do
	ext=${extension/*./}
	[ $ext != oxt ] && continue
	echo "=> Installing $extension ..."
	$installExtensionCommand $extension
done
