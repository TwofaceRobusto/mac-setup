#!/usr/bin/env zsh -i

SCRIPT_DIR="${0:A:h}"
SCRIPT_NAME="${0:t}"

pushd ${SCRIPT_DIR}

source ../../scriptbase.sh

checkCommandInstalled brew

FORMULAE=(
    'bat'
    'btop'
    'coreutils'
    'fastfetch'
    'lsd'
    'podman'
    'qrencode'
    'shellcheck'
    'tree'
    'typst'
)
CASKS=(
    'quba'
    'iina'
    'mediathekview'
    'devtoys'
    'podman-desktop'
)

brewInstallAllFormulae(){
    for EACH in $FORMULAE; do
        echo "installing ${EACH}"
        brew install ${EACH}
    done
}

brewInstallAllCasks(){
    echo ""
    echo "- Casks"
    for EACH in $CASKS; do
        echo "installing ${EACH}"
        brew install ${EACH}
    done
}

echo "- Formulae"
brewInstallAllFormulae

#echo "- Casks"
#brewInstallAllCasks

popd
