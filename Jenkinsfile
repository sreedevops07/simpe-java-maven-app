pipeline {
    agent any
    stages {
        stage ('Initialize') {
            steps {
                sh '''
                    echo "PATH = ${PATH}"
                    echo "M2_HOME = ${M2_HOME}"
                '''
            }
        }

        stage ('Build') {
            steps {
                sh 'mvn clean install package' 
            }
            /*post {
                success {
                    junit 'target/surefire-reports/**/*.xml' 
                }
            }*/
       stage('building docker image from docker file by tagging') {
            steps {
        sh 'docker build -t phanirudra9/phani:$BUILD_NUMBER .'
      }   
    }
      stage('logging into docker hub') {
      steps {
         sh 'docker login --username="phanirudra9" --password="9eb876d4@A"'
      }   
    }
    stage('pushing docker image to the docker hub with build number') {
      steps {
        sh 'docker push phanirudra9/phani:$BUILD_NUMBER'
      }   
    }
    
        }
    }
}
