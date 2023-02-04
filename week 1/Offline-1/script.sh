#!/bin/bash

if [[ $1 -gt 0 ]]; then
max=$1; else max=100
fi
if [[ $2 -gt 0  && $2 -lt 10 ]]; then
max_id=$(($2+1805120 )); else max_id=1805125
fi
current_id=1805120
rm -f ./result.csv
echo "student_id,score" > result.csv
cd Submissions/
for i in `ls`; do
    current_id=$((current_id+1))
    if [[ -f "./$i/$i.sh" && $i -eq $current_id && !(current_id -gt max_id)  ]]; then 
        marks[$i]=max         #echo $i.sh exist 
        else marks[$i]=0      #echo doesnt exist
        continue 
    fi
    bash ./$i/$i.sh > ../out.txt
    x=`diff -w ../out.txt ../AcceptedOutput.txt | grep "<" | wc -l`
    y=`diff -w ../out.txt ../AcceptedOutput.txt | grep ">" | wc -l`
    errors=$(( (x+y)*5 ))  # negate errors from total marks
    marks[$i]=$((max-errors))
    
done

### Copy checking through brute force

for ((i=1805121;i<=$max_id;i++)); do
    bash ./$i/$i.sh > ../temp1.txt
    for (( j=$((i+1)); j<=$max_id; j++ )); do
        bash ./$j/$j.sh > ../temp2.txt
        
        x=`diff ../temp1.txt ../temp2.txt | grep "<" | wc -l`
        y=`diff ../temp1.txt ../temp2.txt | grep ">" | wc -l`
        mismatch=$((x+y))
        if (( $mismatch == 0 )) ; then
            marks[$i]=$(( 0-${marks[$i]} ))
            marks[$j]=$(( 0-${marks[$j]} ))
        fi
    done
    
done



### Printing the result

for i in ${!marks[@]}; do
  echo "Roll $i got ${marks[$i]}"
  echo "$i,${marks[$i]}" >> ../result.csv
done


#Delete the temporary output files
rm -f ../out.txt
rm -f ../temp1.txt
rm -f ../temp2.txt

