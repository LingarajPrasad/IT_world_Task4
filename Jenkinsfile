pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/LingarajPrasad/IT_world_Task4.git'
            }
        }
        stage('build and push') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'dockerhub') {
                        sh "docker build -t lingarajprasad/task4_new:${env.BUILD_NUMBER} ."
                        sh "docker push lingarajprasad/task4_new:${env.BUILD_NUMBER}"
                    }
                }
            }
        }
        stage('run') {
            steps {
                script {
                    sh "docker pull lingarajprasad/task4_new:${env.BUILD_NUMBER}"
                    sh "docker rm -f api"
                    sh "docker run -d -p 3000:7000 --name api lingarajprasad/task4_new:${env.BUILD_NUMBER}"
                }
            }
        }
    }
}
