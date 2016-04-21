#!/bin/bash

NUMBER=0
SHOWCONTENTS=0
SHOWHELP=0

mkdir -p ~/.junk

if [ $# == 0 ]
then
    echo "Missing arguments!"
    exit 1
fi

for i  in "$@"
do
case $i in
    -l)
    SHOWCONTENTS=1
    ;;

    -n)
    NUMBER=1
    ;;

    --help)
    SHOWHELP=YES
    ;;

    *)
    ## Nest ifs to get rid of exits and unwanted moves
    if [ -d $i ]
    then
        echo $i is a directory. Cannot be moved.
        exit 1
    fi
    if test ! -s $i
    then
        echo $i does not exist.
        exit 1
    fi
    if [ $i -nt ~/.junk/$i ]
    then
        mv $i ~/.junk
    fi
    ;;
esac
done

if [ $SHOWCONTENTS == 1 ]
then
    ls -la ~/.junk
fi
if [ $NUMBER == 1 ]
then
    du -ah ~/.junk
fi
