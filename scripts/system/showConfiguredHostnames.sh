#!/usr/bin/env zsh -i

SCRIPT_DIR="${0:A:h}"
pushd ${SCRIPT_DIR}

source ../scriptbase.sh

echoHeading "Configured Values via scutil"
echoYellow " - HostName"
scutil --get HostName

echoYellow " - LocalHostName"
scutil --get LocalHostName

echoYellow " - ComputerName"
scutil --get ComputerName

echoHeading "Configured Value via networksetup"
echoYellow " - ComputerName"
networksetup -getcomputername

echo ""

popd
