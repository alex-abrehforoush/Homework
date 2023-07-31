#!/bin/bash
if [ ! -d $1 ];then
	mkdir $1
else
	echo "$1 exists"
fi
cd $1
for ((i=$3;i<=$4;i++));
do
	touch $2-$i.txt
	chmod 744 $2-$i.txt
	echo "File $2-$i.txt created in $1"
done
