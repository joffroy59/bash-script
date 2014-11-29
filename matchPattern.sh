#!/bin/bash

#
# test match pattern in a string 
#

function traceTest {
	_PATTERN=$1
	_TEST_STRING=$2
	echo -e "pattern: \t$_PATTERN"
	echo -e "test String: \t$_TEST_STRING"
}

function match_version1 {
	echo "match_version1"
	_PATTERN="refs"
	_TEST_STRING=$2
	traceTest $_PATTERN $_TEST_STRING
	
	if [[ $_TEST_STRING == ${_PATTERN}* ]]
	then
		echo "It's there!";
		return 0;
	fi
	return 1;
}

function match_version2 {
	echo "match_version2"
	_PATTERNS=$1 
	_TEST_STRING=$2


	result=1
	for _PATTERN in ${_PATTERNS[*]}
	do
		traceTest $_PATTERN $_TEST_STRING
		if echo $_TEST_STRING | grep -E $_PATTERN > /dev/null
		then
			result=0;
			break;
		fi
	done 
	return $result;
	#return 1;
}

function matchPattern {
	_PATTERNS=$1
	_TEST_STRING=$2

#traceTest $_PATTERNS $_TEST_STRING
	#match_version1 $_PATTERN $_TEST_STRING
	match_version2 "$_PATTERNS" $_TEST_STRING
	return $?;
}

PATTERNS=("^ST-[0-9]+.*$" "^ST-INTEGRATION.*$")
TEST_STRINGS=("23SDFSDF" "refs" "refssdsff" "ref" "raf" "refser er" "ST-" "ST-1" "ST-12" "ST-123" "ST-1234" "ST-12345" "STR-123" "ST-AZ" "ST-INTEGRATION" "ST-FIX")

for TEST_STRING in ${TEST_STRINGS[*]}
do
	matchPattern "${PATTERNS[*]}" $TEST_STRING
	RES=$?
	echo -ne "match ? \t"
	MATCH_RES="no"	
	if [ $RES -eq 0 ]
	then
		MATCH_RES="yes"	
	fi
	echo $MATCH_RES
	echo "----------------"
done
