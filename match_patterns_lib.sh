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

function traceTest {
	_PATTERN=$1
	_TEST_STRING=$2
	echo -e "pattern: \t$_PATTERN"
	echo -e "test String: \t$_TEST_STRING"
}
