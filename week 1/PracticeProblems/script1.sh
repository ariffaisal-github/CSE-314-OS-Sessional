#!/bin/bash

if(( $# == 0 )); then
    echo "Usage script1.sh filename1 filename2 ..."
fi

for i in $*; do
    if [[ -f $i ]]; then
        if [[ -x $i ]]; then
            echo "$i is currently executable"
            ls -l | grep "$i"
            echo "$i's execution permission is now changing"
            chmod -x $i
            ls -l | grep "$i"
        else ls -l | grep "$i"
        fi
        
    elif [[ -e $i ]]; then
        echo "$i is not a regular file" 
        
    else echo "$i doesn't exist"
    fi
done
