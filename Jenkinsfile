pipeline {
  agent any
  stages {
    stage('source') {
      steps {
        sh 'source /root/.bash_profile'
      }
    }
    stage ('Initialize') {
       steps {
          sh '''
              echo "PATH = ${PATH}"
              echo "M2_HOME = ${M2_HOME}"

              '''
            }
        }
    stage('cleaning package') {
      steps {
        sh 'mvn clean install package'
      }
    }
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
    stage('deploying the docker image into EC2 instance and run the container') {
      steps {
        sh 'ansible-playbook deploy.yml --extra-vars="buildNumber=$BUILD_NUMBER"'
      }   
    }
  }
}

