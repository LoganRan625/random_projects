#!/bin/bash

# NAME: shift
# DATE: 06/29/21
# TYPE: bash

a1=$1
# PURPOSE:   learn case parsing arguments

### while
#while [ $# -gt 0 ]; do
#	nextarg=$1
#	shift
#	echo "${nextarg}"
#done

### case
#case $arg in
#	-v ) echo "hello" ;;
#	-m ) echo "hi" ;;
#	-c ) echo "bye" ;;
#	* ) echo "issue" ;;
#esac

### parser combine case and while
while [ $# -gt 0 ]; do
	item=$a1
	shift
	case $item in
		-v)
			echo "hello"
			;;
		-c)
			if [ $# -lt 1 ]; then
				echo "error: -m must be followed by a maxval"
			else
				max=item
				shift
			fi
			;;
		*)
			fixed+=("$itam")
			((numargs++))
			;;
	esac
done

########################################
# parsing better specific parts of args
name=protesilos
second=-cpb
echo "${name:0:4}"
echo "${second:1:3}" #variable, offset, number of characters after offset
# replace first occurance of pattern with string
echo "${name/si/SB}"
# replace all occurances of / /
echo "${name//s/TACO}"

#########################################

# getopts: parses arguments that start with "-"
while getopts ":a:b:" options; do
	case $options in
		a) ap=$OPTARG;;
		b) bo=$OPTARG;;
		?) echo "error: didnt type correctly"
	esac
done

echo "option A=$ap and option B=$bo"
## DOESNT WORK unsure why

#########################################

# name of scipt
echo $0
# number of args
echo $#
# first arg
echo $1
# all arguments
echo $*

if [ $# -lt 1 ]; then
	echo "Error: Usage: $0 arguments: none found"
	echo "Syntax: <file> <arg1> <arg2>"
	echo "Example: $0 -l -c"
	exit 1
fi

while (($#))
do
	echo "hello $1"
	shift
done

##########################################
# 
