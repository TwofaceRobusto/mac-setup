#!/usr/bin/env zsh -i

SCRIPT_DIR="${0:A:h}"
pushd ${SCRIPT_DIR}

source ../scriptbase.sh

checkCommandInstalled brew

echoHeading "Running brew cleanup"
brew cleanup
echoHeading "Running brew update"
brew update
echoHeading "Running brew upgrade"
brew upgrade

popd