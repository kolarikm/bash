#!/bin/bash

if [ $# -ne 1 ]
then
    echo "Error: missing output destination"
fi

COUNT=0

while read -r line
do
    COUNT=$((COUNT+1))
    echo $line > $1
done
echo "The number of lines in input file: $NUM_IN_LINES"
echo "The number of lines in output file: $COUNT"
