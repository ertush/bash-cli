

#!/usr/bin/bash

echo $1 | grep -G '\-h' > /dev/null

if [ $? -eq  0 ]
then
		echo "check-dir-size v0.0.1"
		echo "Usage:\n"
		echo "check-dir-size [OPTIONS] \n\n"
		echo "Options\t\tDescription\n"
		echo "<path-to-dir>\tPath to Directory or Folder; Note: path-to-dir must end with a forward slash '/'"
		echo "<sudo>\t\tsudo for authorizaition of protected directories\n"

		exit 0
fi

for folder in `ls -al $1` 
do 

	if [ -d $1$folder ]
	then 
		echo $2 | grep 'sudo' > /dev/null
		if [ $? -eq 0 ]
		then
			$2 du -h $1$folder | tail -n 1
		else
			du -h $1$folder | tail -n 1
		fi
	fi 
done

