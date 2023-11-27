#~/bin/bash

if [ -z "$1" ] || [ -z "$2" ] || [ $# -ne 2 ]
then
    echo "WRONG INPUT!!"
    exit -1
fi

# FILE1_HASH=$(md5sum $1)
# FILE2_HASH=$(md5sum $2)

read -ra FILE1_HASH <<<$(md5sum $1)
read -ra FILE2_HASH <<<$(md5sum $2)

# echo ${FILE1_HASH[0]}
# echo ${FILE2_HASH[0]}

if [ ${FILE1_HASH[0]} = ${FILE2_HASH[0]} ]; then
    echo "Files are equal"
else
    echo "Files not are equal"
fi
