#!/bin/bash

if [[ $# -ne 2 ]]
then 
	echo "Ожидается 2 аргумента!"
	exit 1 
elif
	[[ $1 -eq $2 ]]
then
	echo "$1 = $2"
elif
	[[ $1 -gt $2 ]] 
then 
       	echo "$1 > $2" 
else
       	echo "$1 < $2"
	fi
