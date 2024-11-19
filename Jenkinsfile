pipeline {
    agent any

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