#!/bin/bash

read -p "Enter the first input: " a
read -p "Enter the second input: " b
read -p "Enter the third input: " c

declare -A resultStore
declare -a resultArray
result1=$((a+b*c))
result2=$((a*b+c))

result3=$(echo |awk '{print one+two/three}' one=$a two=$b three=$c)

result4=$((a%b+c))

resultStore[0]=$result1
resultStore[1]=$result2
resultStore[2]=$result3
resultStore[3]=$result4

echo ${!resultStore[@]}


resultArray=${resultStore[@]}

echo ${resultArray[@]}

for(( i=0; i<4 ; i++ ))
do
        for((j=0; j<4-$i; j++))
        do
                if [ ${resultArray[j]} -gt ${resultArray[$((j+1))]} ]
                then

                        temp=${resultArray[j]}
                        resultArray[$j]=${resultArray[$((j+1))]}
                        resultArray[$((j+1))]=$temp
                fi
        done
done

echo "Array in Ascending order: "${resultArray[@]}

for(( i=0; i<4 ; i++ ))
do
        for((j=0; j<4-$i; j++))
        do
                if [ ${resultArray[j]} -lt ${resultArray[$((j+1))]} ]
                then
                        temp=${resultArray[j]}
                        resultArray[$j]=${resultArray[$((j+1))]}
                        resultArray[$((j+1))]=$temp
                fi
        done
done

echo "Array in descending order: "${resultArray[@]}
