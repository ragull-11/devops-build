pipeline {
    agent any

    environment {
        DOCKER_USERNAME = credentials('docker-hub-credentials').username
        DOCKER_PASSWORD = credentials('docker-hub-credentials').password
    }

    stages {
        stage('Build and Push Docker Image') {
            steps {
                sh 'chmod +x build.sh'
                sh 'chmod +x deploy.sh'
                sh './build.sh'
                sh './deploy.sh'
            }
        }
    }
}
