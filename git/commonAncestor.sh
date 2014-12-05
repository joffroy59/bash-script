#!/bin/sh

function usage {
	echo -e "`basename $0` branch1 branch2"
}

if [ $# -ne 2 ] 
then
	usage
	exit 1
fi	

LOG_FORMAT="--pretty=oneline -1"

git log ${LOG_FORMAT} `git merge-base $1 $2`
