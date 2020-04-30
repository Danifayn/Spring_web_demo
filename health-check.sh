port=$1
result="$(curl http://localhost:$port/actuator/health | grep UP)"
if [ "$result" == "" ];
	then
		echo ":("
		exit 124
	else 
		echo ":)"
		exit 0
fi

