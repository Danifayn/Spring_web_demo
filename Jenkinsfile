pipeline {
    agent none
	stages{
	stage('Build'){
	agent{
        docker {

            image 'maven:3-alpine' 

            args '-v /root/.m2:/root/.m2' 

        }}

            steps {

                sh 'mvn install' 
            }

}

	stage("Run"){
	   agent any
	   steps {
		sh 'docker build -t stuff .'
		sh 'docker run -d --rm -p 8081:8081 stuff'
           
}
	}
	stage("Check Health"){
		agent any
		steps{
	        retry(3){
		    sleep(time:3,unit:"SECONDS")
                    sh './health-check.sh 8081'
			}
	
		ssh root@localhost -p 32768
                }
}
	stage("prod"){
	    agent{
		label 'slave'
		}
	steps{
	sh "ls -l"
}
}
	


}
}
