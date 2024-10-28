#!/usr/bin/env zsh -i

SCRIPT_DIR="${0:A:h}"
SCRIPT_NAME="${0:t}"

pushd ${SCRIPT_DIR}

source ../../scriptbase.sh

checkCommandInstalled sdk

SDK=(
    'java'
    'maven'
    'gradle'
    'kotlin'
    'quarkus'
)

checkSdkCurrentOutput(){
    local current=$(sdk c $1)
    local lines=$(echo ${current} | wc -l | sed 's/[ ]*//g')
    if [ "${lines}" != "2" ]; then
        echoRed "Output of 'sdk c $1' does not match pattern: expected 2 lines, found ${lines}"
        exit 1
    fi
}

currentVersion(){
    local current=$(sdk c $1)
    local current_clean=$(echo $current | sed '1d' | sed 's/^[a-zA-Z ]*//g')
    echo "Current: $current_clean"
}

listSdk(){
    echoYellow "Installed $1 versions"
    checkSdkCurrentOutput $1
    currentVersion $1
    for version in $(find ~/.sdkman/candidates/$1 -type d -depth 1); do
        echo "${version:t}"
    done
}

echoHeading "Listung all installed SDK version for given list"
for EACH in $SDK; do
    echoYellow ${EACH}
done
echo ""
for EACH in $SDK; do
    listSdk ${EACH}
done

popd
