#!/bin/bash

if(( $# < 2 )); then
    echo "Usage script2.sh n PATTERN"
fi

n=$1
pattern=$2

for i in `ls` ; do
    if [[ -f $i ]]; then
        # Read no n line of that file
        if `head -$n $i | tail -1 | grep -q $pattern`; then
            echo "Deleting file $i....."
        fi
        
    fi

done
