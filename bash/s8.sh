#!/bin/bash
if [[ $# -ne 2 ]]
then 
	echo "Нужно 2 параметра"
	exit 1 
else
	let "c = -$2 / $1 "
	echo " x= $c "
fi
