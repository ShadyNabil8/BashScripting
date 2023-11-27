#~/bin/bash

###################################
# echo "Enter your name"
# #read name
# read -s name
# echo "Welcome again ${name}"
###################################

###################################
# read -p "Your namea again: " name2
# echo "Welcome again ${name2}"
###################################

###################################
# read -sp "Enter password: " password
# echo "Welcome again ${password}"
###################################

###################################
# set -x
# for i in {1..10}
# do
# echo ${i}
# done
# set +x
###################################

###################################
# str="bash script course"
# for i in ${str}
# do
# echo ${i}
# done
###################################

###################################
# # var=ls #var = "ls"
# var=$(ls) # This mean to execute the command the get the output
# #same as var=`ls`
# echo ${var}
###################################

###################################
# Get the files in this dir
# files=$(ls)
# for i in ${files}
# do
#     echo ${i}
# done
###################################

###################################
# (&&) means if this command is done successfully
# then print echo. And if the command failed, don't print
# ls && echo success
# lsls && echo success

# # The opisite is ||
# ls || echo success
# lsls || echo success
###################################

###################################
# test "shady" = "shady" || echo apple || echo tomato
# echo "###########################"
# test "shady" = "shady" || echo apple && echo tomato
# echo "###########################"
# test "shady" = "shady" && echo apple || echo tomato
# echo "###########################"
# test "shady" = "shady" && echo apple && echo tomato
###################################

###################################
# if [ -f "./README.md" ]
# then
#     echo "file is here!"
# else
#     echo "File is not here"
# fi

# test -f "README.md" && echo "File is here!" || echo "File is not here"
###################################

###################################
# echo $#
# echo $*
# echo $@
# echo $0
# echo $1
# echo $$
# echo $?
###################################

###################################
# args=$@
# count=$#
# echo $args
# for i in ${args}
# do
#     echo ${i}
# done
###################################

###################################
# str="shady;Nabil;Mohamed"
# # Setting ';' as a delimiter
# IFS=';'
# read -a NAME <<< ${str}
# for i in ${NAME[@]}
# do
#     echo ${i}
# done
###################################

###################################
# add_list()
# {
#     echo "Processing list: $@"
#     result=$((0))
#     for i in $@
#     do
#         result=$(($result + ${i}))
#     done
#     return $result;
# }
# add_list $@
# echo $?
###################################

###################################
# echo "Using \"\$@\":"
# for arg in "$@"; do
#     echo "$arg"
# done

# echo "Using \$@:"
# for arg in $@; do
#     echo "$arg"
# done
###################################

###################################
# array=("shady" "nabil" "mohamed")
# # Print array elements
# echo ${array[@]}
# # Print the number of elements in the array
# echo ${#array[@]}
# # the array here is 1-based
# subArray=(${array[@]:1:2})
# echo ${subArray[@]}
###################################

###################################
# # Strings are zero based.
# nmStr="Shady Nabil Mohamed"
# # 5 is the number of chars wanted to be printed
# sbStr=${nmStr:6:5}
# echo ${sbStr}
###################################

###################################
# select lang in cpp python java result
# do
#     echo $lang
#     case $lang in
#     "cpp")
#         echo "Good choise"
#         ;;
#     *)
#         break
#         ;;
#     esac
# done
###################################

###################################
x=10
echo $x
x=20
echo $x
# readonly x
x=30 # Error

fun()
{
    echo "First call"
}

fun
readonly -f fun # Error
fun()
{
    echo "second call"
}

fun
###################################
###################################
###################################
###################################
###################################
###################################
###################################
###################################
###################################
###################################
###################################


