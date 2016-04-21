#!/bin/bash

if [ $# -ne 1 ]
then
    echo "Error: missing command line argument"
    exit 1
fi

while read -r line
do
    set $line
    front = $1
    while read noise
    do
        case "$1" in
            *$noise*)
            echo "do nothing"
            ;;
        esac
    done < $@
done
