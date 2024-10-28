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

deleteUnused(){
    echoHeading "Deleting unused $1 versions"
    checkSdkCurrentOutput $1
    local current_clean=$(sdk c $1 | sed '1d' | sed 's/^[a-zA-Z ]*//g')

    for version in $(find ~/.sdkman/candidates/$1 -type d -depth 1); do
        echo "- found version ${version:t}"

        if [ "${version:t}"  = "${current_clean}" ]; then
           echo " -- keeping $1 ${version:t} as it is currently used"
        else
           echo " -- deleting $1 ${version:t}"
           sdk uninstall $1 ${version:t}
        fi
    done
}

echoHeading "Deleting all unused SDK version for given list"
for EACH in $SDK; do
    echoYellow ${EACH}
done
echo ""
for EACH in $SDK; do
    deleteUnused ${EACH}
done


popd
