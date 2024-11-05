#!/usr/bin/env zsh -i

SCRIPT_DIR="${0:A:h}"
pushd ${SCRIPT_DIR}

source scripts/scriptbase.sh

SUBDIRECTORY="."

OK=$(writeGreen OK)
NOK=$(writeRed NOK)

echo "Checking executable flag for .sh scripts"
for file in $(find $SUBDIRECTORY -type f -name "*.sh" ); do
    if [[ -x ${file} ]]; then
        echo "$(pad "* ${file} executable:" -80)${OK}"
    else
        echo "$(pad "* ${file} executable:" -80)${NOK}"
        echo " - changing permissions for ${file} with chmod u+x"
        chmod u+x ${file}
    fi
done

popd
