#!/usr/bin/env zsh -i

SCRIPT_DIR="${0:A:h}"
pushd ${SCRIPT_DIR}

source ../../scriptbase.sh

cp kotik4.zsh-theme ~/.oh-my-zsh/themes/

popd