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
	   agent{
		label 'master'
}
	   steps {
		sh 'docker build -t stuff .'
		sh 'docker run -d --rm -p 8081:8081 stuff'
           
}
	}
	stage("Health check"){
		agent{
			label 'master'
		}
		steps{
	        retry(3){
		    sleep(time:5,unit:"SECONDS")
                    sh './health-check.sh 8081'
			}
	
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
