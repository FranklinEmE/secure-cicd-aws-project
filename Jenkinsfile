pipeline {
    agent any

    options {
        timestamps()
        disableConcurrentBuilds()
    }

    environment {
        IMAGE_NAME = "cicd-app"
        DOCKERHUB_USER = "frankdocker1dvp"
    }

    stages {

        stage('Checkout Code') {
            steps {
                git branch: 'main', url: 'https://github.com/FranklinEmE/secure-cicd-aws-project.git'
            }
        }

        stage('Check Docker') {
            steps {
                sh "docker --version"
            }
        }

        stage('Build Docker Image') {
            steps {
                sh "docker build -t $IMAGE_NAME ."
            }
        }

        stage('Login to DockerHub') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-creds',
                    usernameVariable: 'USER',
                    passwordVariable: 'PASS'
                )]) {
                    sh "echo \"$PASS\" | docker login -u \"$USER\" --password-stdin"
                }
            }
        }

        stage('Tag Image') {
            steps {
                sh "docker tag $IMAGE_NAME $DOCKERHUB_USER/$IMAGE_NAME:latest"
            }
        }

        stage('Push Image') {
            steps {
                sh "docker push $DOCKERHUB_USER/$IMAGE_NAME:latest"
            }
        }

        stage('Cleanup') {
            steps {
                sh "docker system prune -f"
            }
        }
    }
}
