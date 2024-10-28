#!/usr/bin/env zsh -i

SCRIPT_DIR="${0:A:h}"
pushd ${SCRIPT_DIR}

source ../scriptbase.sh

checkCommandInstalled sdk

echoHeading "Running sdk update"
sdk update

echoHeading "Running sdk upgrade"
sdk upgrade

popd
