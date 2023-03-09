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
        stage('Push to DockerHub') {
            steps{
                withCredentials([string(credentialsId: 'docker', variable: 'dockerPass')]){
                sh "docker login -u ngbinh14 -p ${dockerPass}"
                sh "docker push ngbinh14/webapp:${DOCKER_TAG}"
            }
            }
            
        }
        stage('Deploy to K8s'){
            steps{
                sh "chmod +x updateTag.sh"
                sh "./updateTag.sh ${DOCKER_TAG}"
                    kubernetesDeploy (configs: 'product_deployment_app.yaml' kubeconfigId: 'k8spass')
                }
            }
        }
  }

def newtags(){
    def tag = sh script: 'git rev-parse HEAD', returnStdout: true
    return tag
}
