pipeline {
    agent any

    stages {

        stage('Checkout Code') {
            steps {
                git 'https://github.com/FranklinEmE/secure-cicd-aws-project.git'
            }
        }

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
