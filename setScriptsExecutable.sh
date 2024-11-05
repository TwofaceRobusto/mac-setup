#!/usr/bin/env zsh -i

SCRIPT_DIR="${0:A:h}"
pushd ${SCRIPT_DIR}

source scripts/scriptbase.sh

SUBDIRECTORY="."

echoHeading "Checking executable flag for .sh scripts"
for file in $(find $SUBDIRECTORY -type f -name "*.sh" ); do
    if [[ -x ${file} ]]; then
        echo "$(pad "${file} executable:" -80)$(writeGreen OK)"
    else
        echo "$(pad "${file} executable:" -80)$(writeRed NOK)"
        echo " - changing permissions with chmod u+x"
        chmod u+x ${file}
    fi
done

popd
