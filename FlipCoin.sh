#!/bin/bash -x

echo "WELCOME TO FLIP COIN SIMULATION"

read -p "enter the number of times you want to flip the coin" flip
read -p "enter the number of if coins you want " coin

#variables
head=0
tail=0


declare -A combinationDict

function getDictionaryValues()
{
        for (( j=0; j<$flip; j++ ))
        do
                coinValue=""
                for (( i=0; i<$coin; i++ ))
                do
                        random=$((RANDOM%2))
                        if [ $random -eq 1 ]
                        then
                                coinValue="H$coinValue"
                                head=$(($head+1))
                        else
                                coinValue="T$coinValue"
                                tail=$(($tail+1))
                        fi
                done
                combinationDict[$coinValue]=$((${combinationDict[$coinValue]}+1))
        done
}
getDictionaryValues

function main()
{
        for i in ${!combinationDict[@]}
        do
		result=${combinationDict[$i]}
                echo $i $((100*$result/$flip))
        done | sort -k2 -n | tail -1
}
main



