pipeline {
    agent { docker { image 'python:3.7.2' } }
    
    stages {
        stage('Build') {
            steps {
                echo "Starting the Build stage"
                sh 'pip install -r requirements.txt'
            }
         }    
        stage('Test') {
        	steps {
        		echo "Starting the Test stage"
        		sh 'python test.py'
        	}
        }
        stage('Deploy') {
        	when {
        		expression {
        			currentBuild.result == null || currentBuild.result == 'SUCCESS'
        		}
        	}	
        	steps {
        		echo "Starting the Deploy stage"
        	} 
       }
   }    
post {
	always {
		echo 'Pipeline finished'
	}
	success {
	echo 'Pipeline succeeded'
}
	failure {
		echo 'Pipeline failed'
		mail body: "<b>Bennys</b><br>\n\<br>Project: ${env.JOB_NAME} <br>Build Number: ${env.BUILD_NUMBER} <br> URL de build: ${env.BUILD_URL}", charset: 'UTF-8', from: 'jenkins@myproject.com', mimeType: 'text/html', subject: "ERROR CI: Project name -> ${env.JOB_NAME}", to: "bennymestel@gmail.com";
	}
}
}
