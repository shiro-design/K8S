def newtags(){
    def tag = sh script: 'git rev-parse HEAD', returnStdout: true
    return tag
}

pipeline {
    agent any
    environment{
        DOCKER_TAG = newtags()
    }
    stages('Build Docker Images'){
        steps{
            sh "docker build -t ngbinh14/webapp:${DOCKER_TAG} ."
        }
    }
}