pipeline {
    agent any
    
    environment {
        DOCKER_CREDENTIALS = credentials('docker-hub-credentials') // Using Jenkins credentials for Docker Hub
    }

    stages {
        stage('Build') {
            steps {
                // Grant executable permissions to the build script
                sh 'chmod +x build.sh'

                // Build the Docker image using the build script
                sh './build.sh'
            }
        }

        stage('Deploy') {
            steps {
                script {
                    // Login to Docker Hub using credentials stored in Jenkins
                    sh """
                    echo $DOCKER_CREDENTIALS_PSW | docker login -u $DOCKER_CREDENTIALS_USR --password-stdin
                    """
                }

                // Grant executable permissions to the deploy script
                sh 'chmod +x deploy.sh'

                // Deploy the Docker image using the deploy script
                sh './deploy.sh'
            }
        }
    }

    post {
        always {
            // Ensure Docker logout at the end of the pipeline
            sh 'docker logout'
        }
    }
}
