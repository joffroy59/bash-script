#!/bin/bash

. ./match_patterns_lib.sh
. ./match_patterns_test.sh
#
# test match pattern in a string 
#

function matchPattern {
	_PATTERNS=$1
	_TEST_STRING=$2

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
	echo "------------------------------------------------"
done
