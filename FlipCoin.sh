#!/bin/bash -x

echo "WELCOME TO FLIP COIN SIMULATION"

read -p "enter the number of times you want to flip the coin" flip

#variables
head=0
tail=0
coin=3

declare -A combinationDict

function getValues()
{
        for (( j=0; j<$flip; j++ ))
        do
                unset coinValue
                for (( i=0; i<$coin; i++ ))
                do
                        random=$((RANDOM%2))
                        if [ $random -eq 1 ]
                        then
                                coinValue="H$coinValue "
                                head=$(($head+1))
                        else
                                coinValue="T$coinValue"
                                tail=$(($tail+1))
                        fi
                done
                combinationDict[$coinValue]=$(( ${combinationDict[$coinValue]} + 1 ))
                value="${!combinationDict[@]}"
        done
        total=$flip
        echo ${combinationDict[@]}
}

function getPercentage()
{
   counter=0
    values=$(getValues $coin)
   for i in $values
   do
      counter=$(($counter+1))
      resultDict[$counter]=$((100*$i/flip))
   done
   echo ${resultDict[@]}
}

result=$(getPercentage)
echo "percentage for triplet" $result
