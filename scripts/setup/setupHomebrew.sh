#!/usr/bin/env zsh -i

SCRIPT_DIR="${0:A:h}"
pushd ${SCRIPT_DIR}

source ../scriptbase.sh

echoHeading "Installing homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

popd
