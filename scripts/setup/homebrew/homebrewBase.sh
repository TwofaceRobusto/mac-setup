#!/usr/bin/env zsh -i

SCRIPT_DIR="${0:A:h}"
SCRIPT_NAME="${0:t}"

pushd ${SCRIPT_DIR}

source ../../scriptbase.sh

checkCommandInstalled brew

FORMULAE=(
    'asciidoctor'
    'bat'
    'btop'
    'coreutils'
    'eza'
    'fastfetch'
    'fzf'
    'libxml2'
    'lsd'
    'plantuml'
    'podman'
    'pygments'
    'qrencode'
    'shellcheck'
    'tlrc'
    'tree'
    'typst'
)
CASKS=(
    'quba'
    'iina'
    'iterm2'
    'devtoys'
    'podman-desktop'
)

FONTS=(
    'font-jetbrains-mono-nerd-font'
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

brewInstallAllFonts(){
    for EACH in $FONTS; do
        echo "installing ${EACH}"
        brew install ${EACH}
    done
}


######


echoHeading "Installing Formulae"
brewInstallAllFormulae

#echoHeading "- Casks"
#brewInstallAllCasks

echoHeading "Installing Fonts"
brewInstallAllFonts

popd
