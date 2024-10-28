#!/usr/bin/env zsh -i

SCRIPT_DIR="${0:A:h}"
SCRIPT_NAME="${0:t}"

pushd ${SCRIPT_DIR}

source ../../scriptbase.sh

checkCommandInstalled sdk

SDK=(
    'java 21.0.4-tem'
    'maven 3.9.9'
    'gradle 8.10.2'
    'kotlin 2.0.21'
    'quarkus 3.15.1'
)

sdkmanInstallAll(){
    echo "Installing base SDKs with sdkman"
    for EACH in $SDK; do
        echo "installing sdk ${EACH}"
        sdk install ${EACH}
        echo ""
    done
}

sdkmanInstallAll

popd