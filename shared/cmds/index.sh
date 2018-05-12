#!bin/bash

argv_v="-v"
HOME="/vagrant"

if [ $# -eq 1 ]; then
    OPT="dummy"
    WORD=$1
elif [ $# -eq 2 ]; then
    OPT=$1
    WORD=$2
else
    echo "USAGE: [..OPTION -v] ..WORD"
    exit 1
fi

if [ $OPT != $argv_v ];then find ${HOME}/shared/memo/ -type f | grep ${WORD} ;fi
if [ $OPT = $argv_v ];then grep -IRn ${HOME}/shared/memo/ ;fi
