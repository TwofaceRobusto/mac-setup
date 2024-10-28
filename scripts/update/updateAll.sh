#!/usr/bin/env zsh -i

SCRIPT_DIR="${0:A:h}"
pushd ${SCRIPT_DIR}

source ../scriptbase.sh

./updateHomebrew.sh

./updateSdk.sh

./updateOmz.sh

popd
