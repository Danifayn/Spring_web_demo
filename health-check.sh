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

#for ((i = 2; i <= $#; i++ )); do
 # isUP="$(curl http://${!i}/actuator/health | grep UP)"


#done
