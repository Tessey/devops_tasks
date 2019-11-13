#Do the script files searching from certain user.
#!/bin/bash

if [[ $# -eq 2 ]]
then
	find $1 -group $2
elif [[ $# -eq 3 ]]
then 
	find $1 -group $2 -name "$3"
else
	echo "Ожидается 2 или 3 аргумента!"
fi
