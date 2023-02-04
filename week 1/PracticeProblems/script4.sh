#!/bin/bash

func() {
    for filename in `ls`; do
        if [[ -f $filename ]]; then
            # change cpp into c and vice versa
            if [[ ${filename: -4} == .cpp ]]; then
                changed_name=${filename: 0:-4}.c
                echo "$filename --changed to-- $changed_name"
                mv $filename $changed_name
            fi
            if [[ ${filename: -2} == .c ]]; then
                changed_name=${filename: 0:-2}.cpp
                echo "$filename --changed to-- $changed_name"
                mv $filename $changed_name
            fi
            # changing done
        elif [[ -d $filename ]]; then # folder
            cd ./$filename/
            func
            cd ..
        fi
    
    done

}


func
