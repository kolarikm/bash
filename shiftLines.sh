#!/bin/bash

if [ $# -ne 1 ]
then
    echo "File argument required"
    exit 1
fi

NUM_IN_LINES=0

while read line
do
    NUM_IN_LINES=$((NUM_IN_LINES+1))
    l=$line
    original="$l"
    while true
    do
        rest=${l##* }
        front=${l% *}
        l="$rest $front"
        echo $l
        case "$l" in
            "$original") break;;
        esac
    done
    export NUM_IN_LINES
done < $*  
