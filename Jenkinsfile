pipeline {
    agent any

    stages {

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t cicd-app .'
            }
        }

        stage('Stop Old Container') {
            steps {
                sh 'docker stop cicd-container || true'
                sh 'docker rm cicd-container || true'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker run -d -p 80:5000 --name cicd-container cicd-app'
            }
        }
    }
}
