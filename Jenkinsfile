pipeline {
    agent any
    environment{
        DOCKER_TAG = newtags()
    }
    stages{
        stage('Build Docker Image'){
           steps{
            sh "docker build -t ngbinh14/webapp:${DOCKER_TAG} ."
        }
        }
        
    }
}

def newtags(){
    def tag = sh script: 'git rev-parse HEAD', returnStdout: true
    return tag
}
