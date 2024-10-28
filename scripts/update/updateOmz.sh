#!/usr/bin/env zsh -i

SCRIPT_DIR="${0:A:h}"
pushd ${SCRIPT_DIR}

source ../scriptbase.sh

checkCommandInstalled omz

echoHeading "Running omz update update"
omz update

popd