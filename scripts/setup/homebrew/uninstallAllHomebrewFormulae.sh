#!/usr/bin/env zsh -i

SCRIPT_DIR="${0:A:h}"
SCRIPT_NAME="${0:t}"

pushd ${SCRIPT_DIR}

source ../../scriptbase.sh

checkCommandInstalled brew
echo "Uninstalls all homebrew formulae"
for EACH in `brew list --formulae`; do
    echo "uninstalling ${EACH}"
    brew uninstall --force --ignore-dependencies ${EACH}
done

#echo ""
#echo "calling 'brew autoremove'"
brew autoremove

popd