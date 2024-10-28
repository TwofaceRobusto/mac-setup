#!/usr/bin/env zsh -i

SCRIPT_DIR="${0:A:h}"
pushd ${SCRIPT_DIR}

source ../scriptbase.sh

echoHeading "Changing Values via scutil"
echoYellow " - HostName"
scutil --set HostName $1

echoYellow " - LocalHostName"
scutil --set LocalHostName $1

echoYellow " - ComputerName"
scutil --set ComputerName $1

echoHeading "Changing Values via scutil"
dscacheutil -flushcache

echoHeading " !!! Restart the Computer !!! "

echo ""

popd
