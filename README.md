# Bash Scripting

## Printint

* **echo \<txt>** print text with a new line. add -n to make it without new line.
* **printf \<txt>** print whithout a new line by default.
* When defining a variable, do not make spaces before or after.

```bash
x="shady" => OK
x ="shady" => NOK
x = "shady" => NOK
```

## Taking an input form user

```bash
echo "Enter your name"
read name
echo "Welcome again ${name}"
```

To not show the input value

```bash
read -s name
```

To print a message whilr taking an input

```bash
read -p "Your namea again: " name2
echo "Welcome again ${name2}"
```

We can compine two commands together

```bash
read -sp "Enter password: " password
echo "Welcome again ${password}"
```

## For loop

```bash
# set -x and set +x : for debugging
set -x 
for i in {1..10}
do
echo ${i}
done
set +x
```

**This will loop for each word in the string not each char.**

```bash
str="bash script course"
for i in ${str}
do
echo ${i}
done
```

## Read an output of a command

```bash
# var=ls #var = "ls"
var=$(ls) # This mean to execute the command the get the output
#same as var=`ls`
echo ${var}
```

## Get the files in this dir

```bash
files=$(ls)
for i in ${files}
do
    echo ${i}
done
```

## && and || in bash

(&&) means if this command is done successfully then print echo. And if the command failed, don't print.

```bash
ls && echo success
lsls && echo success
```

The opisite is ||

```bash
ls || echo success
lsls || echo success
```

## test in bash

If the condition is true then execute commande after && and ignore commands after ||.

You can also compare integers but you need to use different flags like -eq. type ```man test``` to see.

You can also check for a file if it exist or a dir and somethongs like that just see the manual.

```bash
test "shady" = "shady" || echo apple || echo tomato
test "shady" = "shady" || echo apple && echo tomato
test "shady" = "shady" && echo apple || echo tomato
test "shady" = "shady" && echo apple && echo tomato
```

## If in bash

```bash
# These three spaces must be written
  # #                #
if [ -f "./README.md" ]
then
    echo "file is here!"
else
    echo "File is not here"
fi
```

It's tes equivelant

```bash
test -f "README.md" && echo "File is here!" || echo "File is not here"
```

## Argumants

```bash
echo $# # The number of args
echo $* # args as string
echo $@ # args as list
echo $0 # psth to this script
echo $1 # first arg
echo $$ # process id
echo $? # status of the last line as a number
```

Another example

```bash
args=$@
count=$#
echo $args
for i in ${args}
do
    echo ${i}
done
```

## Dealing with delimiters

```bash
str="shady;Nabil;Mohamed"
# Setting ';' as a delimiter
IFS=';'
read -a NAME <<< ${str}
for i in ${NAME[@]}
do
    echo ${i}
done
```

## Functions

```bash
add_list()
{
    echo "Processing list: $@"
    result=$((0))
    for i in $@
    do
        result=$(($result + ${i}))
    done
    return $result;
}
add_list $@
echo $?
```

## Important note

When using ```"$@"```, the arguments are preserved as separate entities, even if they contain spaces. When using ```$@``` without double quotes, the arguments are split based on whitespace, resulting in unexpected behavior when arguments contain spaces.

**Both are the same when not use any "" in the input.**

```bash
echo "Using \"\$@\":"
for arg in "$@"; do
    echo "$arg"
done

echo "Using \$@:"
for arg in $@; do
    echo "$arg"
done
```

## Arrays

```bash
array=("shady" "nabil" "mohamed")
# Print array elements
echo ${array[@]}
# Print the number of elements in the array
echo ${#array[@]}
# the array here is 1-based
subArray=(${array[@]:1:2})
echo ${subArray[@]}
```

## strings VS Arrays

```bash
# Strings are zero based.
nmStr="Shady Nabil Mohamed"
# 5 is the number of chars wanted to be printed
sbStr=${nmStr:6:5}
echo ${sbStr}
```

## select

```bash
select lang in cpp python java result
do
    echo $lang
    case $lang in
    "cpp")
        echo "Good choise"
        ;;
    *)
        break
        ;;
    esac
done
```

## readonly with vars and functions

```bash
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
```
