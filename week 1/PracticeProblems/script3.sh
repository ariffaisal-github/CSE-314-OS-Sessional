#!/bin/bash

for i in `ls`; do
    if [[ -f $i ]]; then
        for j in {0..9}; do
            if `echo $i | grep -q $j` ; then
                echo "Deleting $i...."
            fi
        done
    fi

done
