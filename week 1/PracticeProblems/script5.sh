#!/bin/bash

echo -n "" > out.txt
echo -n "" > err.txt
for ((i=0; $?==0; i++ )) ; do
    bash ./failing_script.sh >> out.txt 2> err.txt 
    
done

echo "It took $i runs to fail"

