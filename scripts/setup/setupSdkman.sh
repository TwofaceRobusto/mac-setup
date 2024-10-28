#!/usr/bin/env zsh -i

SCRIPT_DIR="${0:A:h}"
pushd ${SCRIPT_DIR}

source ../scriptbase.sh

echoHeading "Installing sdkman"
curl -s "https://get.sdkman.io" | bash

popd
