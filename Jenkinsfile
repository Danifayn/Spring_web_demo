pipeline {
    agent none
	stages{
	stage('Dockerize'){
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
		sh 'docker run -d stuff'
           
}
	}


}
}
