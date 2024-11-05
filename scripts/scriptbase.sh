#!/usr/bin/env zsh

## colour definitions
COLOUR_BLACK='\033[0;30m'
COLOUR_DARK_GRAY='\033[1;30m'
COLOUR_RED='\033[0;31m'
COLOUR_LIGHT_RED='\033[1;31m'
COLOUR_GREEN='\033[0;32m'
COLOUR_LIGHT_GREEN='\033[1;32m'
COLOUR_BROWN_ORANGE='\033[0;33m'
COLOUR_YELLOW='\033[1;33m'
COLOUR_BLUE='\033[0;34m'
COLOUR_LIGHT_BLUE='\033[1;34m'
COLOUR_PURPLE='\033[0;35m'
COLOUR_LIGHT_PURPLE='\033[1;35m'
COLOUR_CYAN='\033[0;36m'
COLOUR_LIGHT_CYAN='\033[1;36m'
COLOUR_LIGHT_GRAY='\033[0;37m'
COLOUR_WHITE='\033[1;37m'
NOCOLOUR='\033[0m'

## echo definitions
echoRed(){
    echo -e "${COLOUR_RED}$1${NOCOLOUR}"
}
echoBlue(){
    echo -e "${COLOUR_BLUE}$1${NOCOLOUR}"
}
echoYellow(){
    echo -e "${COLOUR_YELLOW}$1${NOCOLOUR}"
}
echoGreen(){
    echo -e "${COLOUR_GREEN}$1${NOCOLOUR}"
}
echoHeading(){
    echo ""
    echoYellow "*** $1 ***"
}

writeGreen(){
    echo -n "${COLOUR_GREEN}$1${NOCOLOUR}"
}

writeRed(){
    echo -n "${COLOUR_RED}$1${NOCOLOUR}"
}

## padding

# padd a string
# usage: pad <string> length
# - length: positive=left pad, negative=right pad
function pad () { 
    [ "$#" -gt 1 ] && [ -n "$2" ] && printf "%$2.${2#-}s" "$1"; 
}


## functions
checkCommandInstalled(){
    if ! command -v $1 2>&1 >/dev/null
    then
        echo "command '$1' could not be found, exiting."
        exit 1
    fi
}

pushd(){
    builtin pushd "$@" > /dev/null 2>&1
}

popd(){
    builtin pushd "$@" > /dev/null 2>&1
}


