#!/usr/bin/env zsh -i
SCRIPT_DIR="${0:A:h}"
SCRIPT_NAME="${0:t}"

pushd ${SCRIPT_DIR}

source ../scriptbase.sh

usage(){
    echo ""
    echoYellow "Usage for ${SCRIPT_NAME}"
    echo ""
    echo "  ./${SCRIPT_NAME} -h|--help   : display usage"
    echo "  ./${SCRIPT_NAME} <WiFi Name> : display the password saved in keychain for the specified WiFi name, if available"
    echo ""
}

# check and handle arguments
if [[ $# -ne 1 ]]; then
    echoRed "Wrong # of arguments"
    usage
    exit 1
fi

while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            usage
            exit 0
            ;;
        -*)
            echoRed "Unsupoprted argument $1"
            usage
            exit 1
            ;;
        *)
            security find-generic-password -ga $1
            ;;
    esac
    shift
done

popd