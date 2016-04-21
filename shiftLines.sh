#!/bin/bash

if [ $# -ne 1 ]
then
    echo "File argument required"
    exit 1
fi

while read line
do
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
done < $*  
