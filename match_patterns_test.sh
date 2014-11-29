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
