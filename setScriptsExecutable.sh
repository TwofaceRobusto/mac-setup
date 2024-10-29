#!/usr/bin/env zsh -i

SUBDIRECTORY="."

echo "setting chmod u+x for .sh scripts :"
for file in $(find $SUBDIRECTORY -type f -name "*.sh" ); do
    echo "${file}"
    chmod u+x ${file}
done