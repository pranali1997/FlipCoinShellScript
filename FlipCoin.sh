#!/bin/bash -x

echo "WELCOME TO FLIP COIN SIMULATION"

read -p "enter the number of times you want to flip the coin" flipNumber
read -p "enter the number of if coins you want " coinNumber

declare -A combinationDict

function getDictionaryValues()
{
        for (( j=0; j<$flipNumber; j++ ))
        do
                flipResultKey=""
                for (( i=0; i<$coinNumber; i++ ))
                do
                        if [ $((RANDOM%2)) -eq 1 ]
                        then
                                flipResultKey="H$flipResultKey"
                        else
                                flipResultKey="T$flipResultKey"
                        fi
                done
                combinationDict[$flipResultKey]=$((${combinationDict[$flipResultKey]}+1))
        done
}

function getHighestPercentage()
{
	getDictionaryValues
        for i in ${!combinationDict[@]}
        do
		coinValue=${combinationDict[$i]}
                echo $i $((100*$coinValue/$flipNumber))
        done | sort -k2 -n | tail -1
}
getHighestPercentage



